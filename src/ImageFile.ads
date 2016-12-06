with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
with Ada.Strings.Bounded;
with Ada.Strings.Fixed;
with Ada.Directories;
with GlobalTypes; use GlobalTypes;

with Ada.Text_IO.Unbounded_IO;

Package ImageFile is

   type ExifData is
     tagged record
      filename : FileNameType;
      fileSize : FileSizeType;
      date : DateType := "          ";
      time : TimeType := "        ";
      imageWidth : ImageSizeType := 1;
      imageHeight : ImageSizeType := 1;
   end record;

   type ExifDataAccess is access ExifData;

   --exceptions
   ExceptionFileNotOpen : exception;
   ExceptionFileTypeError : exception;
   ExceptionWrongImageTag : exception;
   ExceptionNoExifTag : exception;
   ExceptionNoTiffHeader : exception;
   ExceptionTiffError : exception;
   ExceptionReadError : exception;

   --constructor
   function create(fileName : Unbounded_String) return ExifDataAccess;

  private
   littleEndian : Boolean;
   File : Ada.Streams.Stream_IO.File_Type;
   Input_Stream : Ada.Streams.Stream_IO.Stream_Access;
   TIFFHeaderPos : Ada.Streams.Stream_IO.Positive_Count;
   IFD0 : Ada.Streams.Stream_IO.Positive_Count;
   ExifDatas : ExifDataAccess;

   --JPEG
   procedure readJpegFiel;
   procedure checkJpegFile;
   procedure readExifTag;
   procedure readTiffHeader;

   --TIFF
   procedure readTiffFile;

   procedure readImageFileDirectories;
   procedure readFileSize;
   procedure readDateTime;
   procedure readImageWidth;
   procedure readImageHeight;

   function readInt(ByteCount : Integer) return Integer;
   function readString(Position : Ada.Streams.Stream_IO.Positive_Count;
                       Length : Integer) return String;

   function convertDate(Date : DateType) return DateType;

end ImageFile;
