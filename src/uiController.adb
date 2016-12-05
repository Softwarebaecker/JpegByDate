--The uicontroller handles the communication between the search-option and the
--output on an user-called interface. This handling is set throught parameters
--inserted from the user.
Package body UIController is

   --this procedure starts the search and gives to received vector to the cli
   procedure startFileSearch(parameter : Param.params)is
      vec : FileVector.Vector;
   begin
      --if the parameter help is called there is no reason to call the search
      --in an other case the search is called to get the requested files
      if parameter.isHelp = false then
         vec := Search.searchDirectory(parameter);
      end if;

      startUI(vec => vec, parameter => parameter);

   end startFileSearch;

   --starts the output on the cli. this procedure is needed if another kind of
   --output should get implemented
   procedure startUI(vec : FileVector.Vector; parameter : Param.params) is

   begin
      cli.displayMessage(vec, parameter);
   end startUI;

end UIController;
