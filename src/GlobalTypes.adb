Package body GlobalTypes is

   --checks whether the first and the second date are equal, the first date can
   --have '?' as wildcards
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

   --checks whether the first date is earlier (smaller) than the second date,
   --the first date can have '?' as wildcards
   --returns true when the first date is earlier than the second date
   function "<"(date1, date2 : DateType) return Boolean
   is
      isEarlier : Boolean := True;
   begin
      for i in 0 .. date1'Length - 1 loop
         --check for a wildcard
         if date1(date1'First + i) /= '?' then
            if date1(date1'First + i) > date2(date2'First + i) then
               isEarlier := False;
            end if;
         end if;
      end loop;

      --check for equal dates
      if isEarlier and then
        date1 = date2 then
         isEarlier := False;
      end if;

      return isEarlier;
   end "<";

   --checks whether the first date is later (bigger) than the second date, the
   --first date can have '?' as wildcards
   --returns true when the first date is later than the second date
   function ">"(date1, date2 : DateType) return Boolean
   is
      isLater : Boolean := True;
   begin
      for i in 0 .. date1'Length - 1 loop
         --check for a wildcard
         if date1(date1'First + i) /= '?' then
            if date1(date1'First + i) < date2(date2'First + i) then
               isLater := False;
            end if;
         end if;
      end loop;

      --check for equal dates
      if isLater and then
        date1 = date2 then
         isLater := False;
      end if;

      return isLater;
   end ">";

   --checks whether the first time is earlier (smaller) than the second time,
   --the first time can have '?' as wildcards
   --returns true when the first time is earlier than the second time
   function "<"(time1, time2 : TimeType) return Boolean
   is
      isEarlier : Boolean := True;
   begin
      for i in 0 .. time1'Length - 1 loop
         --check for a wildcard
         if time1(time1'First + i) /= '?' then
            if time1(time1'First + i) > time2(time2'First + i) then
               isEarlier := False;
            end if;
         end if;
      end loop;

      --check for equal times
      if isEarlier and then
        time1 = time2 then
         isEarlier := False;
      end if;

      return isEarlier;
   end "<";

   --checks whether the first time is later (bigger) than the second time, the
   --first time can have '?' as wildcards
   --returns true when the first time is later than the second time
   function ">"(time1, time2 : TimeType) return Boolean
   is
      isLater : Boolean := True;
   begin
      for i in 0 .. time1'Length loop
         --check for a wildcard
         if time1(time1'First + i) /= '?' then
            if time1(time1'First + i) < time2(time2'First + i) then
               isLater := False;
            end if;
         end if;
      end loop;

      --check for equal times
      if isLater and then
        time1 = time2 then
         isLater := False;
      end if;

      return isLater;
   end ">";

end GlobalTypes;
