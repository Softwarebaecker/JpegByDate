--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Param.params_Test_Data.

with AUnit.Assertions; use AUnit.Assertions;
with Ada.Text_IO; use Ada.Text_IO;
with Test_Info;

package body Param.params_Test_Data.params_Tests is


--  begin read only
   procedure Test_getParams (Gnattest_T : in out Test_params);
   procedure Test_getParams_279e1e (Gnattest_T : in out Test_params) renames Test_getParams;
--  id:2.2/279e1e69d9481bd3/getParams/1/0/
   procedure Test_getParams (Gnattest_T : in out Test_params) is
   --  param.ads:19:4:getParams
--  end read only

      pragma Unreferenced (Gnattest_T);
      ARGC_CASE26 : Integer := 0;
      ARGA_CASE26 : Input (1 .. 1);
      ARGB_CASE26 : Boolean;
      ARGP_CASE26 : params;
      parameter: aliased params;

   begin

      --Case26:
      ARGA_CASE26(1) := To_Unbounded_String("");
      initialize(ARGC_CASE26, ARGA_CASE26);
      ARGP_CASE26 := getParams;
      ARGB_CASE26 := parameter.date = ARGP_CASE26.date
        and parameter.isHelp = ARGP_CASE26.isHelp
        and parameter.isRecursive = ARGP_CASE26.isRecursive
        and parameter.fileName = ARGP_CASE26.fileName
        and parameter.directory = ARGP_CASE26.directory
        and parameter.isWholePath = ARGP_CASE26.isWholePath;
      AUnit.Assertions.Assert
        (ARGB_CASE26,
         Test_Info.SW_VERSION & "; 26; ; correct? " & Boolean' Image(ARGB_CASE26) & "; " & Test_Info.CURRENT_DATE & ";NO");
      put_line(Test_Info.SW_VERSION & "; 26; ; correct? " & Boolean' Image(ARGB_CASE26) & "; " & Test_Info.CURRENT_DATE & ";YES");

--  begin read only
   end Test_getParams;
--  end read only

end Param.params_Test_Data.params_Tests;
