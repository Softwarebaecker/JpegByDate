with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Maps; use Ada.Strings.Maps;
with GlobelTyps;

Package body Param is

   parameter : aliased params;

    procedure initialize(Argument_Count : Integer; Argument : Input) is
      i : Integer := 0;
      input : Unbounded_String;
      arg : Unbounded_String;
      type paramlist is (d, h, r, f, dir, p, pp, fis, ffs, fdr, fdt, e);


   begin
      --Reset default values for testing
      parameter.date := "          ";
      parameter.isHelp := FALSE;
      parameter.isRecursive := FALSE;
      parameter.fileName := GlobelTyps.FileNameType(To_Unbounded_String("*"));
      parameter.directory := GlobelTyps.DirectoryType(To_Unbounded_String("."));
      parameter.isWholePath := FALSE;
      parameter.isPipe := false;
      parameter.imageSizeX := 1;
      parameter.imageSizeY := 1;
      parameter.fileSize := 1;
      parameter.dateRangeStart := "          ";
      parameter.dateRangeEnd := "          ";
      parameter.dateTime := "        ";
      parameter.isExcelOutput := false;


      while i < Argument_Count loop
         i := i + 1;
         input := Argument(i);

         --Argument starts with '-'
         if Element(input, 1) = '-' then
            --Delete '-'
            arg := Delete(input, 1, 1);

            case paramlist'Value(To_String(arg)) is

               when d =>
                  i := i + 1;
                  if validateDate(To_String(Argument(i))) then
                     parameter.date := GlobelTyps.DateType(To_String(Argument(i)));
                  else
                     raise Constraint_Error;
                  end if;

               when h =>
                  parameter.isHelp := true;

               when r =>
                  parameter.isRecursive := true;

               when f =>
                  i := i + 1;
                  parameter.fileName := GlobelTyps.FileNameType(Argument(i));

               when dir =>
                  i := i + 1;
                  parameter.directory := GlobelTyps.DirectoryType(Argument(i));

               when p =>
                  parameter.isWholePath := true;

               when pp =>
                  parameter.isPipe := true;

               when fis =>
                  i := i + 1;
                  parameter.imageSizeX := GlobelTyps.ImageSizeType' Value(To_String(Argument(i)));
                  i := i + 1;
                  parameter.imageSizeY := GlobelTyps.ImageSizeType' Value(To_String(Argument(i)));

               when ffs =>
                  i := i + 1;
                  parameter.fileSize := GlobelTyps.FileSizeType' Value(To_String(Argument(i)));

               when fdr =>
                  i := i + 1;
                  if validateDate(To_String(Argument(i))) then
                     parameter.dateRangeStart := GlobelTyps.DateType(To_String(Argument(i)));
                  else
                     raise Constraint_Error;
                  end if;

                  i := i + 1;
                  if validateDate(To_String(Argument(i))) then
                     parameter.dateRangeEnd := GlobelTyps.DateType(To_String(Argument(i)));
                  else
                     raise Constraint_Error;
                  end if;

               when fdt =>
                  i := i + 1;
                  parameter.dateTime := GlobelTyps.TimeType(To_String(Argument(i)));

               when e =>
                  parameter.isExcelOutput := true;

            end case;
         else
            raise Constraint_Error;
         end if;
      end loop;
   end initialize;

   function validateDate(date: String) return Boolean is
      year : String (1 .. 4);
      month : String (1 .. 2);
      day : String (1 .. 2);
      y : Integer;
      m : Integer;
      d : Integer;
      type DPM is array(1 .. 12) of Integer;
      daysPerMonth : DPM := (31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
      isLeapYear : Boolean := false;

   begin
      --Split input
      year := date(date'First .. date'First + 3);
      month := date(date'First + 5 .. date'First + 6);
      day := date(date'First + 8 .. date'First + 9);

      --Date has correct syntax
      if date(date'First + 4) /= '-' or date(date'First + 7) /= '-' then
         return false;
      end if;

      --All characters of year are inside of the value range
      for i in Integer Range 1 .. 4 loop
          if year(i) not in '0' .. '9' and year(i) /= '?' then
             return false;
          end if;
      end loop;

      --All characters of month are inside of the value range
      if month(1) /= '?' and month(2) /= '?' and (month(1) /= '0' or month(2) not in '0' .. '9' or (month(1) = '0' and month(2) = '0')) then
         if month(1) not in '0' .. '1' or (month(1) = '1' and month(2) not in '0' .. '2') or (month(1) = '0' and month(2) = '0') then
            return false;
         end if;
      end if;

      --All characters of month are inside of the value range
      if day(1) /= '?' and day(2) /= '?' and (day(1) not in '0' .. '2' or day(2) not in '0' .. '9' or(day(1) = '0' and day(2) = '0')) then
         if day(1) not in '0' .. '3' or (day(1) not in '0' .. '2' and day(2) not in '0' .. '1') or (day(1) = '0' and day(2) = '0') then
            return false;
         end if;
      end if;

      if ada.strings.Fixed.count(date, "?") > 0 then
         --All '?' are in year
         if ada.strings.Fixed.count(year, "?") = ada.strings.Fixed.count(date, "?") then
            m := Integer' value(month);
            d := Integer' value(day);
            --Is the combination of day and month not valide?
            if d > daysPerMonth(m) then
               return false;
            end if;
         end if;
      else
         --No '?' in the date
         y := Integer' value(year);
         m := Integer' value(month);
         d := Integer' value(day);

         --Is the given year a leap-year?
         if y mod 4 = 0 and (y mod 100 /= 0 or y mod 400 = 0) then
            isLeapYear := true;
         end if;

         --Is the combination of day and month not valide?
         if d > daysPerMonth(m) then
            return false;
         --Is it 29th of February outside of a leap-year?
         elsif m = 2 and d = 29 and not isLeapYear then
            return false;
         end if;

         isLeapYear := false;

      end if;

      return true;

   end validateDate;

   function getParams return params is
   begin
      return parameter;
   end getParams;

end Param;
