Package body Cli is

   procedure displayMessage( files : FileVector.Vector; parameter : Param.params ) is
      x:Integer:=0;
      --format : array(1..2) of Character;
   begin

      --Parametresized view
      --Output depends on parameters
      Ada.Text_IO.Put_Line("Found Images: " & Integer'Image(Integer(Search.FileVector.Length(files))));
      Ada.Text_IO.Put_Line("------------------------------------------------------------------------------");
      if parameter.isWholePath then
      Ada.Text_IO.Put_Line("Path: "&PU.To_String(parameter.directory));
         Ada.Text_IO.Put_Line("------------------------------------------------------------------------------");
      end if;
      if parameter.date /= "" then
         Ada.Text_IO.Put_Line("Date: "&PU.To_String(parameter.date));
         Ada.Text_IO.Put_Line("------------------------------------------------------------------------------");
      end if;
      Ada.Text_IO.Put_Line(" #" & HT & "Date"  & HT&HT&"Time"& HT & HT & "Name");
      Ada.Text_IO.Put_Line("------------------------------------------------------------------------------");

      --Output Vector
      --Loop from beginning to end from the vector. While in loop extraction of Data.
      for i in files.First_Index .. files.Last_Index loop
         x:= x+1;
         --SUIO.Put_Line (Item => i'Img & " " & files.Element(i).filename);
         SUIO.Put_Line (Item =>x'Img&HT&files.Element(i).date & HT & files.Element(i).time &HT& PU.To_Unbounded_String(Ada.Directories.Simple_Name(PU.To_String(files.Element(i).filename))));
      end loop;
       Ada.Text_IO.Put_Line("------------------------------------------------------------------------------");


   end displayMessage;

end Cli;
