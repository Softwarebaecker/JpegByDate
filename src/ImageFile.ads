with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
with Ada.Strings.Bounded;
with Ada.Strings.Fixed;

with Ada.Text_IO.Unbounded_IO;

Package ImageFile is

   type ExifData is
     tagged record
      filename : Unbounded_String;
      fileSize : Integer;
      date : String(1..10);
      time : String(1..8);
      imageWidth : Integer;
      imageHeight : Integer;
   end record;

   type ExifDataAccess is access ExifData;

   --exceptions
   ExceptionFileNotOpen : exception;
   ExceptionWrongImageTag : exception;
   ExceptionNoExifTag : exception;
   ExceptionTiffError : exception;
   ExceptionReadError : exception;

   --constructor
   function create(fileName : Unbounded_String) return ExifDataAccess;

  private
   littleEndian : Boolean;
   File : Ada.Streams.Stream_IO.File_Type;
   Input_Stream : Ada.Streams.Stream_IO.Stream_Access;
   TIFFHeaderPos : Ada.Streams.Stream_IO.Positive_Count;
   ExifDatas : ExifDataAccess;

   procedure checkFile;
   procedure readExifTag;
   procedure readTiffHeader;
   procedure readImageFileDirectories;
   procedure readFileSize;
   procedure readDateTime;
   procedure readImageWidth;
   procedure readImageHeight;

   function readInt(ByteCount : Integer) return Integer;
   function readString(Position : Ada.Streams.Stream_IO.Positive_Count;
                       Length : Integer) return String;
   function convertDate(Date : String) return String;

end ImageFile;
