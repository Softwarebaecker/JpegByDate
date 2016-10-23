with Ada.Directories; use Ada.Directories;
with Ada.Text_IO; use Ada.Text_IO;

Package body Search is

   procedure Search_Directory --See https://rosettacode.org/wiki/Walk_a_directory/Non-recursively#Ada
     (Directory : String := ".";
      Pattern 	: String := "")
     --searches the directory Directory for .jpg files and prints files with the pattern Pattern
   is
      Current_Search : Search_Type;
      Dir_Ent : Directory_Entry_Type;
   begin
      Start_Search(Search    => Current_Search,
                   Directory => Directory,
                   Pattern   => File_Pattern);

      while More_Entries(Current_Search) loop
         Get_Next_Entry(Current_Search, Dir_Ent);
         Put_Line(Simple_Name(Dir_Ent));
      end loop;

      End_Search(Current_Search);
   end Search_Directory;
end Search;
