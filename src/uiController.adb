--The uicontroller handles the communication between the search-option and the
--output on an user-called interface. This handling is set throught parameters
--inserted from the user.
Package body UIController is
   vec : FileVector.Vector;

   --this procedure starts the search and gives to received vector to the cli
   procedure startFileSearch(parameter : Param.params)is
      vec : FileVector.Vector;
   begin
      vec := Search.searchDirectory(parameter);
      startUI(vec => vec);

   end startFileSearch;

   --starts the output on the cli. this procedure is needed if another kind of
   --output should get implemented
   procedure startUI(vec : FileVector.Vector) is

   begin
      cli.displayMessage(vec);
   end startUI;

end UIController;
