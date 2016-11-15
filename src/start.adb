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
   vec : FileVector.Vector;

begin
   initialize;
   parameter := getParams;
   startFileSearch(parameter);

   exception
   when Constraint_Error =>
      Put_Line("");
      Put_Line("ERROR: Some parameters could not be loaded!");

end start;
