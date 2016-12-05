with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Command_Line;
with GlobalTypes;

Package Param is

   --in that type all input parameter information are stored
   type params is
     tagged record
      date : GlobalTypes.DateType := "          ";
      isHelp : Boolean := false;
      isRecursive : Boolean := false;
      fileName : GlobalTypes.FileNameType := GlobalTypes.FileNameType(To_Unbounded_String("*"));
      directory : GlobalTypes.DirectoryType := GlobalTypes.DirectoryType(To_Unbounded_String("."));
      isWholePath : Boolean := false;
      isPipe : Boolean := false;
      imageSizeX : GlobalTypes.ImageSizeType := 1;
      imageSizeY : GlobalTypes.ImageSizeType := 1;
      fileSize : GlobalTypes.FileSizeType := 1;
      dateRangeStart : GlobalTypes.DateType := "          ";
      dateRangeEnd : GlobalTypes.DateType := "          ";
      dateTime : GlobalTypes.TimeType := "        ";
      isExcelOutput : Boolean := false;

   end record;

   type Input is array(Integer Range <>) of Unbounded_String;
   --reads all input parameters, extracts the information and stores it
   --inside of the type params.
   procedure initialize(Argument_Count : Integer; Argument : Input);
   --makes it possible to access the type params
   function getParams return params;

private
   --checks if the given Date is valid and returns corresponding Boolean.
   function validateDate(date: String) return Boolean;

end Param;
