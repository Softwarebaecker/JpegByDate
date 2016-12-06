Package body Search is


   function searchDirectory (parameters : Param.params) return FileVector.Vector
   --Searches for image files, with the parameters provided
   --returns a vector with the images that fit the parameters
   --See https://rosettacode.org/wiki/Walk_a_directory/Non-recursively#Ada
   is
      parametersCopy : Param.params;
      currentSearch : Directories.Search_Type;
      dirEnt : Directories.Directory_Entry_Type;
      exifDataObj : ImageFile.ExifDataAccess;
      fileVectorObj : FileVector.Vector;
      addFileToVector : Boolean := True;
   begin

      --search the files in the directory
      --files that don't fit the filename parameter, will not be returned
      Directories.Start_Search(Search    => currentSearch,
                               Directory => Ada.Strings.Unbounded.To_String(Ada.Strings.Unbounded.Unbounded_String(parameters.directory)),
                               Pattern   => To_String(parameters.fileName));

      --filter the correct files
      while Directories.More_Entries(currentSearch) loop
         Directories.Get_Next_Entry(currentSearch, dirEnt);
         begin
            --reset addFileToVector
            addFileToVector := True;

            --skip file "."
            if Directories.Simple_Name(dirEnt) = "." then
               Directories.Get_Next_Entry(currentSearch, dirEnt);
            end if;

            --skip file ".."
            if Directories.Simple_Name(dirEnt) = ".." then
               Directories.Get_Next_Entry(currentSearch, dirEnt);
            end if;

            --when isRecursive is TRUE search recursively
            if parameters.isRecursive then

               --when the dirEnt is a directory, call searchDirectory
               if Directories.Kind(Directory_Entry => dirEnt) = Directories.Directory then

                  --change the parameter to the found directory
                  parametersCopy := parameters;
                  parametersCopy.directory := DirectoryType(Ada.Strings.Unbounded.To_Unbounded_String(Directories.Full_Name(dirEnt)));

                  --call searchDirectory again and append the returned vector
                  FileVector.Append(Container => fileVectorObj,
                                    New_Item  => searchDirectory(parametersCopy));
               end if;
            end if;

            --only call create, if dirEnt is a readable file
            if Directories.Kind(Directory_Entry => dirEnt) = Directories.Ordinary_File then

               --if the dirEnt is not a file with the correct format, an
               --exception is thrown
               exifDataObj := ImageFile.create(Ada.Strings.Unbounded.To_Unbounded_String(Directories.Full_Name(dirEnt)));

               --add file to the vector if it fits the parameters
               if checkParameters(parameters, exifDataObj) then
                  FileVector.Append(Container => fileVectorObj,
                                    New_Item  => exifDataObj);
               end if;

            end if;
         exception
            when others =>
               --catch the exception from ImageFile.create()
               null;
         end;
      end loop;

      --end the search and return the vector
      Directories.End_Search(currentSearch);
      return fileVectorObj;
   end searchDirectory;

   function checkParameters(parameters : Param.params;
                            image : ImageFile.ExifDataAccess) return Boolean
   --check whether the image fits to the parameters
   --returns true if the image fits the parameters that aren't on their default
   --value
   is
      fileFitsParameters : Boolean := True;
   begin
      --if the values of the parameters are on their default values then they
      --don't have to be checked

      --check for parameter date
      if parameters.date /= "          " and then
        parameters.date /= image.date then
         fileFitsParameters := False;
      end if;

      --if the file already doesn't fit the parameters the rest of the
      --parameters are not checked anymore

      --check for parameter image width
      if fileFitsParameters and then
        parameters.imageSizeX /= 1 and then
        parameters.imageSizeX > image.imageWidth then
         fileFitsParameters := False;
      end if;

      --check for parameter image height
      if fileFitsParameters and then
        parameters.imageSizeY /= 1 and then
        parameters.imageSizeY > image.imageHeight then
         fileFitsParameters := False;
      end if;

      --check for parameter size
      if fileFitsParameters and then
        parameters.fileSize /= 1 and then
        parameters.fileSize > image.fileSize then
         fileFitsParameters := False;
      end if;

      --check for parameter date range
      if fileFitsParameters and then
        parameters.dateRangeStart /= "          " and then
        parameters.dateRangeStart > image.date then
         fileFitsParameters := False;
      end if;

      if fileFitsParameters and then
        parameters.dateRangeEnd /= "          " and then
        parameters.dateRangeStart < image.date then
         fileFitsParameters := False;
      end if;

      --check for parameter time
      if fileFitsParameters and then
        parameters.dateTime /= "        " and then
        parameters.dateTime > image.time then
         fileFitsParameters := False;
      end if;

      return fileFitsParameters;
   end checkParameters;


   function "="(imageFile1, imageFile2 : ImageFile.ExifDataAccess) return Boolean
   --function for the use with vectors
   --returns true if the two image files have the same file name
   is
   begin
      if imageFile1 /= null and then imageFile2 /= null and then imageFile1.filename = imageFile2.filename then
         return True;
      else
         return False;
      end if;
   end "=";

end Search;
