with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Vectors;     use Ada.Containers;
with Param; use Param;
with Search; use Search;
with UIController; use UIController;

procedure start is

   i : Integer := 0;
   parameter : aliased params;
   input : Param.Input(1 .. Argument_Count);
begin
   --Copy passed arguments in array.
   for i in 1 .. Argument_Count loop
      input(i) := To_Unbounded_String(Argument(i));
   end loop;

   --Evaluating the passed arguments.
   initialize(Argument_Count, input);

   --Get the sucessfully parsed input parameters.
   parameter := getParams;

   --Start to search for files matching the given input parameters.
   UIController.startFileSearch(parameter);

   --Error handling:
   exception
         --If the parsing of the input parameters fails a Constraint Error is raised
   when Constraint_Error =>
      Put_Line("");
      Put_Line("ERROR: Some parameters could not be loaded!");

end start;
