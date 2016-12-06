with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;      use Ada.Strings.Unbounded;
with Ada.Containers.Vectors;     use Ada.Containers;
with Param;                      use Param;
with Search;			 use Search;
with Cli;                        use Cli;

--The uiController manages the call of the file search and the output throught
--the given parameters.
Package UIController is
   --opens the file search if the parameter for the help isnt set.
   procedure startFileSearch( parameter : Param.params );

   --starts the output on the cli. The variable vec safes the search result while
   --the variable parameter gives the chosen parameters.
   procedure startUI( vec : FileVector.Vector; parameter : Param.params );
end UIController;
