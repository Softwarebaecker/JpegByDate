--  This package has been generated automatically by GNATtest.
--  You are allowed to add your code to the bodies of test routines.
--  Such changes will be kept during further regeneration of this file.
--  All code placed outside of test routine bodies will be lost. The
--  code intended to set up and tear down the test environment should be
--  placed into Search.Test_Data.

with AUnit.Assertions; use AUnit.Assertions;

package body Search.Test_Data.Tests is


--  begin read only
   procedure Test_Search_Directory (Gnattest_T : in out Test);
   procedure Test_Search_Directory_666e42 (Gnattest_T : in out Test) renames Test_Search_Directory;
--  id:2.2/666e42ddc6ad60a3/Search_Directory/1/0/
   procedure Test_Search_Directory (Gnattest_T : in out Test) is
   --  search.ads:4:4:Search_Directory
--  end read only

      pragma Unreferenced (Gnattest_T);

   begin

      AUnit.Assertions.Assert
        (Gnattest_Generated.Default_Assert_Value,
         "Test not implemented.");

--  begin read only
   end Test_Search_Directory;
--  end read only

end Search.Test_Data.Tests;
