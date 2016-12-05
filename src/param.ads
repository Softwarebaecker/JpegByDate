with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Command_Line;
with GlobelTyps;

Package Param is

   --in that type all input parameter information are stored
   type params is
     tagged record
      date : GlobelTyps.DateType := "          ";
      isHelp : Boolean := false;
      isRecursive : Boolean := false;
      fileName : GlobelTyps.FileNameType := GlobelTyps.FileNameType(To_Unbounded_String(""));
      directory : GlobelTyps.DirectoryType := GlobelTyps.DirectoryType(To_Unbounded_String(""));
      isWholePath : Boolean := false;
      isPipe : Boolean := false;
      imageSizeX : GlobelTyps.ImageSizeType := 1;
      imageSizeY : GlobelTyps.ImageSizeType := 1;
      fileSize : GlobelTyps.FileSizeType := 1;
      dateRangeStart : GlobelTyps.DateType := "          ";
      dateRangeEnd : GlobelTyps.DateType := "          ";
      dateTime : GlobelTyps.TimeType := "        ";
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
