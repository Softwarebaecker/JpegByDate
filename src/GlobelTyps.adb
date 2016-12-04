Package body GlobelTyps is

   function "="(date1,date2 : DateType) return Boolean
   is
      isEqual : Boolean := True;
   begin
      for i in 0 .. date1'Length loop
         if date1(date1'First + i) /= '?' then
            if date1(date1'First + i) = date2(date2'First + i) then
               isEqual := False;
            end if;
         end if;
      end loop;

      return isEqual;
   end "=";

   function "<"(date1, date2 : DateType) return Boolean
   is
      isEarlier : Boolean := True;
   begin
      for i in 0 .. date1'Length loop
         if date1(date1'First + i) /= '?' then
            if date1(date1'First + i) > date2(date2'First + i) then
               isEarlier := False;
            end if;
         end if;
      end loop;

      if isEarlier and then
        date1 = date2 then
         isEarlier := False;
      end if;

      return isEarlier;
   end "<";

   function ">"(date1, date2 : DateType) return Boolean
   is
      isLater : Boolean := True;
   begin
      for i in 0 .. date1'Length loop
         if date1(date1'First + i) /= '?' then
            if date1(date1'First + i) < date2(date2'First + i) then
               isLater := False;
            end if;
         end if;
      end loop;

      if isLater and then
        date1 = date2 then
         isLater := False;
      end if;

      return isLater;
   end ">";

   function "<"(time1, time2 : TimeType) return Boolean
   is
      isEarlier : Boolean := True;
   begin
      for i in 0 .. time1'Length loop
         if time1(time1'First + i) /= '?' then
            if time1(time1'First + i) > time2(time2'First + i) then
               isEarlier := False;
            end if;
         end if;
      end loop;

      if isEarlier and then
        time1 = time2 then
         isEarlier := False;
      end if;

      return isEarlier;
   end "<";

   function ">"(time1, time2 : TimeType) return Boolean
   is
      isLater : Boolean := True;
   begin
      for i in 0 .. time1'Length loop
         if time1(time1'First + i) /= '?' then
            if time1(time1'First + i) < time2(time2'First + i) then
               isLater := False;
            end if;
         end if;
      end loop;

      if isLater and then
        time1 = time2 then
         isLater := False;
      end if;

      return isLater;
   end ">";

end GlobelTyps;
