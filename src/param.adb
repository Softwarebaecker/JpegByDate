with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Maps; use Ada.Strings.Maps;

Package body Param is

   parameter : aliased params;

   procedure initialize is
      i : Integer := 0;
      input : Unbounded_String;
      arg : Unbounded_String;
      type paramlist is (d, h, r, f, dir, p);
      help : Boolean := parameter.isHelp;


   begin
      while i < Argument_Count loop
         i := i + 1;
         input := To_Unbounded_String(Argument(i));
         if Element(input, 1) = '-' then
            arg := Delete(input, 1, 1);
            case paramlist'Value(To_String(arg)) is
               when d =>
                  i := i + 1;
                  if validateDate(Argument(i)) then
                     parameter.date := To_Unbounded_String(Argument(i));
                  else
                     raise Constraint_Error;
                  end if;
               when h =>
                  parameter.isHelp := true;
               when r =>
                  parameter.isRecursive := true;
               when f =>
                  i := i + 1;
                  parameter.fileName := To_Unbounded_String(Argument(i));
               when dir =>
                  i := i + 1;
                  parameter.directory := To_Unbounded_String(Argument(i));
               when p =>
                  parameter.isWholePath := true;
            end case;
         else
            Put_Line("- is missing");
            raise Constraint_Error;
         end if;
      end loop;
   end initialize;

   function validateDate(date: String) return Boolean is
      year : String (1 .. 4);
      month : String (1 .. 2);
      day : String (1 .. 2);

   begin
      year := date(1 .. 4);
      month := date(6 .. 7);
      day := date(9 .. 10);

      if date(5) /= '-' or date(8) /= '-' then
         return false;
      end if;

      for i in Integer Range 1 .. 4 loop
          if year(i) not in '0' .. '9' and year(i) /= '?' then
             return false;
          end if;
      end loop;

      if month(1) /= '?' and month(2) /= '?' and (month(1) /= '0' or month(2) not in '0' .. '9' or (month(1) = '0' and month(2) = '0')) then
         if month(1) not in '0' .. '1' or (month(1) = '1' and month(2) not in '0' .. '2') or (month(1) = '0' and month(2) = '0') then
            return false;
         end if;
      end if;

      if day(1) /= '?' and day(2) /= '?' and (day(1) not in '0' .. '2' or day(2) not in '0' .. '9' or(day(1) = '0' and day(2) = '0')) then
         if day(1) not in '0' .. '3' or (day(1) not in '0' .. '2' and day(2) not in '0' .. '1') or (day(1) = '0' and day(2) = '0') then
            return false;
         end if;
      end if;

      return true;

   end validateDate;

   function getParams return params is
   begin
      return parameter;
   end getParams;

end Param;
