with Ada.Containers.Vectors;
with Ada.Directories; use Ada.Directories;
with Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with ImageFile; use ImageFile;
with Param;

Package Search is
   package Directories renames Ada.Directories;
   package IO renames Ada.Text_IO;

   function "="(imageFile1, imageFile2 : ImageFile.ExifDataAccess) return Boolean;
   Package FileVector is new Ada.Containers.Vectors(Index_Type   => Natural,
                                                    Element_Type => ImageFile.ExifDataAccess);
   function searchDirectory(parameters : Param.params) return FileVector.Vector;
private
   filePattern : String := ""; --no file pattern is used currently, kept for easier changing
end Search;
