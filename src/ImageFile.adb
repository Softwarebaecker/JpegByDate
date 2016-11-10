      --Buffer := Character'Input(Input_Stream);
      --Ada.Text_IO.Put(Integer'Image(Character'Pos(Buffer)));
      --Buffer := Character'Input(Input_Stream);
      --Ada.Text_IO.Put(Integer'Image(Character'Pos(Buffer)));

Package body ImageFile is

   function create(fileName : String) return access ExifData is
      Buffer : Character;
      PositionTemplate : Short_Integer;
      ExifDatas : access ExifData := new ExifData;
   begin
      --open FileStream
      Ada.Streams.Stream_IO.Open(File, Ada.Streams.Stream_IO.In_File, filename);
      Input_Stream := Ada.Streams.Stream_IO.Stream(File);




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

      Set_Index(File, Ada.Streams.Stream_IO.Size(File)-2);
      --Jpeg End FF D9
      if Character'Input(Input_Stream) /= Character'Val(16#FF#) and
        Character'Input(Input_Stream) /= Character'Val(16#D9#) then
         --No Jepeg
         return FALSE;
      end if;


      Set_Index(File, 7);
      --read Exif Header
      if Character'Input(Input_Stream) /= Character'Val(16#45#) or
        Character'Input(Input_Stream) /= Character'Val(16#78#) or
        Character'Input(Input_Stream) /= Character'Val(16#69#) or
        Character'Input(Input_Stream) /= Character'Val(16#66#) or
        Character'Input(Input_Stream) /= Character'Val(16#00#) or
        Character'Input(Input_Stream) /= Character'Val(16#00#) then
         --throw exception
         Put_Line("No EXIF Header");
         return False;
      end if;
      -- Intel: 49 49 2a 00 08 00 00 00 = LLHH
      -- TI:    4d 4d 00 2a 00 00 00 08 = HHLL

                end checkFile;


   function readDateTime return Boolean is
   begin

      return FALSE;

   end readDateTime;


   function readInt(position : Integer) return Integer is
   begin

      return 0;

   end readInt;

   function readCharakter(position : Integer) return Character is
   begin

      return 'c';

   end readCharakter;

end ImageFile;
