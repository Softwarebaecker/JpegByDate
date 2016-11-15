with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Vectors;     use Ada.Containers;
with Param; use Param;
with Search; use Search;
with UIController; use UIController;

procedure main is
   i : Integer := 0;
   parameter : aliased params;
   vec : FileVector.Vector;

begin
   initialize;
   parameter := getParams;
   vec := startFile(parameter);
   Put_Line("Debug Information:");
   Put_Line("");
   Put("Date is ");
   Put_Line(To_String(parameter.date));
   Put("Help is ");
   Put_Line(Boolean' Image(parameter.isHelp));
   Put("Recursiv is ");
   Put_Line(Boolean' Image(parameter.isRecursive));
   Put("File Name is ");
   Put_Line(To_String(parameter.fileName));
   Put("Directory is ");
   Put_Line(To_String(parameter.directory));
   Put("Whole path is ");
   Put_Line(Boolean' Image(parameter.isWholePath));



   --searchDirectory(parameter);
   exception
   when Constraint_Error =>
      Put_Line("");
      Put_Line("ERROR: Some parameters could not be loaded!");

end main;
