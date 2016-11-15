Package body Cli is

   procedure displayMessage( files : FileVector.Vector ) is
   begin

     for i in files.First_Index .. files.Last_Index loop
      SUIO.Put_Line (Item => i'Img & " " & files.Element(i).filename);
     end loop;

   end displayMessage;

end Cli;
