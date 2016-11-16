--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Param.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Param.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_initialize_b0ff4a : aliased Runner_1.Test_Case;
   Case_2_1_Test_validateDate_7d41a6 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_initialize_b0ff4a,
         "param.ads:17:4:",
         Test_initialize_b0ff4a'Access);
      Runner_1.Create
        (Case_2_1_Test_validateDate_7d41a6,
         "param.ads:22:4:",
         Test_validateDate_7d41a6'Access);

      Result.Add_Test (Case_1_1_Test_initialize_b0ff4a'Access);
      Result.Add_Test (Case_2_1_Test_validateDate_7d41a6'Access);

      return Result'Access;

   end Suite;

end Param.Test_Data.Tests.Suite;
--  end read only
