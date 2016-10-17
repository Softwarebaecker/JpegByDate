with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Param; use Param;

procedure main is
   i : Integer := 0;
   arg : String (2 .. 2);
   parameter : aliased params;

begin
   initialize;
   parameter := getParams;
   Put("Wildcard is ");
   Put_Line(Boolean' Image(parameter.isWildcard));
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

end main;