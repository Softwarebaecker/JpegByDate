pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__test_runner.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__test_runner.adb");
with Ada.Exceptions;

package body ada_main is
   pragma Warnings (Off);

   E179 : Short_Integer; pragma Import (Ada, E179, "system__os_lib_E");
   E020 : Short_Integer; pragma Import (Ada, E020, "system__soft_links_E");
   E028 : Short_Integer; pragma Import (Ada, E028, "system__exception_table_E");
   E230 : Short_Integer; pragma Import (Ada, E230, "ada__containers_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "ada__io_exceptions_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "ada__strings_E");
   E123 : Short_Integer; pragma Import (Ada, E123, "ada__strings__maps_E");
   E166 : Short_Integer; pragma Import (Ada, E166, "ada__strings__maps__constants_E");
   E014 : Short_Integer; pragma Import (Ada, E014, "ada__tags_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "ada__streams_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "interfaces__c_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "interfaces__c__strings_E");
   E030 : Short_Integer; pragma Import (Ada, E030, "system__exceptions_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "system__finalization_root_E");
   E095 : Short_Integer; pragma Import (Ada, E095, "ada__finalization_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "system__storage_pools_E");
   E087 : Short_Integer; pragma Import (Ada, E087, "system__finalization_masters_E");
   E144 : Short_Integer; pragma Import (Ada, E144, "system__storage_pools__subpools_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "ada__calendar_E");
   E236 : Short_Integer; pragma Import (Ada, E236, "ada__calendar__time_zones_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "gnat__directory_operations_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "system__pool_global_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "system__file_control_block_E");
   E208 : Short_Integer; pragma Import (Ada, E208, "ada__streams__stream_io_E");
   E175 : Short_Integer; pragma Import (Ada, E175, "system__file_io_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "system__object_reader_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "system__dwarf_lines_E");
   E024 : Short_Integer; pragma Import (Ada, E024, "system__secondary_stack_E");
   E168 : Short_Integer; pragma Import (Ada, E168, "ada__strings__unbounded_E");
   E232 : Short_Integer; pragma Import (Ada, E232, "ada__directories_E");
   E194 : Short_Integer; pragma Import (Ada, E194, "system__regexp_E");
   E163 : Short_Integer; pragma Import (Ada, E163, "gnat__command_line_E");
   E206 : Short_Integer; pragma Import (Ada, E206, "system__strings__stream_ops_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "ada__text_io_E");
   E068 : Short_Integer; pragma Import (Ada, E068, "ada_containers__aunit_lists_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "aunit_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "aunit__memory_E");
   E070 : Short_Integer; pragma Import (Ada, E070, "aunit__memory__utils_E");
   E085 : Short_Integer; pragma Import (Ada, E085, "aunit__tests_E");
   E061 : Short_Integer; pragma Import (Ada, E061, "aunit__test_filters_E");
   E074 : Short_Integer; pragma Import (Ada, E074, "aunit__time_measure_E");
   E072 : Short_Integer; pragma Import (Ada, E072, "aunit__test_results_E");
   E065 : Short_Integer; pragma Import (Ada, E065, "aunit__assertions_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "aunit__reporter_E");
   E155 : Short_Integer; pragma Import (Ada, E155, "aunit__reporter__gnattest_E");
   E063 : Short_Integer; pragma Import (Ada, E063, "aunit__simple_test_cases_E");
   E214 : Short_Integer; pragma Import (Ada, E214, "aunit__test_fixtures_E");
   E221 : Short_Integer; pragma Import (Ada, E221, "aunit__test_caller_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "aunit__test_suites_E");
   E159 : Short_Integer; pragma Import (Ada, E159, "aunit__run_E");
   E202 : Short_Integer; pragma Import (Ada, E202, "globaltypes_E");
   E198 : Short_Integer; pragma Import (Ada, E198, "gnattest_main_suite_E");
   E249 : Short_Integer; pragma Import (Ada, E249, "imagefile_E");
   E200 : Short_Integer; pragma Import (Ada, E200, "param_E");
   E212 : Short_Integer; pragma Import (Ada, E212, "param__params_test_data_E");
   E216 : Short_Integer; pragma Import (Ada, E216, "param__params_test_data__params_tests_E");
   E219 : Short_Integer; pragma Import (Ada, E219, "param__params_test_data__params_tests__suite_E");
   E223 : Short_Integer; pragma Import (Ada, E223, "param__test_data_E");
   E225 : Short_Integer; pragma Import (Ada, E225, "param__test_data__tests_E");
   E227 : Short_Integer; pragma Import (Ada, E227, "param__test_data__tests__suite_E");
   E229 : Short_Integer; pragma Import (Ada, E229, "search_E");
   E256 : Short_Integer; pragma Import (Ada, E256, "search__test_data_E");
   E258 : Short_Integer; pragma Import (Ada, E258, "search__test_data__tests_E");
   E260 : Short_Integer; pragma Import (Ada, E260, "search__test_data__tests__suite_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E216 := E216 - 1;
      E225 := E225 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "search__test_data__tests__suite__finalize_body");
      begin
         E260 := E260 - 1;
         F1;
      end;
      E258 := E258 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "search__test_data__tests__finalize_spec");
      begin
         F2;
      end;
      E256 := E256 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "search__test_data__finalize_spec");
      begin
         F3;
      end;
      E229 := E229 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "search__finalize_spec");
      begin
         F4;
      end;
      declare
         procedure F5;
         pragma Import (Ada, F5, "param__test_data__tests__suite__finalize_body");
      begin
         E227 := E227 - 1;
         F5;
      end;
      declare
         procedure F6;
         pragma Import (Ada, F6, "param__test_data__tests__finalize_spec");
      begin
         F6;
      end;
      E223 := E223 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "param__test_data__finalize_spec");
      begin
         F7;
      end;
      declare
         procedure F8;
         pragma Import (Ada, F8, "param__params_test_data__params_tests__suite__finalize_body");
      begin
         E219 := E219 - 1;
         F8;
      end;
      declare
         procedure F9;
         pragma Import (Ada, F9, "param__params_test_data__params_tests__finalize_spec");
      begin
         F9;
      end;
      declare
         procedure F10;
         pragma Import (Ada, F10, "param__params_test_data__finalize_body");
      begin
         E212 := E212 - 1;
         F10;
      end;
      declare
         procedure F11;
         pragma Import (Ada, F11, "param__params_test_data__finalize_spec");
      begin
         F11;
      end;
      declare
         procedure F12;
         pragma Import (Ada, F12, "param__finalize_body");
      begin
         E200 := E200 - 1;
         F12;
      end;
      declare
         procedure F13;
         pragma Import (Ada, F13, "param__finalize_spec");
      begin
         F13;
      end;
      E249 := E249 - 1;
      declare
         procedure F14;
         pragma Import (Ada, F14, "imagefile__finalize_spec");
      begin
         F14;
      end;
      E161 := E161 - 1;
      declare
         procedure F15;
         pragma Import (Ada, F15, "aunit__test_suites__finalize_spec");
      begin
         F15;
      end;
      E214 := E214 - 1;
      declare
         procedure F16;
         pragma Import (Ada, F16, "aunit__test_fixtures__finalize_spec");
      begin
         F16;
      end;
      E061 := E061 - 1;
      E063 := E063 - 1;
      declare
         procedure F17;
         pragma Import (Ada, F17, "aunit__simple_test_cases__finalize_spec");
      begin
         F17;
      end;
      E155 := E155 - 1;
      declare
         procedure F18;
         pragma Import (Ada, F18, "aunit__reporter__gnattest__finalize_spec");
      begin
         F18;
      end;
      E065 := E065 - 1;
      declare
         procedure F19;
         pragma Import (Ada, F19, "aunit__assertions__finalize_spec");
      begin
         F19;
      end;
      E072 := E072 - 1;
      declare
         procedure F20;
         pragma Import (Ada, F20, "aunit__test_results__finalize_spec");
      begin
         F20;
      end;
      declare
         procedure F21;
         pragma Import (Ada, F21, "aunit__test_filters__finalize_spec");
      begin
         F21;
      end;
      declare
         procedure F22;
         pragma Import (Ada, F22, "aunit__tests__finalize_spec");
      begin
         E085 := E085 - 1;
         F22;
      end;
      E173 := E173 - 1;
      declare
         procedure F23;
         pragma Import (Ada, F23, "ada__text_io__finalize_spec");
      begin
         F23;
      end;
      E232 := E232 - 1;
      E194 := E194 - 1;
      declare
         procedure F24;
         pragma Import (Ada, F24, "system__regexp__finalize_spec");
      begin
         F24;
      end;
      declare
         procedure F25;
         pragma Import (Ada, F25, "ada__directories__finalize_spec");
      begin
         F25;
      end;
      E168 := E168 - 1;
      declare
         procedure F26;
         pragma Import (Ada, F26, "ada__strings__unbounded__finalize_spec");
      begin
         F26;
      end;
      declare
         procedure F27;
         pragma Import (Ada, F27, "system__object_reader__finalize_body");
      begin
         E139 := E139 - 1;
         F27;
      end;
      E087 := E087 - 1;
      E144 := E144 - 1;
      declare
         procedure F28;
         pragma Import (Ada, F28, "system__file_io__finalize_body");
      begin
         E175 := E175 - 1;
         F28;
      end;
      declare
         procedure F29;
         pragma Import (Ada, F29, "system__object_reader__finalize_spec");
      begin
         F29;
      end;
      E208 := E208 - 1;
      declare
         procedure F30;
         pragma Import (Ada, F30, "ada__streams__stream_io__finalize_spec");
      begin
         F30;
      end;
      declare
         procedure F31;
         pragma Import (Ada, F31, "system__file_control_block__finalize_spec");
      begin
         E182 := E182 - 1;
         F31;
      end;
      E104 := E104 - 1;
      declare
         procedure F32;
         pragma Import (Ada, F32, "system__pool_global__finalize_spec");
      begin
         F32;
      end;
      declare
         procedure F33;
         pragma Import (Ada, F33, "system__storage_pools__subpools__finalize_spec");
      begin
         F33;
      end;
      declare
         procedure F34;
         pragma Import (Ada, F34, "system__finalization_masters__finalize_spec");
      begin
         F34;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");
   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Exception_Tracebacks : Integer;
      pragma Import (C, Exception_Tracebacks, "__gl_exception_tracebacks");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");

      procedure Install_Handler;
      pragma Import (C, Install_Handler, "__gnat_install_handler");

      Handler_Installed : Integer;
      pragma Import (C, Handler_Installed, "__gnat_handler_installed");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Exception_Tracebacks := 1;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      if Handler_Installed = 0 then
         Install_Handler;
      end if;

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E028 := E028 + 1;
      Ada.Containers'Elab_Spec;
      E230 := E230 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E098 := E098 + 1;
      Ada.Strings'Elab_Spec;
      E119 := E119 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E166 := E166 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E097 := E097 + 1;
      Interfaces.C'Elab_Spec;
      Interfaces.C.Strings'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E030 := E030 + 1;
      System.Finalization_Root'Elab_Spec;
      E100 := E100 + 1;
      Ada.Finalization'Elab_Spec;
      E095 := E095 + 1;
      System.Storage_Pools'Elab_Spec;
      E102 := E102 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Spec;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E076 := E076 + 1;
      Ada.Calendar.Time_Zones'Elab_Spec;
      E236 := E236 + 1;
      Gnat.Directory_Operations'Elab_Spec;
      System.Pool_Global'Elab_Spec;
      E104 := E104 + 1;
      System.File_Control_Block'Elab_Spec;
      E182 := E182 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      E208 := E208 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      System.File_Io'Elab_Body;
      E175 := E175 + 1;
      E144 := E144 + 1;
      System.Finalization_Masters'Elab_Body;
      E087 := E087 + 1;
      E116 := E116 + 1;
      E078 := E078 + 1;
      Ada.Tags'Elab_Body;
      E014 := E014 + 1;
      E123 := E123 + 1;
      System.Soft_Links'Elab_Body;
      E020 := E020 + 1;
      System.Os_Lib'Elab_Body;
      E179 := E179 + 1;
      System.Secondary_Stack'Elab_Body;
      E024 := E024 + 1;
      System.Dwarf_Lines'Elab_Body;
      E118 := E118 + 1;
      System.Object_Reader'Elab_Body;
      E139 := E139 + 1;
      Gnat.Directory_Operations'Elab_Body;
      E184 := E184 + 1;
      Ada.Strings.Unbounded'Elab_Spec;
      E168 := E168 + 1;
      Ada.Directories'Elab_Spec;
      System.Regexp'Elab_Spec;
      E194 := E194 + 1;
      Ada.Directories'Elab_Body;
      E232 := E232 + 1;
      Gnat.Command_Line'Elab_Spec;
      System.Strings.Stream_Ops'Elab_Body;
      E206 := E206 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E173 := E173 + 1;
      Gnat.Command_Line'Elab_Body;
      E163 := E163 + 1;
      E008 := E008 + 1;
      E005 := E005 + 1;
      E070 := E070 + 1;
      E068 := E068 + 1;
      Aunit.Tests'Elab_Spec;
      E085 := E085 + 1;
      Aunit.Test_Filters'Elab_Spec;
      Aunit.Time_Measure'Elab_Spec;
      E074 := E074 + 1;
      Aunit.Test_Results'Elab_Spec;
      Aunit.Test_Results'Elab_Body;
      E072 := E072 + 1;
      Aunit.Assertions'Elab_Spec;
      Aunit.Assertions'Elab_Body;
      E065 := E065 + 1;
      Aunit.Reporter'Elab_Spec;
      E153 := E153 + 1;
      Aunit.Reporter.Gnattest'Elab_Spec;
      E155 := E155 + 1;
      Aunit.Simple_Test_Cases'Elab_Spec;
      E063 := E063 + 1;
      E061 := E061 + 1;
      Aunit.Test_Fixtures'Elab_Spec;
      E214 := E214 + 1;
      E221 := E221 + 1;
      Aunit.Test_Suites'Elab_Spec;
      E161 := E161 + 1;
      E159 := E159 + 1;
      E202 := E202 + 1;
      imagefile'elab_spec;
      E249 := E249 + 1;
      Param'Elab_Spec;
      Param'Elab_Body;
      E200 := E200 + 1;
      Param.Params_Test_Data'Elab_Spec;
      Param.Params_Test_Data'Elab_Body;
      E212 := E212 + 1;
      Param.Params_Test_Data.Params_Tests'Elab_Spec;
      Param.Params_Test_Data.Params_Tests.Suite'Elab_Body;
      E219 := E219 + 1;
      Param.Test_Data'Elab_Spec;
      E223 := E223 + 1;
      Param.Test_Data.Tests'Elab_Spec;
      Param.Test_Data.Tests.Suite'Elab_Body;
      E227 := E227 + 1;
      Search'Elab_Spec;
      E229 := E229 + 1;
      Search.Test_Data'Elab_Spec;
      E256 := E256 + 1;
      Search.Test_Data.Tests'Elab_Spec;
      E258 := E258 + 1;
      Search.Test_Data.Tests.Suite'Elab_Body;
      E260 := E260 + 1;
      Gnattest_Main_Suite'Elab_Body;
      E198 := E198 + 1;
      E225 := E225 + 1;
      E216 := E216 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_test_runner");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   C:\GNAT\2014\Workspace\JpegByDate\obj\GlobalTypes.o
   --   C:\GNAT\2014\Workspace\JpegByDate\obj\gnattest\harness\gnattest_generated.o
   --   C:\GNAT\2014\Workspace\JpegByDate\obj\gnattest\harness\test_runner.o
   --   C:\GNAT\2014\Workspace\JpegByDate\obj\ImageFile.o
   --   C:\GNAT\2014\Workspace\JpegByDate\obj\param.o
   --   C:\GNAT\2014\Workspace\JpegByDate\obj\gnattest\harness\param-params_test_data.o
   --   C:\GNAT\2014\Workspace\JpegByDate\obj\gnattest\harness\param-params_test_data-params_tests-suite.o
   --   C:\GNAT\2014\Workspace\JpegByDate\obj\gnattest\harness\param-test_data.o
   --   C:\GNAT\2014\Workspace\JpegByDate\obj\gnattest\harness\param-test_data-tests-suite.o
   --   C:\GNAT\2014\Workspace\JpegByDate\obj\search.o
   --   C:\GNAT\2014\Workspace\JpegByDate\obj\gnattest\harness\search-test_data.o
   --   C:\GNAT\2014\Workspace\JpegByDate\obj\gnattest\harness\search-test_data-tests.o
   --   C:\GNAT\2014\Workspace\JpegByDate\obj\gnattest\harness\search-test_data-tests-suite.o
   --   C:\GNAT\2014\Workspace\JpegByDate\obj\gnattest\harness\gnattest_main_suite.o
   --   C:\GNAT\2014\Workspace\JpegByDate\obj\gnattest\harness\test_info.o
   --   C:\GNAT\2014\Workspace\JpegByDate\obj\gnattest\harness\param-test_data-tests.o
   --   C:\GNAT\2014\Workspace\JpegByDate\obj\gnattest\harness\param-params_test_data-params_tests.o
   --   -LC:\GNAT\2014\Workspace\JpegByDate\obj\gnattest\harness\
   --   -LC:\GNAT\2014\Workspace\JpegByDate\obj\gnattest\harness\
   --   -LC:\GNAT\2014\lib\aunit\native-full\
   --   -LC:\GNAT\2014\Workspace\JpegByDate\obj\
   --   -LC:/gnat/2014/lib/gcc/i686-pc-mingw32/4.7.4/adalib/
   --   -static
   --   -lgnat
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
