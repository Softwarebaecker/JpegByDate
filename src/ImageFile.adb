      --Buffer := Character'Input(Input_Stream);
      --Ada.Text_IO.Put(Integer'Image(Character'Pos(Buffer)));
      --Buffer := Character'Input(Input_Stream);
      --Ada.Text_IO.Put(Integer'Image(Character'Pos(Buffer)));

Package body ImageFile is

   function create(fileName : Unbounded_String) return ExifDataAccess is
      ExifDatas : ExifDataAccess := new ExifData;
   begin
      ExifDatas.filename := fileName;
      --open FileStream
      Ada.Streams.Stream_IO.Open(File, Ada.Streams.Stream_IO.In_File,
                                 Ada.Strings.Unbounded.To_String(filename));
      Input_Stream := Ada.Streams.Stream_IO.Stream(File);

      if checkFile = FALSE then
         Close(File);
         return null;
      end if;

      --read Format
      readFormat;

      --read Date and Time
      readDateTime(ExifDatas);

      Close(File);
      return ExifDatas;

   end create;

   function checkFile return Boolean is
   begin
      --Jpeg Beginn FF D8
      if Character'Input(Input_Stream) /= Character'Val(16#FF#) and
        Character'Input(Input_Stream) /= Character'Val(16#D8#) then
         --No Jepeg
         return FALSE;

      end if;

      Set_Index(File, Ada.Streams.Stream_IO.Size(File)-1);
      --Jpeg End FF D9
      if Character'Input(Input_Stream) /= Character'Val(16#FF#) and
        Character'Input(Input_Stream) /= Character'Val(16#D9#) then
         --No Jepeg
         return FALSE;
      end if;

      --find TIFF Header
      Set_Index(File, 1);
      while Index(File) <= Size(File) - 6 loop
      if Character'Input(Input_Stream) = Character'Val(16#45#) and then
           Character'Input(Input_Stream) = Character'Val(16#78#) and then
           Character'Input(Input_Stream) = Character'Val(16#69#) and then
           Character'Input(Input_Stream) = Character'Val(16#66#) and then
           Character'Input(Input_Stream) = Character'Val(16#00#) and then
           Character'Input(Input_Stream) = Character'Val(16#00#) then
      -- save the endposition of the TIFF Header
      TIFFHeaderEndPos := Index(File) - 1;
            return TRUE;
         end if;
      end loop;
      return FALSE;
   end checkFile;


   procedure readFormat is
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
         littleEndian := FALSE;
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
   end readFormat;


   procedure readDateTime(ExifDatas : ExifDataAccess) is
      DatePosition : Integer;
   begin
      Set_Index(File,TIFFHeaderEndPos);
      while Index(File) <= Size(File) - 6 loop
         if Character'Input(Input_Stream) = Character'Val(16#90#) and then
           Character'Input(Input_Stream) = Character'Val(16#03#) and then
           Character'Input(Input_Stream) = Character'Val(16#00#) and then
           Character'Input(Input_Stream) = Character'Val(16#02#) and then
           Character'Input(Input_Stream) = Character'Val(16#00#) and then
           Character'Input(Input_Stream) = Character'Val(16#00#) and then
           Character'Input(Input_Stream) = Character'Val(16#00#) and then
           Character'Input(Input_Stream) = Character'Val(16#14#) then

            --read Position
            DatePosition := readInt(Index(File), 4);
            DatePosition := readInt(Index(File), 4) + 1;

            --read Date
            ExifDatas.date := readString(Ada.Streams.Stream_IO.Positive_Count(DatePosition) + TIFFHeaderEndPos, 10);
            ExifDatas.date := convertDate(ExifDatas.date);
            --read Time
            ExifDatas.Time := readString(Ada.Streams.Stream_IO.Positive_Count(DatePosition) + 11 + TIFFHeaderEndPos, 8);
         end if;
      end loop;

   end readDateTime;


   function readInt(Position : Ada.Streams.Stream_IO.Positive_Count ;
                    ByteCount : Integer) return Integer is
      firstCharacter : Character;
      secondCharacter : Character;
   begin
      --set Index to Position
      Set_Index(File,Position);

      --read two byts
      firstCharacter := Character'Input(Input_Stream);
      secondCharacter := Character'Input(Input_Stream);

      --calculate Integer
      if littleEndian = TRUE then --litteleendian LLHH
         return Character'Pos(secondCharacter) * 16#100#
         + Character'Pos(firstCharacter);
      else --bigendian HHLL
         return Character'Pos(firstCharacter) * 16#100#
         + Character'Pos(secondCharacter);
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
