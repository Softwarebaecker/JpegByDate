with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;      use Ada.Strings.Unbounded;
with Ada.Containers.Vectors;     use Ada.Containers;
with Search;			 use Search;
with Param; use Param;
with Ada.Characters.Latin_1; use Ada.Characters.Latin_1;
with param; use param;

package Cli is
   package SUIO renames Ada.Text_IO.Unbounded_IO;
   procedure displayMessage( files : FileVector.Vector; parameter : Param.params );

end Cli;
