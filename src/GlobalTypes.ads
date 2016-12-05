with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package GlobalTypes is

   --Type declaration for the attributes of params.
   type DateType is new String(1..10);
   type FileNameType is new Unbounded_String;
   type DirectoryType is new Unbounded_String;
   type ImageSizeType is new Integer range 0 .. Integer'Last;
   type FileSizeType is new Integer range 0 .. Integer'Last;
   type TimeType is new String(1..8);

   function "="(date1, date2 : DateType) return Boolean;
   function "<"(date1, date2 : DateType) return Boolean;
   function ">"(date1, date2 : DateType) return Boolean;
   function "<"(time1, time2 : TimeType) return Boolean;
   function ">"(time1, time2 : TimeType) return Boolean;

end GlobalTypes;
