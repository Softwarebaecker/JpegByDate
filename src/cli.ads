with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;      use Ada.Strings.Unbounded;
with Ada.Containers.Vectors;     use Ada.Containers;
with Search;			 use Search;

package Cli is
   package SUIO renames Ada.Text_IO.Unbounded_IO;
   procedure displayMessage( files : FileVector.Vector );

end Cli;
