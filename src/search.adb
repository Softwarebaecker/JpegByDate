Package body Search is
   --See https://rosettacode.org/wiki/Walk_a_directory/Non-recursively#Ada
   function searchDirectory (parameters : Param.params) return FileVector.Vector
     --searches the directory Directory for .jpg files and prints files with the pattern Pattern
   is
      currentSearch : Ada.Directories.Search_Type;
      dirEnt : Ada.Directories.Directory_Entry_Type;
      exifData : ImageFile.ExifDataAccess;
      fileVectorObj : FileVector.Vector;
   begin
      --get all files in the directory
      Ada.Directories.Start_Search(Search    => currentSearch,
                                   Directory => Ada.Strings.Unbounded.To_String(parameters.directory),
                                   Pattern   => filePattern);
      --filter the correct files
      while Ada.Directories.More_Entries(currentSearch) loop
         Ada.Directories.Get_Next_Entry(currentSearch, dirEnt);
         --only call create if dirEnt is a readable file
         if Ada.Directories.Kind(Directory_Entry => dirEnt) = Ada.Directories.Ordinary_File then
            exifData := ImageFile.create(Ada.Strings.Unbounded.To_Unbounded_String(Ada.Directories.Full_Name(dirEnt)));
            --add file to the vector if it fits the parameters
            if exifData /= null and then exifData.date = Ada.Strings.Unbounded.To_String(parameters.date) then
               FileVector.Append(Container => fileVectorObj,
                                 New_Item  => exifData);
            end if;
         end if;
      end loop;

      Ada.Directories.End_Search(currentSearch);
      return fileVectorObj;
   end searchDirectory;

   --function for the use with vectors
   function "="(imageFile1, imageFile2 : ImageFile.ExifDataAccess) return Boolean is
   begin
      if imageFile1.filename = imageFile2.filename then
         return True;
      else
         return False;
      end if;
   end "=";

end Search;
