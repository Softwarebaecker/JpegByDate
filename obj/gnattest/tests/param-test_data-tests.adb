--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Param.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Ada.Text_IO; use Ada.Text_IO;
with Test_Info;
with Param;

package body Param.Test_Data.Tests is


   procedure Proc_Case4_1 is
      arg : Input( 1..1);
   begin
      arg(1) := To_Unbounded_String("di");
      initialize(1, arg);
   end Proc_Case4_1;

   procedure Proc_Case4_2 is
      arg : Input( 1..1);
   begin
      arg(1) := To_Unbounded_String("-di");
      initialize(1, arg);
   end Proc_Case4_2;

   procedure Proc_Case4_3 is
      arg : Input( 1..1);
   begin
      arg(1) := To_Unbounded_String("-dir");
      initialize(1, arg);
   end Proc_Case4_3;

   procedure Proc_Case7 is
      arg : Input( 1..1);
   begin
      arg(1) := To_Unbounded_String("-w");
      initialize(1, arg);
   end Proc_Case7;
--  begin read only
   procedure Test_initialize (Gnattest_T : in out Test);
   procedure Test_initialize_b0ff4a (Gnattest_T : in out Test) renames Test_initialize;
--  id:2.2/b0ff4afbf3d6da35/initialize/1/0/
   procedure Test_initialize (Gnattest_T : in out Test) is
   --  param.ads:17:4:initialize
