with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Command_Line;

Package Param is

   --in that type all input parameter information are stored
   type params is
     tagged record
       date : Unbounded_String := To_Unbounded_String("");
       isHelp : Boolean := false;
       isRecursive : Boolean := false;
       fileName : Unbounded_String := To_Unbounded_String("");
       directory : Unbounded_String := To_Unbounded_String(".");
       isWholePath : Boolean := false;
   end record;
   type Input is array(Integer Range <>) of Unbounded_String;
   --reads all input parameters, extracts the information and stores it
   --inside of the type params.
   procedure initialize(Argument_Count : Integer; Argument : Input);
   --makes it possible to access the type params
   function getParams return params;

private
   --checks if the given Date is valid and returns corresponding Boolean.
   function validateDate(date: String) return Boolean;

end Param;
