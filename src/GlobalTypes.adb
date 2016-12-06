Package body GlobalTypes is

   --checks whether the first and the second date are equal
   --returns true when the two dates are equal
   function "="(date1,date2 : DateType) return Boolean
   is
      isEqual : Boolean := True;
   begin
      for i in 0 .. date1'Length - 1 loop
         --check for a wildcard
         if date1(date1'First + i) /= '?' then
            if date1(date1'First + i) /= date2(date2'First + i) then
               isEqual := False;
            end if;
         end if;
      end loop;

      return isEqual;
   end "=";

   --checks whether the first date is earlier (smaller) than the second date
   --returns true when the first date is earlier than the second date
   function "<"(date1, date2 : DateType) return Boolean
   is
      isEarlier : Boolean := True;
      --extract the different parts of the date out of the string
      year1 : Integer := Integer'Value(String(date1(date1'First .. date1'First + 3)));
      year2 : Integer := Integer'Value(String(date2(date2'First .. date2'First + 3)));
      month1 : Integer := Integer'Value(String(date1(date1'First + 5 .. date1'First + 6)));
      month2 : Integer := Integer'Value(String(date2(date2'First + 5 .. date2'First + 6)));
      day1 : Integer := Integer'Value(String(date1(date1'First + 8 .. date1'First + 9)));
      day2 : Integer := Integer'Value(String(date2(date2'First + 8 .. date2'First + 9)));
   begin
      --check if the year is bigger, when it is bigger the date can't be smaller
      if year1 > year2 then
         isEarlier := False;
      else
         --if the years are the same, then check the other parts of the date
         if year1 = year2 then
            --check if the month is bigger, when it is bigger the date can't be smaller
            if month1 > month2 then
               isEarlier := False;
            else
               --if the months are the same, then check the days
               if month1 = month2 then
                  --check if the days are bigger, when they are bigger or the
                  --same then the date is not smaller
                  if day1 >= day2 then
                     isEarlier := False;
                  end if;
               end if;
            end if;
         end if;
      end if;

      return isEarlier;
   end "<";

   --checks whether the first date is later (bigger) than the second date
   --returns true when the first date is later than the second date
   function ">"(date1, date2 : DateType) return Boolean
   is
      isLater : Boolean := True;
      --extract the different parts of the date out of the string
      year1 : Integer := Integer'Value(String(date1(date1'First .. date1'First + 3)));
      year2 : Integer := Integer'Value(String(date2(date2'First .. date2'First + 3)));
      month1 : Integer := Integer'Value(String(date1(date1'First + 5 .. date1'First + 6)));
      month2 : Integer := Integer'Value(String(date2(date2'First + 5 .. date2'First + 6)));
      day1 : Integer := Integer'Value(String(date1(date1'First + 8 .. date1'First + 9)));
      day2 : Integer := Integer'Value(String(date2(date2'First + 8 .. date2'First + 9)));
   begin

      --check if the year is smaller, when it is smaller the date can't be bigger
      if year1 < year2 then
         isLater := False;
      else
         --if the years are the same, then check the other parts of the date
         if year1 = year2 then
            --check if the month is smaller, when it is smaller the date can't be bigger
            if month1 < month2 then
               isLater := False;
            else
               --if the months are the same, then check the days
               if month1 = month2 then
                  --check if the days are smaller, when they are smaller or the
                  --same then the date is not bigger
                  if day1 <= day2 then
                     isLater := False;
                  end if;
               end if;
            end if;
         end if;
      end if;

      return isLater;
   end ">";

   --checks whether the first time is earlier (smaller) than the second time
   --returns true when the first time is earlier than the second time
   function "<"(time1, time2 : TimeType) return Boolean
   is
      isEarlier : Boolean := True;
      --extract the different parts of the time out of the string
      hour1 : Integer := Integer'Value(String(time1(time1'First .. time1'First + 1)));
      hour2 : Integer := Integer'Value(String(time2(time2'First .. time2'First + 1)));
      minutes1 : Integer := Integer'Value(String(time1(time1'First + 3 .. time1'First + 4)));
      minutes2 : Integer := Integer'Value(String(time2(time2'First + 3 .. time2'First + 4)));
      seconds1 : Integer := Integer'Value(String(time1(time1'First + 6 .. time1'First + 7)));
      seconds2 : Integer := Integer'Value(String(time2(time2'First + 6 .. time2'First + 7)));
   begin
     --check if the hour is bigger, when it is bigger the time can't be smaller
      if hour1 > hour2 then
         isEarlier := False;
      else
         --if the hours are the same, then check the other parts of the time
         if hour1 = hour2 then
            --check if the minutes are bigger, when they are bigger the time can't be smaller
            if minutes1 > minutes2 then
               isEarlier := False;
            else
               --if the minutes are the same, then check the seconds
               if minutes1 = minutes2 then
                  --check if the seconds are bigger, when they are bigger or the
                  --same then the time is not smaller
                  if seconds1 >= seconds2 then
                     isEarlier := False;
                  end if;
               end if;
            end if;
         end if;
      end if;

      return isEarlier;
   end "<";

   --checks whether the first time is later (bigger) than the second time
   --returns true when the first time is later than the second time
   function ">"(time1, time2 : TimeType) return Boolean
   is
      isLater : Boolean := True;
      --extract the different parts of the time out of the string
      hour1 : Integer := Integer'Value(String(time1(time1'First .. time1'First + 1)));
      hour2 : Integer := Integer'Value(String(time2(time2'First .. time2'First + 1)));
      minutes1 : Integer := Integer'Value(String(time1(time1'First + 3 .. time1'First + 4)));
      minutes2 : Integer := Integer'Value(String(time2(time2'First + 3 .. time2'First + 4)));
      seconds1 : Integer := Integer'Value(String(time1(time1'First + 6 .. time1'First + 7)));
      seconds2 : Integer := Integer'Value(String(time2(time2'First + 6 .. time2'First + 7)));
   begin
      --check if the hour is smaller, when it is smaller the time can't be bigger
      if hour1 < hour2 then
         isLater := False;
      else
         --if the hours are the same, then check the other parts of the time
         if hour1 = hour2 then
            --check if the minute is smaller, when it is smaller the time can't be bigger
            if minutes1 < minutes2 then
               isLater := False;
            else
               --if the minutes are the same, then check the seconds
               if minutes1 = minutes2 then
                  --check if the seconds are smaller, when they are smaller or
                  --the same then the time is not bigger
                  if seconds1 <= seconds2 then
                     isLater := False;
                  end if;
               end if;
            end if;
         end if;
      end if;

      return isLater;
   end ">";

end GlobalTypes;
