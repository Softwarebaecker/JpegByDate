with Ada.Directories; use Ada.Directories;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

Package body Search is

   procedure Search_Directory --See https://rosettacode.org/wiki/Walk_a_directory/Non-recursively#Ada
     (parameters : Param.params)
     --searches the directory Directory for .jpg files and prints files with the pattern Pattern
   is
      currentSearch : Search_Type;
      dirEnt : Directory_Entry_Type;
   begin
      Start_Search(Search    => currentSearch,
                   Directory => To_String(parameters.directory),
                   Pattern   => filePattern);

      while More_Entries(currentSearch) loop
         Get_Next_Entry(currentSearch, dirEnt);
         Put_Line(Simple_Name(dirEnt));
      end loop;

      End_Search(currentSearch);
   end Search_Directory;
end Search;
