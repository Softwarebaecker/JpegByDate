Package body UIController is
 vec : FileVector.Vector;

   function startFile(parameter : Param.params) return FileVector.Vector is
      vec : FileVector.Vector;
   begin
      vec := Search.searchDirectory(parameter);
      startUI(vec => vec);

      return vec;
      end startFile;

   procedure startUI(vec : FileVector.Vector) is

   begin
      cli.displayMessage(vec);
   end startUI;


end UIController;
