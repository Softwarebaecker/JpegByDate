Package Param is

   isHelp : Boolean := false;
   isRecursive : Boolean := false;
   fileName : String := "";

   function solve(
                  a : in Float := 0.0;
                  b : in Float := 0.0;
                  c : in Float := 0.0;
                  x1 : out Float;
                  x2 : out Float)
                  return Integer;

end Param;
