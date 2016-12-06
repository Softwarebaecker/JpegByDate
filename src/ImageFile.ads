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
   --open the commited file, read the exif datas and give a pointer to a ExifData type back.
   function create(fileName : Unbounded_String) return ExifDataAccess;

private

--attributes
   littleEndian : Boolean;
   File : Ada.Streams.Stream_IO.File_Type;
   Input_Stream : Ada.Streams.Stream_IO.Stream_Access;
   TIFFHeaderPos : Ada.Streams.Stream_IO.Positive_Count;
   IFD0 : Ada.Streams.Stream_IO.Positive_Count;
   ExifDatas : ExifDataAccess;

--subroutines

 --JPEG
   -- read a jpeg file and validat it
   procedure readJpegFiel;
   --checks the formate of a jpeg file
   procedure checkJpegFile;
   --search the exif tag for the tiff header
   procedure readExifTag;
   --read the tiff header in a jepg file
   procedure readTiffHeader;

 --TIFF
   --read the tiff file format
   procedure readTiffFile;

   --search the image file Directories for specific tags
   procedure readImageFileDirectories;
   --read the file size
   procedure readFileSize;
   --read the date and time tag (9003) from the exif data
   procedure readDateTime;
   --read the width pixel tag (A002) in the exif data
   procedure readImageWidth;
   --read the height pixel tag (A003) in the exif data
   procedure readImageHeight;

   --read a Integer with the commited lenth from the open file
   function readInt(ByteCount : Integer) return Integer;
   --read a string with a specific length from the file
   function readString(Position : Ada.Streams.Stream_IO.Positive_Count;
                       Length : Integer) return String;

   --convert the date in the ISO formate
   function convertDate(Date : DateType) return DateType;

end ImageFile;
