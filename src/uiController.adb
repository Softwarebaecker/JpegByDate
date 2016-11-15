Package body UIController is

   procedure controll_Cut(parameter : Param.params)
   is
      vec : FileVector.Vector;
   --   parameter : aliased params;

   begin
      return;
   end controll_Cut;

      function startFile(parameter : Param.params) return FileVector.Vector is
      vec : FileVector.Vector;
   begin
         vec := Search.searchDirectory(parameter);
         return vec;
      end startFile;

      function startUI(vec : FileVector.Vector) return Boolean is

   begin
         cli.displayMessage(vec);
    return true;
      end startUI;


end UIController;