--  end read only

      pragma Unreferenced (Gnattest_T);
      ARGC_CASE1 : Integer := 0;
      ARGA_CASE1 : Input := (To_Unbounded_String(1), To_Unbounded_String(1));
      ARGC_CASE3 : Integer := 1;
      ARGA_CASE3 : Input(1 .. 1);
      ARGC_CASE5 : Integer := 9;
      ARGA_CASE5 : Input(1 .. 9) := (To_Unbounded_String("-h"),
                                     To_Unbounded_String("-r"),
                                     To_Unbounded_String("-p"),
                                     To_Unbounded_String("-f"),
                                     To_Unbounded_String("file"),
                                     To_Unbounded_String("-dir"),
                                     To_Unbounded_String("directory"),
                                     To_Unbounded_String("-d"),
                                     To_Unbounded_String("2016-11-01"));
      ARGP_CASE5 : params;
      ARGB_CASE5 : Boolean;
      ARGC_CASE6 : Integer := 9;
      ARGA_CASE6 : Input(1 .. 9) := (To_Unbounded_String("-d"),
                                     To_Unbounded_String("2016-11-01"),
                                     To_Unbounded_String("-dir"),
                                     To_Unbounded_String("directory"),
                                     To_Unbounded_String("-f"),
                                     To_Unbounded_String("file"),
                                     To_Unbounded_String("-p"),
                                     To_Unbounded_String("-r"),
                                     To_Unbounded_String("-h"));
      ARGP_CASE6 : params;
      ARGB_CASE6 : Boolean;

   begin

      --Case1:
      initialize(ARGC_CASE1, ARGA_CASE1);
      put_line(Test_Info.SW_VERSION & "; 1; ; no Exception; " & Test_Info.CURRENT_DATE & ";YES");


      --Case2:
      initialize(ARGC_CASE1, ARGA_CASE1);
      Assert(param.getParams.directory = ".", Test_Info.SW_VERSION & "; 2; ; " & To_String(param.getParams.directory) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 2; ; " & To_String(param.getParams.directory) & "; " & Test_Info.CURRENT_DATE & ";YES");


      --Case3:
      ARGA_CASE3(1) := To_Unbounded_String("-h");
      initialize(ARGC_CASE3, ARGA_CASE3);
      Assert(param.getParams.isHelp, Test_Info.SW_VERSION & "; 3; -h; is Help = " & Boolean' Image(param.getParams.isHelp) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 3; -h; isHelp = " & Boolean' Image(param.getParams.isHelp) & "; " & Test_Info.CURRENT_DATE & ";YES");

      ARGA_CASE3(1) := To_Unbounded_String("-r");
      initialize(ARGC_CASE3, ARGA_CASE3);
      Assert(param.getParams.isRecursive, Test_Info.SW_VERSION & "; 3; '-r; isRecursive =" & Boolean' Image(param.getParams.isRecursive) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 3; '-r; isRecursive = " & Boolean' Image(param.getParams.isRecursive) & "; " & Test_Info.CURRENT_DATE & ";YES");


      --Case4:
      Assert_Exception (Proc_Case4_1'Access,
                        Test_Info.SW_VERSION & "; 4; di; " & "Void" & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 4; di; " & "Constraint_Error" & "; " & Test_Info.CURRENT_DATE & ";YES");

      Assert_Exception (Proc_Case4_2'Access,
                        Test_Info.SW_VERSION & "; 4; '-di; " & "Void" & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 4; '-di; " & "Constraint_Error" & "; " & Test_Info.CURRENT_DATE & ";YES");

      Assert_Exception (Proc_Case4_3'Access,
                        Test_Info.SW_VERSION & "; 4; '-dir; " & "Void" & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 4; '-dir; " & "Constraint_Error" & "; " & Test_Info.CURRENT_DATE & ";YES");


      --Case5:
      initialize(ARGC_CASE5, ARGA_CASE5);
      ARGP_CASE5 := getParams;
      ARGB_CASE5 := ARGP_CASE5.date = To_Unbounded_String("2016-11-01") and
        ARGP_CASE5.fileName = To_Unbounded_String("file") and
        ARGP_CASE5.directory = To_Unbounded_String("directory") and
        ARGP_CASE5.isHelp and ARGP_CASE5.isRecursive and ARGP_CASE5.isWholePath;
      Assert(ARGB_CASE5, Test_Info.SW_VERSION & "; 5; '-h -r -p -f file -dir directory -d 2016-11-01; correct? " & Boolean' Image(ARGB_CASE5) & "!; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 5; '-h -r -p -f file -dir directory -d 2016-11-01; correct? " & Boolean' Image(ARGB_CASE5) & "!; " & Test_Info.CURRENT_DATE & ";YES");


      --Case6:
      initialize(ARGC_CASE6, ARGA_CASE6);
      ARGP_CASE6 := getParams;
      ARGB_CASE6 := ARGP_CASE6.date = To_Unbounded_String("2016-11-01") and
        ARGP_CASE6.fileName = To_Unbounded_String("file") and
        ARGP_CASE6.directory = To_Unbounded_String("directory") and
        ARGP_CASE6.isHelp and ARGP_CASE6.isRecursive and ARGP_CASE5.isWholePath;
      Assert(ARGB_CASE6, Test_Info.SW_VERSION & "; 6; '-d 2016-11-01 -dir directory -f file -p -r -h; correct? " & Boolean' Image(ARGB_CASE6) & "!; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 6; '-d 2016-11-01 -dir directory -f file -p -r -h; correct? " & Boolean' Image(ARGB_CASE6) & "!; " & Test_Info.CURRENT_DATE & ";YES");


      --Case7:
      Assert_Exception (Proc_Case7'Access,
                        Test_Info.SW_VERSION & "; 7; '-w; " & "Void" & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 7; '-w; " & "Constraint_Error" & "; " & Test_Info.CURRENT_DATE & ";YES");

--  begin read only
   end Test_initialize;
--  end read only


--  begin read only
   procedure Test_validateDate (Gnattest_T : in out Test);
   procedure Test_validateDate_7d41a6 (Gnattest_T : in out Test) renames Test_validateDate;
--  id:2.2/7d41a624a8050212/validateDate/1/0/
   procedure Test_validateDate (Gnattest_T : in out Test) is
   --  param.ads:22:4:validateDate
--  end read only

      pragma Unreferenced (Gnattest_T);
      ARGS_CASE8 : String (1 .. 10) := "2016-11-01";
      ARGS_CASE9 : String (1 .. 10) := "201-11-101";
      ARGS_CASE10_1 : String (1 .. 10) := "2016-42-01";
      ARGS_CASE10_2 : String (1 .. 10) := "2016-11-42";
      ARGS_CASE11 : String (1 .. 10) := "2016-10-31";
      ARGS_CASE12 : String (1 .. 10) := "2016-11-31";
      ARGS_CASE13 : String (1 .. 10) := "2016-11-30";
      ARGS_CASE14 : String (1 .. 10) := "2016-02-30";
      ARGS_CASE15_1 : String (1 .. 10) := "2016-02-29";
      ARGS_CASE15_2 : String (1 .. 10) := "2000-02-29";
      ARGS_CASE16_1 : String (1 .. 10) := "2015-02-29";
      ARGS_CASE16_2 : String (1 .. 10) := "1900-02-29";
      ARGS_CASE17 : String (1 .. 10) := "2015-02-28";
      ARGS_CASE18 : String (1 .. 10) := "201?-02-29";
      ARGS_CASE19_1 : String (1 .. 10) := "201?-42-28";
      ARGS_CASE19_2 : String (1 .. 10) := "201?-02-42";
      ARGS_CASE20 : String (1 .. 10) := "2015-0?-31";
      ARGS_CASE21 : String (1 .. 10) := "2015-0?-42";
      ARGS_CASE22 : String (1 .. 10) := "2015-02-2?";
      ARGS_CASE23 : String (1 .. 10) := "2015-42-2?";
      ARGS_CASE24 : String (1 .. 10) := "????-??-??";
      ARGS_CASE25 : String (1 .. 10) := "??-??-????";


   begin

      --Case8:
      AUnit.Assertions.Assert
        (validateDate(ARGS_CASE8),
         Test_Info.SW_VERSION & "; 8; " & ARGS_CASE8 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE8)) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 8; " & ARGS_CASE8 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE8)) & "; " & Test_Info.CURRENT_DATE & ";YES");


      --Case9:
      AUnit.Assertions.Assert
        (not validateDate(ARGS_CASE9),
         Test_Info.SW_VERSION & "; 9; " & ARGS_CASE9 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE9)) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 9; " & ARGS_CASE9 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE9)) & "; " & Test_Info.CURRENT_DATE & ";YES");


      --Case10:
      AUnit.Assertions.Assert
        (not validateDate(ARGS_CASE10_1),
         Test_Info.SW_VERSION & "; 10; " & ARGS_CASE10_1 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE10_1)) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 10; " & ARGS_CASE10_1 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE10_1)) & "; " & Test_Info.CURRENT_DATE & ";YES");

      AUnit.Assertions.Assert
        (not validateDate(ARGS_CASE10_2),
         Test_Info.SW_VERSION & "; 10; " & ARGS_CASE10_2 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE10_2)) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 10; " & ARGS_CASE10_2 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE10_2)) & "; " & Test_Info.CURRENT_DATE & ";YES");


      --Case11:
       AUnit.Assertions.Assert
        (validateDate(ARGS_CASE11),
         Test_Info.SW_VERSION & "; 11; " & ARGS_CASE11 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE11)) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 11; " & ARGS_CASE11 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE11)) & "; " & Test_Info.CURRENT_DATE & ";YES");


      --Case12:
       AUnit.Assertions.Assert
        (not validateDate(ARGS_CASE12),
         Test_Info.SW_VERSION & "; 12; " & ARGS_CASE12 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE12)) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 12; " & ARGS_CASE12 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE12)) & "; " & Test_Info.CURRENT_DATE & ";YES");


      --Case13:
       AUnit.Assertions.Assert
        (validateDate(ARGS_CASE13),
         Test_Info.SW_VERSION & "; 13; " & ARGS_CASE13 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE13)) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 13; " & ARGS_CASE13 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE13)) & "; " & Test_Info.CURRENT_DATE & ";YES");


      --Case14:
       AUnit.Assertions.Assert
        (not validateDate(ARGS_CASE14),
         Test_Info.SW_VERSION & "; 14; " & ARGS_CASE14 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE14)) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 14; " & ARGS_CASE14 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE14)) & "; " & Test_Info.CURRENT_DATE & ";YES");


      --Case15:
       AUnit.Assertions.Assert
        (validateDate(ARGS_CASE15_1),
         Test_Info.SW_VERSION & "; 15; " & ARGS_CASE15_1 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE15_1)) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 15; " & ARGS_CASE15_1 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE15_1)) & "; " & Test_Info.CURRENT_DATE & ";YES");

       AUnit.Assertions.Assert
        (validateDate(ARGS_CASE15_2),
         Test_Info.SW_VERSION & "; 15; " & ARGS_CASE15_2 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE15_2)) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 15; " & ARGS_CASE15_2 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE15_2)) & "; " & Test_Info.CURRENT_DATE & ";YES");


      --Case16:
       AUnit.Assertions.Assert
        (not validateDate(ARGS_CASE16_1),
         Test_Info.SW_VERSION & "; 16; " & ARGS_CASE16_1 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE16_1)) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 16; " & ARGS_CASE16_1 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE16_1)) & "; " & Test_Info.CURRENT_DATE & ";YES");

       AUnit.Assertions.Assert
        (not validateDate(ARGS_CASE16_2),
         Test_Info.SW_VERSION & "; 16; " & ARGS_CASE16_2 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE16_2)) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 16; " & ARGS_CASE16_2 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE16_2)) & "; " & Test_Info.CURRENT_DATE & ";YES");


      --Case17:
       AUnit.Assertions.Assert
        (validateDate(ARGS_CASE17),
         Test_Info.SW_VERSION & "; 17; " & ARGS_CASE17 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE17)) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 17; " & ARGS_CASE17 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE17)) & "; " & Test_Info.CURRENT_DATE & ";YES");


      --Case18:
       AUnit.Assertions.Assert
        (validateDate(ARGS_CASE18),
         Test_Info.SW_VERSION & "; 18; " & ARGS_CASE18 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE18)) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 18; " & ARGS_CASE18 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE18)) & "; " & Test_Info.CURRENT_DATE & ";YES");


      --Case19:
       AUnit.Assertions.Assert
        (not validateDate(ARGS_CASE19_1),
         Test_Info.SW_VERSION & "; 19; " & ARGS_CASE19_1 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE19_1)) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 19; " & ARGS_CASE19_1 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE19_1)) & "; " & Test_Info.CURRENT_DATE & ";YES");

       AUnit.Assertions.Assert
        (not validateDate(ARGS_CASE19_2),
         Test_Info.SW_VERSION & "; 19; " & ARGS_CASE19_2 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE19_2)) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 19; " & ARGS_CASE19_2 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE19_2)) & "; " & Test_Info.CURRENT_DATE & ";YES");


      --Case20:
       AUnit.Assertions.Assert
        (validateDate(ARGS_CASE20),
         Test_Info.SW_VERSION & "; 20; " & ARGS_CASE20 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE20)) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 20; " & ARGS_CASE20 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE20)) & "; " & Test_Info.CURRENT_DATE & ";YES");


      --Case21:
       AUnit.Assertions.Assert
        (not validateDate(ARGS_CASE21),
         Test_Info.SW_VERSION & "; 21; " & ARGS_CASE21 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE21)) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 21; " & ARGS_CASE21 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE21)) & "; " & Test_Info.CURRENT_DATE & ";YES");


      --Case22:
       AUnit.Assertions.Assert
        (validateDate(ARGS_CASE22),
         Test_Info.SW_VERSION & "; 22; " & ARGS_CASE22 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE22)) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 22; " & ARGS_CASE22 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE22)) & "; " & Test_Info.CURRENT_DATE & ";YES");


      --Case23:
       AUnit.Assertions.Assert
        (not validateDate(ARGS_CASE23),
         Test_Info.SW_VERSION & "; 23; " & ARGS_CASE23 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE23)) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 23; " & ARGS_CASE23 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE23)) & "; " & Test_Info.CURRENT_DATE & ";YES");


      --Case24:
       AUnit.Assertions.Assert
        (validateDate(ARGS_CASE24),
         Test_Info.SW_VERSION & "; 24; " & ARGS_CASE24 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE24)) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 24; " & ARGS_CASE24 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE24)) & "; " & Test_Info.CURRENT_DATE & ";YES");


      --Case25:
       AUnit.Assertions.Assert
        (not validateDate(ARGS_CASE25),
         Test_Info.SW_VERSION & "; 25; " & ARGS_CASE25 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE25)) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 25; " & ARGS_CASE25 & "; Valid? " & Boolean' Image(validateDate(ARGS_CASE25)) & "; " & Test_Info.CURRENT_DATE & ";YES");



--  begin read only
   end Test_validateDate;
--  end read only

end Param.Test_Data.Tests;
