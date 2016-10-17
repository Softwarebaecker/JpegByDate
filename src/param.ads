with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

Package Param is

   --type params is tagged private;
   type params is
     tagged record
       isWildcard : Boolean := false;
       isHelp : Boolean := false;
       isRecursive : Boolean := false;
       fileName : Unbounded_String;
       directory : Unbounded_String;
       isWholePath : Boolean := false;
      end record;
   procedure initialize;
   function getParams return params;


end Param;
