Package body Cli is

   procedure displayMessage( files : FileVector.Vector; parameter : Param.params ) is

      --format : array(1..2) of Character;
   begin
      if parameter.isHelp then
         Ada.Text_IO.Put_Line("");
         Ada.Text_IO.Put_Line("Usage:"&HT& "JpegByDate"&HT& "[-dir PATH] [-d YYYY-MM-DD] [-r] [-f] [-p] [-pp]");
         Ada.Text_IO.Put_Line(HT&HT& HT & "[-fis x,y] [-ffs] [-fdr YYYY-MM-DD, YYYY-MM-DD] [-fdt]");
         Ada.Text_IO.Put_Line("");
         Ada.Text_IO.Put_Line("Options: ");
         Ada.Text_IO.Put_Line("");
         Ada.Text_IO.Put_Line(HT&"-dir"&HT&"Path to Directory you want to search.");
         Ada.Text_IO.Put_Line(HT&"-d"&HT&"Specific date (YYYY-MM-DD) for searching.");
         Ada.Text_IO.Put_Line(HT&"-r"&HT&"Recursiv search.");
         Ada.Text_IO.Put_Line(HT&"-f"&HT&"Search for a specific filename.");
         Ada.Text_IO.Put_Line(HT&"-p"&HT&"Shows the selected path on the output.");
         Ada.Text_IO.Put_Line(HT&"-pp"&HT&"Pipe stream for special use.");
         Ada.Text_IO.Put_Line(HT&"-fis"&HT&"Search for specific imagesize (width, height),");
         Ada.Text_IO.Put_Line(HT&"-ffs"&HT&"Search with specific filesize.");
         Ada.Text_IO.Put_Line(HT&"-fdr"&HT&"Search for a specific date range.");
         Ada.Text_IO.Put_Line(HT&"-fdt"&HT&"Search specific date time.");
      end if;
      if parameter.isPipe then
         for i in files.First_Index .. files.Last_Index loop
            SUIO.Put_Line(Item => files.Element(i).filename);
            end loop;
      else
         if parameter.isHelp /= true then

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
         SUIO.Put_Line (Item =>x'Img & HT & String(files.Element(i).date) & HT & String(files.Element(i).time) &HT& PU.To_Unbounded_String(Ada.Directories.Simple_Name(PU.To_String(files.Element(i).filename))));
      end loop;
            Ada.Text_IO.Put_Line("------------------------------------------------------------------------------");
            end if;
         end if;

   end displayMessage;

end Cli;
