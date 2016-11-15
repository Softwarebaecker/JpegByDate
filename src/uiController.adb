Package body UIController is
 vec : FileVector.Vector;

   procedure startFileSearch(parameter : Param.params)is
      vec : FileVector.Vector;
   begin
      vec := Search.searchDirectory(parameter);
      startUI(vec => vec);

   end startFileSearch;


   procedure startUI(vec : FileVector.Vector) is

   begin
      cli.displayMessage(vec);
   end startUI;

end UIController;
