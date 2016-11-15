      --Buffer := Character'Input(Input_Stream);
      --Ada.Text_IO.Put(Integer'Image(Character'Pos(Buffer)));
      --Buffer := Character'Input(Input_Stream);
      --Ada.Text_IO.Put(Integer'Image(Character'Pos(Buffer)));

Package body ImageFile is

   function create(fileName : Unbounded_String) return ExifDataAccess is
   begin
      ExifDatas := new ExifData;
      ExifDatas.filename := fileName;
      --open FileStream
      Ada.Streams.Stream_IO.Open(File, Ada.Streams.Stream_IO.In_File,
                                 Ada.Strings.Unbounded.To_String(filename));
      Input_Stream := Ada.Streams.Stream_IO.Stream(File);

      readFileSize;

      if ExifDatas.fileSize < 1 then
         raise ExceptionFileNotOpen;
      end if;

      checkFile;

      readExifTag;
      --read Format
      readTiffHeader;

      readImageFileDirectories;

      Close(File);
      return ExifDatas;

   end create;

   procedure checkFile is
   begin
      --Jpeg Beginn FF D8
      if Character'Input(Input_Stream) /= Character'Val(16#FF#) and
        Character'Input(Input_Stream) /= Character'Val(16#D8#) then
         --No Jepeg
         raise ExceptionWrongImageTag;
      end if;

      Set_Index(File, Ada.Streams.Stream_IO.Size(File)-1);
      --Jpeg End FF D9
      if Character'Input(Input_Stream) /= Character'Val(16#FF#) and then
        Character'Input(Input_Stream) /= Character'Val(16#D9#) then
         --No Jepeg
         raise ExceptionWrongImageTag;
      end if;
   end checkFile;

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
      raise ExceptionNoExifTag;
   end readExifTag;


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
      else if Character'Input(Input_Stream) = Character'Val(16#4d#) and
        Character'Input(Input_Stream) = Character'Val(16#4d#) and
        Character'Input(Input_Stream) = Character'Val(16#00#) and
        Character'Input(Input_Stream) = Character'Val(16#2a#) and
        Character'Input(Input_Stream) = Character'Val(16#00#) and
        Character'Input(Input_Stream) = Character'Val(16#00#) and
        Character'Input(Input_Stream) = Character'Val(16#00#) and
        Character'Input(Input_Stream) = Character'Val(16#08#) then
         --set Motorola Format
            littleEndian := FALSE;
         end if;
      end if;
   end readTiffHeader;

   procedure readImageFileDirectories is
      entryCount : Integer;
      IFDStartPosition : Ada.Streams.Stream_IO.Positive_Count;
   begin
      -- read count of Entrys in IFD0
      Set_Index(File, TIFFHeaderPos + 8);
      entryCount := readInt(Index(File), 2);

      -- IFD0 not used

      --set Index to Entry with the pointer to IFD1
      Set_Index(File, Index(File) + Ada.Streams.Stream_IO.Positive_Count(12 * entryCount));

      if Character'Input(Input_Stream) /= Character'Val(16#87#) or
        Character'Input(Input_Stream) /= Character'Val(16#69#) then
         raise ExceptionTiffError;
      end if;

      -- read beginn position from IFD1 and set the Stream to the Index
      Set_Index(File, Ada.Streams.Stream_IO.Positive_Count(readInt(Index(File), 2)) + TIFFHeaderPos);

      -- read count of Entry in IFD1
      entryCount := readInt(Index(File), 2);
      IFDStartPosition := Index(File);
      for i in 1 .. entryCount loop
         readIFDEntry(IFDStartPosition + Ada.Streams.Stream_IO.Positive_Count(12 * i - 1));
      end loop;

   end readImageFileDirectories;


   procedure readIFDEntry(Position : Ada.Streams.Stream_IO.Positive_Count) is
      firstCharacter : Character;
      secondCharacter : Character;
   begin
      Set_Index(File, Position);
      firstCharacter := Character'Input(Input_Stream);
      secondCharacter := Character'Input(Input_Stream);

      if firstCharacter = Character'Val(16#90#) and then
        secondCharacter = Character'Val(16#03#) then
         readDateTime;
      end if;

   end readIFDEntry;


   procedure readFileSize is
   begin
      ExifDatas.fileSize := Integer(Size(File));
   end readFileSize;

   procedure readDateTime is
      DatePosition : Integer;
   begin

      if Character'Input(Input_Stream) = Character'Val(16#00#) and then
        Character'Input(Input_Stream) = Character'Val(16#02#) and then
        Character'Input(Input_Stream) = Character'Val(16#00#) and then
        Character'Input(Input_Stream) = Character'Val(16#00#) and then
        Character'Input(Input_Stream) = Character'Val(16#00#) and then
        Character'Input(Input_Stream) = Character'Val(16#14#) then

        --read Position
        DatePosition := readInt(Index(File), 4);

        --read Date
        ExifDatas.date := readString(Ada.Streams.Stream_IO.Positive_Count(DatePosition) + TIFFHeaderPos, 10);
        ExifDatas.date := convertDate(ExifDatas.date);
        --read Time
         ExifDatas.Time := readString(Ada.Streams.Stream_IO.Positive_Count(DatePosition) + 11 + TIFFHeaderPos, 8);
      else
         raise ExceptionReadError;
      end if;
   end readDateTime;

   procedure readImageWidth is
   begin
      -- width =  A002

      Ada.Text_IO.Put_Line("width");

   end readImageWidth;

   procedure readImageHeight is
   begin
      -- Height =  A003

      Ada.Text_IO.Put_Line("Height");

   end readImageHeight;


   function readInt(Position : Ada.Streams.Stream_IO.Positive_Count ;
                    ByteCount : Integer) return Integer is
      characterPosition : Ada.Streams.Stream_IO.Positive_Count;
      readCharacter : Character;
      return32Int : Integer;
   begin
      if ByteCount > 1 then
         return32Int := readInt(Position, ByteCount - 1);
         characterPosition := Position + Ada.Streams.Stream_IO.Positive_Count (ByteCount) - 1;
      end if;

      --set Index to Position
      Set_Index(File,characterPosition);

      --read two bytes
      readCharacter := Character'Input(Input_Stream);

      --calculate Integer
      if littleEndian = TRUE then --litteleendian LLHH
         return (Character'Pos(readCharacter) * ((2 ** 8) ** ByteCount)) + return32Int;
      else --bigendian HHLL
         return (return32Int * (2 ** 8)) + Character'Pos(readCharacter);
      end if;
   end readInt;

   function readString(Position : Ada.Streams.Stream_IO.Positive_Count;
                       Length : Integer) return String is
      Counter : Integer := 1;
      Return_String : Unbounded_String;
   begin
      --set Index to Position
      Set_Index(File,Position);
      --read Charakter
      while Counter <= Length loop
         Ada.Strings.Unbounded.Append(Return_String, Character'Input(Input_Stream));
         Counter := Counter + 1;
      end loop;

      --Ada.Text_IO.Put_Line(Ada.Strings.Unbounded.To_String(Return_String));
      return Ada.Strings.Unbounded.To_String(Return_String);

   end readString;

   function convertDate(Date : String) return String is
      returnString : String(1..10) := Date;
   begin
      returnString := Ada.Strings.Fixed.Overwrite(returnString, 5, "-");
      returnString := Ada.Strings.Fixed.Overwrite(returnString, 8, "-");

      return returnString;
   end convertDate;


end ImageFile;
