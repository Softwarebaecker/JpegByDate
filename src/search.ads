with Ada.Containers.Vectors;
with Ada.Directories; use Ada.Directories;
with Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with ImageFile;
with Param;

Package Search is
   function "="(imageFile1, imageFile2 : ImageFile.ExifDataAccess) return Boolean;
   Package FileVector is new Ada.Containers.Vectors(Index_Type   => Natural,
                                                    Element_Type => ImageFile.ExifDataAccess);
   function searchDirectory(parameters : Param.params) return FileVector.Vector;
private
   filePattern : String := "";
end Search;
