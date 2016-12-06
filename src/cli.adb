Package body Cli is
--This procedure is responsible for the correct dump of search result information
   procedure displayMessage( files : FileVector.Vector; parameter : Param.params ) is

   begin
      --When param.isHelp is True then help Message appears.
      if parameter.isHelp then

         Ada.Text_IO.Put_Line("");
         Ada.Text_IO.Put_Line("Usage:" & HT & "JpegByDate" & HT & "[-dir PATH] [-d YYYY-MM-DD] [-r] [-e] [-f] [-p] [-pp]");
         Ada.Text_IO.Put_Line(HT & HT & HT & "[-fis x y] [-ffs] [-fdr YYYY-MM-DD YYYY-MM-DD] [-fdt]");
         Ada.Text_IO.Put_Line("");
         Ada.Text_IO.Put_Line("Options: ");
         Ada.Text_IO.Put_Line("");
         Ada.Text_IO.Put_Line(HT & "-dir" & HT & "Path to Directory you want to search.");
         Ada.Text_IO.Put_Line(HT & "-d" & HT & "Specific date (YYYY-MM-DD) for searching.");
         Ada.Text_IO.Put_Line(HT & "-r" & HT & "Recursiv search.");
         Ada.Text_IO.Put_Line(HT & "-e" & HT & "Creates an excel-file with search result.");
         Ada.Text_IO.Put_Line(HT & "-f" & HT & "Search for a specific filename.");
         Ada.Text_IO.Put_Line(HT & "-p" & HT & "Shows the selected path on the output.");
         Ada.Text_IO.Put_Line(HT & "-pp" & HT & "Pipe stream for special use.");
         Ada.Text_IO.Put_Line(HT & "-fis" & HT & "Search for imagesize greater then (width height).");
         Ada.Text_IO.Put_Line(HT & "-ffs" & HT & "Search with filesize greater then (Byte).");
         Ada.Text_IO.Put_Line(HT & "-fdr" & HT & "Search for a specific date range.");
         Ada.Text_IO.Put_Line(HT & "-fdt" & HT & "Search time of day greater then.");
      end if;

      --When parameter.isExcelOutput is True and parameter.isHelp is false then the search result
      --will be wrote down on an excel file in the same directory as JpegByDate.exe.
      if parameter.isExcelOutput and parameter.isHelp /= true Then

      --Getting current Date in String and replacing ":" with "-" and buidling excel file.
         currentDate := Ada.Calendar.Formatting.Image(Ada.Calendar."+"(Epoch, Dur));
         for z in currentDate'range loop
            if currentDate(z) = ':' then
                currentDate(z) := '-';
            end if;
        end loop;
         --Creating and filling the excel file.
         xl.Create("Image Search from " & currentDate & ".xls");
         for i in files.First_Index .. files.Last_Index loop
            xl.Put_Line(Unbounded_String(files.Element(i).filename));
         end loop;
         xl.Close;
         --End of Excel creation.

      end if;
      --When parameter.isPipe is True and parameter.isHelp is false then the searh result
      --appears line by line on cmd.
      if parameter.isPipe and parameter.isHelp /= true and parameter.isWholePath then
         for i in files.First_Index .. files.Last_Index loop
            SUIO.Put_Line(Item => Unbounded_String(files.Element(i).filename));
         end loop;


      else
         if parameter.isPipe and parameter.isHelp /= true and parameter.isWholePath /= True then
         for i in files.First_Index .. files.Last_Index loop
            SUIO.Put_Line(Item => PU.To_Unbounded_String(Ada.Directories.Simple_Name(PU.To_String(files.Element(i).filename))));
         end loop;
            else


      if parameter.isHelp /= true then
      --Parametresized view
      --Output depends on parameters
      Ada.Text_IO.Put_Line("Found Images: " & Integer'Image(Integer(Search.FileVector.Length(files))));
      Ada.Text_IO.Put_Line("------------------------------------------------------------------------------");
      if parameter.isWholePath then
      Ada.Text_IO.Put_Line("Path: "&PU.To_String(PU.Unbounded_String(parameter.directory)));
         Ada.Text_IO.Put_Line("------------------------------------------------------------------------------");
      end if;
      if parameter.date /= "          " then
         Ada.Text_IO.Put_Line("Date: "& String(parameter.date));
         Ada.Text_IO.Put_Line("------------------------------------------------------------------------------");
      end if;
      Ada.Text_IO.Put_Line(" #" & HT & "Date"  & HT&HT&"Time"& HT & HT & "Name");
      Ada.Text_IO.Put_Line("------------------------------------------------------------------------------");

      --Output Vector
      --Loop from beginning to end from the vector. While in loop extraction of Data.
      for i in files.First_Index .. files.Last_Index loop
         x:= x+1;
         SUIO.Put_Line (Item =>x'Img & HT & String(files.Element(i).date) & HT & String(files.Element(i).time) &HT& PU.To_Unbounded_String(Ada.Directories.Simple_Name(PU.To_String(Unbounded_String(files.Element(i).filename)))));
      end loop;
            Ada.Text_IO.Put_Line("------------------------------------------------------------------------------");

            end if;
      end if;
      --upcoming easter egg.
      if parameter.directory /= "." and parameter.isHelp = True Then


         null;
      end if;
      end if;

   end displayMessage;

end Cli;
