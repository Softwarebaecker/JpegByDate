with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

Package Param is

   --in that type all input parameter information are stored
   type params is
     tagged record
       date : Unbounded_String;
       isHelp : Boolean := false;
       isRecursive : Boolean := false;
       fileName : Unbounded_String := To_Unbounded_String("");
       directory : Unbounded_String := To_Unbounded_String(".");
       isWholePath : Boolean := false;
   end record;
   --reads all input parameters, extracts the information and stores it
   --inside of the type params.
   procedure initialize;
   --makes it possible to access the type params
   function getParams return params;

private
   function validateDate(date: String) return Boolean;

end Param;
