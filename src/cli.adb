Package body Cli is

   procedure displayMessage( files : FileVector.Vector ) is
   begin
      Ada.Text_IO.Put_Line("Found Images: " & Integer'Image(Integer(Search.FileVector.Length(files))));
      for i in files.First_Index .. files.Last_Index loop
         SUIO.Put_Line (Item => i'Img & " " & files.Element(i).filename);
         --SUIO.Put_Line (Item => i'Img & " " & files.Element(i).date & " " & files.Element(i).time & " " & files.Element(i).filename);
      end loop;



   end displayMessage;

end Cli;
