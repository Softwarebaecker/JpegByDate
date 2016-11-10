with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;

Package ImageFile is

   type ExifData is
     tagged record
      filename : Unbounded_String;
      date : Unbounded_String;
      Time : Unbounded_String;

   end record;

   --Konstruktor
   function create(fileName : String) return access ExifData;

  private
   littleEndian : Boolean;
   File : Ada.Streams.Stream_IO.File_Type;
   Input_Stream : Ada.Streams.Stream_IO.Stream_Access;

   function checkFile return Boolean;

   function readDateTime return Boolean;

   function readInt(position : Integer) return Integer;
   function readCharakter(position : Integer) return Character;



end ImageFile;
