with Param;

Package Search is
   procedure Search_Directory
     (parameters : Param.params);
private
   filePattern : String := "*.jpg";
end Search;
