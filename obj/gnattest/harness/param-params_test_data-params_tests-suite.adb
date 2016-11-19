--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Param.params_Test_Data.params_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Param.params_Test_Data.params_Tests.Test_params);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_getParams_279e1e : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_getParams_279e1e,
         "param.ads:19:4:",
         Test_getParams_279e1e'Access);

      Result.Add_Test (Case_1_1_Test_getParams_279e1e'Access);

      return Result'Access;

   end Suite;

end Param.params_Test_Data.params_Tests.Suite;
--  end read only
