with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

Package body Param is

   parameter : aliased params;

   procedure initialize is
      i : Integer := 0;
      arg : String (2 .. 2);
      type paramlist is (d, h, r, f, s, p);
      help : Boolean := parameter.isHelp;
   begin
      while i < Argument_Count loop
         i := i + 1;
         arg := delete(Argument(i), 1, 1);
         case paramlist'Value(arg) is
            when d =>
               parameter.isWildcard := true;
            when h =>
               parameter.isHelp := true;
            when r =>
               parameter.isRecursive := true;
            when f =>
               i := i + 1;
               parameter.fileName := To_Unbounded_String(Argument(i));
            when s =>
               i := i + 1;
               parameter.directory := To_Unbounded_String(Argument(i));
            when p =>
               parameter.isWholePath := true;
         end case;
      end loop;


   end initialize;

   function getParams return params is
   begin
      return parameter;
   end getParams;

end Param;
