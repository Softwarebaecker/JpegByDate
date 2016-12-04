Package body Search is
   --See https://rosettacode.org/wiki/Walk_a_directory/Non-recursively#Ada
   function searchDirectory (parameters : Param.params) return FileVector.Vector
   is
      parametersCopy : Param.params;
      currentSearch : Directories.Search_Type;
      dirEnt : Directories.Directory_Entry_Type;
      exifDataObj : ImageFile.ExifDataAccess;
      fileVectorObj : FileVector.Vector;
      checkDate : Boolean;
      addFileToVector : Boolean := True;
   begin
      --check for parameters
      if parameters.date = "" then
         checkDate := False;
      else
         checkDate := True;
      end if;

      --get all files in the directory
      Directories.Start_Search(Search    => currentSearch,
                               Directory => Ada.Strings.Unbounded.To_String(parameters.directory),
                               Pattern   => filePattern);

      --skip files "." and ".."
      Directories.Get_Next_Entry(currentSearch, dirEnt);
      Directories.Get_Next_Entry(currentSearch, dirEnt);

      --filter the correct files
      while Directories.More_Entries(currentSearch) loop
         Directories.Get_Next_Entry(currentSearch, dirEnt);
         begin
            --reset addFileToVector
            addFileToVector := True;

            --when isRecursive is TRUE search recursilvely
            if parameters.isRecursive then

               --when the dirEnt is a directory, call searchDirectory
               if Directories.Kind(Directory_Entry => dirEnt) = Directories.Directory then

                  --change the parameter to the found directory
                  parametersCopy := parameters;
                  parametersCopy.directory := Ada.Strings.Unbounded.To_Unbounded_String(Directories.Full_Name(dirEnt));

                  --call searchDirectory again and append the returned vector
                  FileVector.Append(Container => fileVectorObj,
                                    New_Item  => searchDirectory(parametersCopy));
               end if;
            end if;

            --only call create if dirEnt is a readable file
            if Directories.Kind(Directory_Entry => dirEnt) = Directories.Ordinary_File then

               exifDataObj := ImageFile.create(Ada.Strings.Unbounded.To_Unbounded_String(Directories.Full_Name(dirEnt)));

               --add file to the vector if it fits the parameters

               --check if the file fits the date parameter
               if checkDate and then String(exifDataObj.date) /= Ada.Strings.Unbounded.To_String(parameters.date) then
                  addFileToVector := False;
               end if;

               --add file to the vector
               if addFileToVector then
                  FileVector.Append(Container => fileVectorObj,
                                    New_Item  => exifDataObj);
               end if;

            end if;
         exception
            when others =>
            --   Ada.Text_IO.Put_Line("Exception OTHERS");
               null;
         end;
      end loop;

      Directories.End_Search(currentSearch);
      return fileVectorObj;
   end searchDirectory;

   function checkParameters(parameters : Param.params;
                            image : ImageFile.ExifDataAccess) return Boolean
   is
      fileFitsParameters : Boolean := True;
   begin
      --check whether the image fits to the parameters
      --if the values of the parameters are on their default values then they
      --don't have to be checked
      if parameters.date = To_Unbounded_String("") then
         null;
      end if;

      if fileFitsParameters and then
        parameters.imageSizeX /= 1 and then
        parameters.imageSizeX > image.imageWidth then
         fileFitsParameters := False;
      end if;

      if fileFitsParameters and then
        parameters.imageSizeY /= 1 and then
        parameters.imageSizeY > image.imageHeight then
         fileFitsParameters := False;
      end if;

      if fileFitsParameters and then
        parameters.fileSize /= 1 and then
        parameters.fileSize > image.fileSize then
         fileFitsParameters := False;
      end if;

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

      if fileFitsParameters and then
        parameters.dateTime /= "        " and then
        parameters.dateTime > image.time then
         fileFitsParameters := False;
      end if;

      return fileFitsParameters;
   end checkParameters;

   --function for the use with vectors
   function "="(imageFile1, imageFile2 : ImageFile.ExifDataAccess) return Boolean is
   begin
      if imageFile1 /= null and then imageFile2 /= null and then imageFile1.filename = imageFile2.filename then
         return True;
      else
         return False;
      end if;
   end "=";

end Search;
