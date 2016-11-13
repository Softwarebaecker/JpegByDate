with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
with Ada.Strings.Bounded;
with Ada.Strings.Fixed;

Package ImageFile is

   type ExifData is
     tagged record
      filename : Unbounded_String;
      fileSize : Integer;
      date : String(1..10);
      Time : String(1..8);
      ImageWidth : Integer;
      ImageHeight : Integer;
   end record;

   type ExifDataAccess is access ExifData;

   --constructor
   function create(fileName : Unbounded_String) return ExifDataAccess;

  private
   littleEndian : Boolean;
   File : Ada.Streams.Stream_IO.File_Type;
   Input_Stream : Ada.Streams.Stream_IO.Stream_Access;
   TIFFHeaderEndPos : Ada.Streams.Stream_IO.Positive_Count;

   function checkFile return Boolean;
   procedure readFormat;
   procedure readFileSize(ExifDatas : ExifDataAccess);
   procedure readDateTime(ExifDatas : ExifDataAccess);
   procedure readImageWidth(ExidDatas : ExifDataAccess);
   procedure readImageHeight(ExidDatas : ExifDataAccess);

   function readInt(Position : Ada.Streams.Stream_IO.Positive_Count;
                    ByteCount : Integer) return Integer;
   function readString(Position : Ada.Streams.Stream_IO.Positive_Count;
                       Length : Integer) return String;
   function convertDate(Date : String) return String;

end ImageFile;
