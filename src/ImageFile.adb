with Ada.Strings.Maps.Constants;

Package body ImageFile is

   function create(fileName : Unbounded_String) return ExifDataAccess is
      Extension : Unbounded_String;
   begin
      ExifDatas := new ExifData;
      ExifDatas.filename := fileName;

      --get file extension
      Extension := To_Unbounded_String(Ada.Directories.Extension(Ada.Strings.Unbounded.To_String(ExifDatas.filename)));
      --file extension to lowercase
      Extension := To_Unbounded_String(Ada.Strings.Fixed.Translate(To_String(Extension), Ada.Strings.Maps.Constants.Lower_Case_Map));

      --check file extension
      if Extension = "jpeg" or Extension = "jpg" or Extension = "jpe" or Extension = "jfif" then
         readJpegFiel;
      else if Extension = "tif" then
            readTiffFile;
         else
            --no ligal file extension
            raise ExceptionFileTypeError;
         end if;
      end if;

      --read the exif datas
      readImageFileDirectories;

      Close(File);
      return ExifDatas;

   end create;

   -- read a jpeg file and validat it
   procedure readJpegFiel is
   begin
      --open FileStream
      Ada.Streams.Stream_IO.Open(File, Ada.Streams.Stream_IO.In_File,
                                 Ada.Strings.Unbounded.To_String(ExifDatas.filename));
      Input_Stream := Ada.Streams.Stream_IO.Stream(File);
      readFileSize;

      if ExifDatas.fileSize < 1 then
         raise ExceptionFileNotOpen;
      end if;

      checkJpegFile;
      readExifTag;
      readTiffHeader;
      IFD0 := TIFFHeaderPos + 9;

   end readJpegFiel;

   --checks the formate of a jpeg file
   procedure checkJpegFile is
   begin
      --Jpeg Beginn FF D8
      if Character'Input(Input_Stream) /= Character'Val(16#FF#) and
        Character'Input(Input_Stream) /= Character'Val(16#D8#) then
         --No Jepeg
         Close(File);
         raise ExceptionWrongImageTag;
      end if;

      Set_Index(File, Ada.Streams.Stream_IO.Size(File)-1);
      --Jpeg End FF D9
      if Character'Input(Input_Stream) /= Character'Val(16#FF#) and then
        Character'Input(Input_Stream) /= Character'Val(16#D9#) then
         --No Jepeg
         Close(File);
         raise ExceptionWrongImageTag;
      end if;
   end checkJpegFile;

   --search the exif tag for the tiff header
   procedure readExifTag is
   begin
      --find Exif Tag
      Set_Index(File, 1);
      while Index(File) <= Size(File) - 6 loop
      if Character'Input(Input_Stream) = Character'Val(16#45#) and then
           Character'Input(Input_Stream) = Character'Val(16#78#) and then
           Character'Input(Input_Stream) = Character'Val(16#69#) and then
           Character'Input(Input_Stream) = Character'Val(16#66#) and then
           Character'Input(Input_Stream) = Character'Val(16#00#) and then
           Character'Input(Input_Stream) = Character'Val(16#00#) then
      -- save the endposition of the TIFF Header
      TIFFHeaderPos := Index(File) - 1;
            return;
         end if;
      end loop;
      Close(File);
      --Ada.Text_IO.Put_Line(To_String(ExifDatas.filename));
      raise ExceptionNoExifTag;
   end readExifTag;

   --read the tiff header in a jepg file
   procedure readTiffHeader is
   begin
      -- Intel: 49 49 2a 00 08 00 00 00 = LLHH
      -- Motorola:    4d 4d 00 2a 00 00 00 08 = HHLL
      if Character'Input(Input_Stream) = Character'Val(16#49#) and
        Character'Input(Input_Stream) = Character'Val(16#49#) and
        Character'Input(Input_Stream) = Character'Val(16#2a#) and
        Character'Input(Input_Stream) = Character'Val(16#00#) and
        Character'Input(Input_Stream) = Character'Val(16#08#) and
        Character'Input(Input_Stream) = Character'Val(16#00#) and
        Character'Input(Input_Stream) = Character'Val(16#00#) and
        Character'Input(Input_Stream) = Character'Val(16#00#) then
         --set to Intel Format
         littleEndian := TRUE;
      else
            littleEndian := FALSE;
      end if;
   end readTiffHeader;

   --read the tiff file format
   procedure readTiffFile is
      byte : Character;
   begin
      --open FileStream
      Ada.Streams.Stream_IO.Open(File, Ada.Streams.Stream_IO.In_File,
                                 Ada.Strings.Unbounded.To_String(ExifDatas.filename));
      Input_Stream := Ada.Streams.Stream_IO.Stream(File);

      readFileSize;
      --check file size
      if ExifDatas.fileSize < 1 then
         raise ExceptionFileNotOpen;
      end if;

      --first 49 49 2a 00 / 4d 4d 00 2a
      --read first tag
      byte := Character'Input(Input_Stream);

      --check format
      if byte = Character'Val(16#49#) and then --little endian
         Character'Input(Input_Stream) = Character'Val(16#49#) and then
           Character'Input(Input_Stream) = Character'Val(16#2a#) and then
           Character'Input(Input_Stream) = Character'Val(16#00#) then
         littleEndian := True;
      else if byte = Character'Val(16#4d#) and then --big endian
            Character'Input(Input_Stream) = Character'Val(16#4d#) and then
              Character'Input(Input_Stream) = Character'Val(16#00#) and then
              Character'Input(Input_Stream) = Character'Val(16#2a#) then
              littleEndian := False;
         else
            --wrong file format
            raise ExceptionNoTiffHeader;
         end if;
         TIFFHeaderPos := 1;
         IFD0 := Ada.Streams.Stream_IO.Positive_Count(readInt(4));
      end if;
   end readTiffFile;

   --search the image file Directories for specific tags
   procedure readImageFileDirectories is
      entryCount : Integer := 0;
      readTag : Integer := 0;
      subDirPos : Integer := 0;
   begin
      -- read count of Entrys in IFD0
      Set_Index(File, IFD0);
      entryCount := readInt(2);
      --search in IFD0 and Sub Dirs
      while entryCount > 0 loop
         --test filesize
         if ExifDatas.fileSize <= GlobalTypes.FileSizeType(Index(File)) + 10 then
            return;
         end if;

         --read Tag
         readTag := readInt(2);
         if readTag = Integer(16#9003#) then
            readDateTime;
            entryCount := entryCount - 1;
         else if readTag = Integer(16#8769#) then
               --read SubDir
               Set_Index(File, Index(File) + 6);
               subDirPos := readInt(4);
               Set_Index(File, Ada.Streams.Stream_IO.Positive_Count(subDirPos) + TIFFHeaderPos + 1);
               entryCount := readInt(2);
            else if readTag = Integer(16#A002#) then
                  --read X-size
                  readImageWidth;
               else if readTag = Integer(16#A003#) then
                     --read Y-size
                     readImageHeight;
                  else
                     Set_Index(File, Index(File) + 10);
                     entryCount := entryCount - 1;
                  end if;
               end if;

            end if;
         end if;
      end loop;
   end readImageFileDirectories;

   procedure readFileSize is
   begin
      ExifDatas.fileSize := FileSizeType(Size(File));
   end readFileSize;

   procedure readDateTime is
      DatePosition : Integer;
      saveIndex : Ada.Streams.Stream_IO.Positive_Count;
   begin
      Set_Index(File, Index(File) + 6);
      --read Position
      DatePosition := readInt(4);

      --save index of entry
      saveIndex := Index(File);

      --read Date
      ExifDatas.date := DateType(readString(Ada.Streams.Stream_IO.Positive_Count(DatePosition) + TIFFHeaderPos + 1, 10));
      ExifDatas.date := convertDate(ExifDatas.date);
      --read Time
      ExifDatas.time := TimeType(readString(Ada.Streams.Stream_IO.Positive_Count(DatePosition) + 12 + TIFFHeaderPos, 8));

      --set index back to entry
      Set_Index(File, saveIndex);
   end readDateTime;

   procedure readImageWidth is
      VariableType : Integer;
   begin

      --read Type;
      VariableType := readInt(2);
      Set_Index(File, Index(File) + 4);
      --read image Height
      if VariableType = 3 then
         ExifDatas.imageWidth := ImageSizeType(readInt(2));
       else if VariableType = 4 then
            ExifDatas.imageWidth := ImageSizeType(readInt(4));
         else
            return;
         end if;

      end if;

   end readImageWidth;

   procedure readImageHeight is
      VariableType : Integer;
   begin
      --read variable type;
      VariableType := readInt(2);
      Set_Index(File, Index(File) + 4);
      --read image Height
      if VariableType = 3 then
         ExifDatas.imageHeight := ImageSizeType(readInt(2));
      else if VariableType = 4 then
            ExifDatas.imageHeight := ImageSizeType(readInt(4));
         else
            return;
         end if;
      end if;
   end readImageHeight;


   function readInt(ByteCount : Integer) return Integer is
      readCharacter : Character;
      return32Int : Integer := 0;
   begin
      if ByteCount > 1 then
         return32Int := readInt(ByteCount - 1);
      end if;

      --read two bytes
      readCharacter := Character'Input(Input_Stream);

      --calculate Integer
      if littleEndian = TRUE then --litteleendian LLHH
         --Ada.Text_IO.Put_Line("LLHH");
         return (Character'Pos(readCharacter) * ((2 ** 8) ** (ByteCount - 1))) + return32Int;
      else --bigendian HHLL
         return (return32Int * (2 ** 8)) + Character'Pos(readCharacter);
      end if;
   end readInt;

   --read a string with a specific length from the file
   function readString(Position : Ada.Streams.Stream_IO.Positive_Count;
                       Length : Integer) return String is
      Counter : Integer := 1;
      Return_String : Unbounded_String;
   begin
      --set index to position
      Set_Index(File,Position);
      --read charakters
      while Counter <= Length loop
         Ada.Strings.Unbounded.Append(Return_String, Character'Input(Input_Stream));
         Counter := Counter + 1;
      end loop;

      --Ada.Text_IO.Put_Line(Ada.Strings.Unbounded.To_String(Return_String));
      return Ada.Strings.Unbounded.To_String(Return_String);

   end readString;

   --convert the date in the ISO formate
   function convertDate(Date : DateType) return DateType is
      returnString : DateType := Date;
   begin
      returnString := DateType(Ada.Strings.Fixed.Overwrite(String(returnString), 5, "-"));
      returnString := DateType(Ada.Strings.Fixed.Overwrite(String(returnString), 8, "-"));

      return returnString;
   end convertDate;


end ImageFile;
