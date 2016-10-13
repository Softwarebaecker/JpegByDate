with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure main is
   i : Integer := 0;
   arg : String (2 .. 2);
   type params is (h, r, f);
begin
   while i < Argument_Count loop
      i := i + 1;
      arg := delete(Argument(i), 1, 1);
      case params'Value(arg) is
         when h =>
            Put_Line("Hilfe!");
         when r =>
            Put_Line("rekursiv");
         when f =>
            Put_Line("Dateiname!");
      end case;
   end loop;
end main;
