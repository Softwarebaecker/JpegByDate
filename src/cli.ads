with Ada.Text_IO;
with Ada.Text_IO.Unbounded_IO;
with Ada.Strings.Unbounded;      use Ada.Strings.Unbounded;
with Ada.Containers.Vectors;     use Ada.Containers;
with Search;			 use Search;
with Ada.Real_Time; use Ada.Real_Time;
with Param; use Param;
with Ada.Real_Time;
with Ada.Characters.Latin_1; use Ada.Characters.Latin_1;
with GlobalTypes; use GlobalTypes;
with param; use param;
with Ada.Directories; use Ada.Directories;
with Excel_Out; use Excel_Out;
with Ada.Calendar; use Ada.Calendar;
with Ada.Calendar.Formatting;
With Ada.Calendar.Time_Zones;
with Ada.Numerics.Float_Random;         use Ada.Numerics.Float_Random;
with Ada.Streams.Stream_IO, Ada.Text_IO;

package Cli is
   --renames for quicker coding
   package SUIO renames Ada.Text_IO.Unbounded_IO;
   package PU renames Ada.Strings.Unbounded;
   --Variable x is needed for correkt count of images on output display
   x:Integer:=0;
   --Variable xl is needed for creating the Excel file.
   xl: Excel_Out_File;
   --Variable currentDate is needed for excel output filename.
   currentDate: String(1 .. 19);
   --displayMessage expects files as FileVector.Vector and parameter as Param.params
   procedure displayMessage( files : FileVector.Vector; parameter : Param.params );
   --The_Clock, As_Time_Span, Epoch, and Dur is needed for calculating the current DateTime.
   The_Clock : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   As_Time_Span : Ada.Real_Time.Time_Span := The_Clock - Time_Of(0, Time_Span_Zero);
   Epoch : constant Ada.Calendar.Time := Ada.Calendar.Time_Of(1970, 01, 01);
   Dur : Duration := Ada.Real_Time.To_Duration(As_Time_Span);
end Cli;
