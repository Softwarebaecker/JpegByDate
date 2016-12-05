with Ada.Containers.Vectors;
with Ada.Directories; use Ada.Directories;
with Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with GlobalTypes; use GlobalTypes;
with ImageFile; use ImageFile;
with Param;

Package Search is
   --package renames
   package Directories renames Ada.Directories;
   package IO renames Ada.Text_IO;

   --this function is needed for the Ada.Containers.Vectors package to be able
   --to work
   function "="(imageFile1, imageFile2 : ImageFile.ExifDataAccess) return Boolean;
   --the vector of files that contains the found files
   Package FileVector is new Ada.Containers.Vectors(Index_Type   => Natural,
                                                    Element_Type => ImageFile.ExifDataAccess);
   --searches the directory for files that fit the parameters
   function searchDirectory(parameters : Param.params) return FileVector.Vector;
private
   --attributes
   --the file pattern is not used currently, kept for easier changing
   filePattern : String := "";

   --subroutines
   --check whether the image fits the parameters
   function checkParameters(parameters : Param.params;
                            image : ImageFile.ExifDataAccess) return Boolean;
end Search;
