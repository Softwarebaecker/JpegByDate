Package body Cli is

   procedure displayMessage( files : FileVector.Vector; parameter : Param.params ) is
      x:Integer:=0;
   begin
      Ada.Text_IO.Put_Line("Found Images: " & Integer'Image(Integer(Search.FileVector.Length(files))));
      Ada.Text_IO.Put_Line("------------------------------------------------------------------------------");
      Ada.Text_IO.Put_Line(" #" & HT &"Date" & HT & HT &"Time" & HT & HT &"Path: "& Ada.Strings.Unbounded.To_String(parameter.directory));
      Ada.Text_IO.Put_Line("------------------------------------------------------------------------------");
      for i in files.First_Index .. files.Last_Index loop
         x:= x+1;
         --SUIO.Put_Line (Item => i'Img & " " & files.Element(i).filename);
         SUIO.Put_Line (Item =>x'Img&""&HT&""&files.Element(i).date & ""&HT&"" & files.Element(i).time & ""&HT&"" & files.Element(i).filename);

      end loop;
       Ada.Text_IO.Put_Line("------------------------------------------------------------------------------");


   end displayMessage;

end Cli;
