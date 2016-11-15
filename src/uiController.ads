with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;      use Ada.Strings.Unbounded;
with Ada.Containers.Vectors;     use Ada.Containers;
with Param;                      use Param;
with Search;			 use Search;
with Cli;                        use Cli;

Package UIController is
   procedure controll_Cut( parameter : Param.params );
   function startFile( parameter : Param.params ) return FileVector.Vector;
   function startUI( vec : FileVector.Vector ) return Boolean;
end UIController;
