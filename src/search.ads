Package Search is
   procedure Search_Directory
     (Directory : in String := ".";
      Pattern	: in String := "");
private
   File_Pattern : String := "*.jpg";
end Search;
