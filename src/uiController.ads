with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;      use Ada.Strings.Unbounded;
with Ada.Containers.Vectors;     use Ada.Containers;
with Param;                      use Param;
with Search;			 use Search;
with Cli;                        use Cli;

Package UIController is
   procedure startFileSearch( parameter : Param.params );
   procedure startUI( vec : FileVector.Vector; parameter : Param.params );
end UIController;
