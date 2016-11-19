pragma Ada_95;
with System;
package ada_main is
   pragma Warnings (Off);

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2014 (20140331)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_test_runner" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#cdcd05d2#;
   pragma Export (C, u00001, "test_runnerB");
   u00002 : constant Version_32 := 16#fbff4c67#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#5c291747#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#fa79b673#;
   pragma Export (C, u00004, "aunitB");
   u00005 : constant Version_32 := 16#76cdf7c6#;
   pragma Export (C, u00005, "aunitS");
   u00006 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00006, "adaS");
   u00007 : constant Version_32 := 16#b6c145a2#;
   pragma Export (C, u00007, "aunit__memoryB");
   u00008 : constant Version_32 := 16#893408d6#;
   pragma Export (C, u00008, "aunit__memoryS");
   u00009 : constant Version_32 := 16#5fc8ae56#;
   pragma Export (C, u00009, "systemS");
   u00010 : constant Version_32 := 16#39a03df9#;
   pragma Export (C, u00010, "system__storage_elementsB");
   u00011 : constant Version_32 := 16#720be452#;
   pragma Export (C, u00011, "system__storage_elementsS");
   u00012 : constant Version_32 := 16#e99cd447#;
   pragma Export (C, u00012, "aunit__optionsS");
   u00013 : constant Version_32 := 16#034d7998#;
   pragma Export (C, u00013, "ada__tagsB");
   u00014 : constant Version_32 := 16#ce72c228#;
   pragma Export (C, u00014, "ada__tagsS");
   u00015 : constant Version_32 := 16#eaff8cdc#;
   pragma Export (C, u00015, "ada__exceptionsB");
   u00016 : constant Version_32 := 16#6a2091f5#;
   pragma Export (C, u00016, "ada__exceptionsS");
   u00017 : constant Version_32 := 16#032105bb#;
   pragma Export (C, u00017, "ada__exceptions__last_chance_handlerB");
   u00018 : constant Version_32 := 16#2b293877#;
   pragma Export (C, u00018, "ada__exceptions__last_chance_handlerS");
   u00019 : constant Version_32 := 16#daf76b33#;
   pragma Export (C, u00019, "system__soft_linksB");
   u00020 : constant Version_32 := 16#1517cb64#;
   pragma Export (C, u00020, "system__soft_linksS");
   u00021 : constant Version_32 := 16#c8ed38da#;
   pragma Export (C, u00021, "system__parametersB");
   u00022 : constant Version_32 := 16#591236e4#;
   pragma Export (C, u00022, "system__parametersS");
   u00023 : constant Version_32 := 16#c96bf39e#;
   pragma Export (C, u00023, "system__secondary_stackB");
   u00024 : constant Version_32 := 16#f4a9613f#;
   pragma Export (C, u00024, "system__secondary_stackS");
   u00025 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00025, "system__stack_checkingB");
   u00026 : constant Version_32 := 16#d177c5be#;
   pragma Export (C, u00026, "system__stack_checkingS");
   u00027 : constant Version_32 := 16#393398c1#;
   pragma Export (C, u00027, "system__exception_tableB");
   u00028 : constant Version_32 := 16#f1d1c843#;
   pragma Export (C, u00028, "system__exception_tableS");
   u00029 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00029, "system__exceptionsB");
   u00030 : constant Version_32 := 16#37abc3a0#;
   pragma Export (C, u00030, "system__exceptionsS");
   u00031 : constant Version_32 := 16#2652ec14#;
   pragma Export (C, u00031, "system__exceptions__machineS");
   u00032 : constant Version_32 := 16#b895431d#;
   pragma Export (C, u00032, "system__exceptions_debugB");
   u00033 : constant Version_32 := 16#ec2ab7e8#;
   pragma Export (C, u00033, "system__exceptions_debugS");
   u00034 : constant Version_32 := 16#570325c8#;
   pragma Export (C, u00034, "system__img_intB");
   u00035 : constant Version_32 := 16#5d134e94#;
   pragma Export (C, u00035, "system__img_intS");
   u00036 : constant Version_32 := 16#ff5c7695#;
   pragma Export (C, u00036, "system__tracebackB");
   u00037 : constant Version_32 := 16#77cc310b#;
   pragma Export (C, u00037, "system__tracebackS");
   u00038 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00038, "system__wch_conB");
   u00039 : constant Version_32 := 16#44b58c84#;
   pragma Export (C, u00039, "system__wch_conS");
   u00040 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00040, "system__wch_stwB");
   u00041 : constant Version_32 := 16#69a4a085#;
   pragma Export (C, u00041, "system__wch_stwS");
   u00042 : constant Version_32 := 16#9b29844d#;
   pragma Export (C, u00042, "system__wch_cnvB");
   u00043 : constant Version_32 := 16#4b023677#;
   pragma Export (C, u00043, "system__wch_cnvS");
   u00044 : constant Version_32 := 16#69adb1b9#;
   pragma Export (C, u00044, "interfacesS");
   u00045 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00045, "system__wch_jisB");
   u00046 : constant Version_32 := 16#cb722f56#;
   pragma Export (C, u00046, "system__wch_jisS");
   u00047 : constant Version_32 := 16#8cb17bcd#;
   pragma Export (C, u00047, "system__traceback_entriesB");
   u00048 : constant Version_32 := 16#ead9cec4#;
   pragma Export (C, u00048, "system__traceback_entriesS");
   u00049 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00049, "system__htableB");
   u00050 : constant Version_32 := 16#db0a1dbc#;
   pragma Export (C, u00050, "system__htableS");
   u00051 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00051, "system__string_hashB");
   u00052 : constant Version_32 := 16#795476c2#;
   pragma Export (C, u00052, "system__string_hashS");
   u00053 : constant Version_32 := 16#0ece3cf9#;
   pragma Export (C, u00053, "system__unsigned_typesS");
   u00054 : constant Version_32 := 16#4266b2a8#;
   pragma Export (C, u00054, "system__val_unsB");
   u00055 : constant Version_32 := 16#1e66d1c2#;
   pragma Export (C, u00055, "system__val_unsS");
   u00056 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00056, "system__val_utilB");
   u00057 : constant Version_32 := 16#f36818a8#;
   pragma Export (C, u00057, "system__val_utilS");
   u00058 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00058, "system__case_utilB");
   u00059 : constant Version_32 := 16#7bc1c781#;
   pragma Export (C, u00059, "system__case_utilS");
   u00060 : constant Version_32 := 16#e9d6512d#;
   pragma Export (C, u00060, "aunit__test_filtersB");
   u00061 : constant Version_32 := 16#9a67cba8#;
   pragma Export (C, u00061, "aunit__test_filtersS");
   u00062 : constant Version_32 := 16#6e9501f4#;
   pragma Export (C, u00062, "aunit__simple_test_casesB");
   u00063 : constant Version_32 := 16#f9679d50#;
   pragma Export (C, u00063, "aunit__simple_test_casesS");
   u00064 : constant Version_32 := 16#8872fb1a#;
   pragma Export (C, u00064, "aunit__assertionsB");
   u00065 : constant Version_32 := 16#b77653d9#;
   pragma Export (C, u00065, "aunit__assertionsS");
   u00066 : constant Version_32 := 16#11329e00#;
   pragma Export (C, u00066, "ada_containersS");
   u00067 : constant Version_32 := 16#f3e31461#;
   pragma Export (C, u00067, "ada_containers__aunit_listsB");
   u00068 : constant Version_32 := 16#c8d9569a#;
   pragma Export (C, u00068, "ada_containers__aunit_listsS");
   u00069 : constant Version_32 := 16#9b1c7ff2#;
   pragma Export (C, u00069, "aunit__memory__utilsB");
   u00070 : constant Version_32 := 16#fb2f6c57#;
   pragma Export (C, u00070, "aunit__memory__utilsS");
   u00071 : constant Version_32 := 16#01adf261#;
   pragma Export (C, u00071, "aunit__test_resultsB");
   u00072 : constant Version_32 := 16#e00b278d#;
   pragma Export (C, u00072, "aunit__test_resultsS");
   u00073 : constant Version_32 := 16#c4150d4d#;
   pragma Export (C, u00073, "aunit__time_measureB");
   u00074 : constant Version_32 := 16#f695c452#;
   pragma Export (C, u00074, "aunit__time_measureS");
   u00075 : constant Version_32 := 16#65712768#;
   pragma Export (C, u00075, "ada__calendarB");
   u00076 : constant Version_32 := 16#e791e294#;
   pragma Export (C, u00076, "ada__calendarS");
   u00077 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00077, "interfaces__cB");
   u00078 : constant Version_32 := 16#3b563890#;
   pragma Export (C, u00078, "interfaces__cS");
   u00079 : constant Version_32 := 16#d950d226#;
   pragma Export (C, u00079, "system__os_primitivesB");
   u00080 : constant Version_32 := 16#ef19227f#;
   pragma Export (C, u00080, "system__os_primitivesS");
   u00081 : constant Version_32 := 16#0881bbf8#;
   pragma Export (C, u00081, "system__task_lockB");
   u00082 : constant Version_32 := 16#3e429938#;
   pragma Export (C, u00082, "system__task_lockS");
   u00083 : constant Version_32 := 16#bc10dd48#;
   pragma Export (C, u00083, "system__win32S");
   u00084 : constant Version_32 := 16#1a9147da#;
   pragma Export (C, u00084, "system__win32__extS");
   u00085 : constant Version_32 := 16#6b6cea8f#;
   pragma Export (C, u00085, "aunit__testsS");
   u00086 : constant Version_32 := 16#a4371844#;
   pragma Export (C, u00086, "system__finalization_mastersB");
   u00087 : constant Version_32 := 16#2bde8716#;
   pragma Export (C, u00087, "system__finalization_mastersS");
   u00088 : constant Version_32 := 16#57a37a42#;
   pragma Export (C, u00088, "system__address_imageB");
   u00089 : constant Version_32 := 16#fe24336c#;
   pragma Export (C, u00089, "system__address_imageS");
   u00090 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00090, "system__img_boolB");
   u00091 : constant Version_32 := 16#aa11dfbd#;
   pragma Export (C, u00091, "system__img_boolS");
   u00092 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00092, "system__ioB");
   u00093 : constant Version_32 := 16#c18a5919#;
   pragma Export (C, u00093, "system__ioS");
   u00094 : constant Version_32 := 16#b7ab275c#;
   pragma Export (C, u00094, "ada__finalizationB");
   u00095 : constant Version_32 := 16#19f764ca#;
   pragma Export (C, u00095, "ada__finalizationS");
   u00096 : constant Version_32 := 16#1b5643e2#;
   pragma Export (C, u00096, "ada__streamsB");
   u00097 : constant Version_32 := 16#2564c958#;
   pragma Export (C, u00097, "ada__streamsS");
   u00098 : constant Version_32 := 16#db5c917c#;
   pragma Export (C, u00098, "ada__io_exceptionsS");
   u00099 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00099, "system__finalization_rootB");
   u00100 : constant Version_32 := 16#103addc6#;
   pragma Export (C, u00100, "system__finalization_rootS");
   u00101 : constant Version_32 := 16#6d4d969a#;
   pragma Export (C, u00101, "system__storage_poolsB");
   u00102 : constant Version_32 := 16#aa9329d2#;
   pragma Export (C, u00102, "system__storage_poolsS");
   u00103 : constant Version_32 := 16#e34550ca#;
   pragma Export (C, u00103, "system__pool_globalB");
   u00104 : constant Version_32 := 16#c88d2d16#;
   pragma Export (C, u00104, "system__pool_globalS");
   u00105 : constant Version_32 := 16#3a4ba6c3#;
   pragma Export (C, u00105, "system__memoryB");
   u00106 : constant Version_32 := 16#06b5c862#;
   pragma Export (C, u00106, "system__memoryS");
   u00107 : constant Version_32 := 16#fd2ad2f1#;
   pragma Export (C, u00107, "gnatS");
   u00108 : constant Version_32 := 16#583a0822#;
   pragma Export (C, u00108, "gnat__source_infoS");
   u00109 : constant Version_32 := 16#6fcb5f46#;
   pragma Export (C, u00109, "gnat__tracebackB");
   u00110 : constant Version_32 := 16#20845b9b#;
   pragma Export (C, u00110, "gnat__tracebackS");
   u00111 : constant Version_32 := 16#25f70bc7#;
   pragma Export (C, u00111, "ada__exceptions__tracebackB");
   u00112 : constant Version_32 := 16#aa4a3381#;
   pragma Export (C, u00112, "ada__exceptions__tracebackS");
   u00113 : constant Version_32 := 16#c92b0e7c#;
   pragma Export (C, u00113, "gnat__traceback__symbolicB");
   u00114 : constant Version_32 := 16#8f8888fd#;
   pragma Export (C, u00114, "gnat__traceback__symbolicS");
   u00115 : constant Version_32 := 16#877b0450#;
   pragma Export (C, u00115, "interfaces__c__stringsB");
   u00116 : constant Version_32 := 16#603c1c44#;
   pragma Export (C, u00116, "interfaces__c__stringsS");
   u00117 : constant Version_32 := 16#46c390ae#;
   pragma Export (C, u00117, "system__dwarf_linesB");
   u00118 : constant Version_32 := 16#77101bf9#;
   pragma Export (C, u00118, "system__dwarf_linesS");
   u00119 : constant Version_32 := 16#af50e98f#;
   pragma Export (C, u00119, "ada__stringsS");
   u00120 : constant Version_32 := 16#35b254f4#;
   pragma Export (C, u00120, "ada__strings__boundedB");
   u00121 : constant Version_32 := 16#426c236a#;
   pragma Export (C, u00121, "ada__strings__boundedS");
   u00122 : constant Version_32 := 16#e2ea8656#;
   pragma Export (C, u00122, "ada__strings__mapsB");
   u00123 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00123, "ada__strings__mapsS");
   u00124 : constant Version_32 := 16#374ed1bf#;
   pragma Export (C, u00124, "system__bit_opsB");
   u00125 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00125, "system__bit_opsS");
   u00126 : constant Version_32 := 16#12c24a43#;
   pragma Export (C, u00126, "ada__charactersS");
   u00127 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00127, "ada__characters__latin_1S");
   u00128 : constant Version_32 := 16#a9b52bad#;
   pragma Export (C, u00128, "ada__strings__superboundedB");
   u00129 : constant Version_32 := 16#da6addee#;
   pragma Export (C, u00129, "ada__strings__superboundedS");
   u00130 : constant Version_32 := 16#c093955c#;
   pragma Export (C, u00130, "ada__strings__searchB");
   u00131 : constant Version_32 := 16#c1ab8667#;
   pragma Export (C, u00131, "ada__strings__searchS");
   u00132 : constant Version_32 := 16#5b9edcc4#;
   pragma Export (C, u00132, "system__compare_array_unsigned_8B");
   u00133 : constant Version_32 := 16#f6cbdfdb#;
   pragma Export (C, u00133, "system__compare_array_unsigned_8S");
   u00134 : constant Version_32 := 16#5f72f755#;
   pragma Export (C, u00134, "system__address_operationsB");
   u00135 : constant Version_32 := 16#4cc41065#;
   pragma Export (C, u00135, "system__address_operationsS");
   u00136 : constant Version_32 := 16#22ab03a2#;
   pragma Export (C, u00136, "system__img_unsB");
   u00137 : constant Version_32 := 16#913a000e#;
   pragma Export (C, u00137, "system__img_unsS");
   u00138 : constant Version_32 := 16#bc46adf2#;
   pragma Export (C, u00138, "system__object_readerB");
   u00139 : constant Version_32 := 16#576d96a2#;
   pragma Export (C, u00139, "system__object_readerS");
   u00140 : constant Version_32 := 16#9f23726e#;
   pragma Export (C, u00140, "interfaces__c_streamsB");
   u00141 : constant Version_32 := 16#bb1012c3#;
   pragma Export (C, u00141, "interfaces__c_streamsS");
   u00142 : constant Version_32 := 16#75131373#;
   pragma Export (C, u00142, "system__crtlS");
   u00143 : constant Version_32 := 16#7b002481#;
   pragma Export (C, u00143, "system__storage_pools__subpoolsB");
   u00144 : constant Version_32 := 16#e3b008dc#;
   pragma Export (C, u00144, "system__storage_pools__subpoolsS");
   u00145 : constant Version_32 := 16#63f11652#;
   pragma Export (C, u00145, "system__storage_pools__subpools__finalizationB");
   u00146 : constant Version_32 := 16#fe2f4b3a#;
   pragma Export (C, u00146, "system__storage_pools__subpools__finalizationS");
   u00147 : constant Version_32 := 16#ffe20862#;
   pragma Export (C, u00147, "system__stream_attributesB");
   u00148 : constant Version_32 := 16#e5402c91#;
   pragma Export (C, u00148, "system__stream_attributesS");
   u00149 : constant Version_32 := 16#e892b88e#;
   pragma Export (C, u00149, "system__val_lliB");
   u00150 : constant Version_32 := 16#c5ec48f6#;
   pragma Export (C, u00150, "system__val_lliS");
   u00151 : constant Version_32 := 16#1e25d3f1#;
   pragma Export (C, u00151, "system__val_lluB");
   u00152 : constant Version_32 := 16#743c6b8b#;
   pragma Export (C, u00152, "system__val_lluS");
   u00153 : constant Version_32 := 16#17d955ab#;
   pragma Export (C, u00153, "aunit__reporterS");
   u00154 : constant Version_32 := 16#7b8e83ce#;
   pragma Export (C, u00154, "aunit__reporter__gnattestB");
   u00155 : constant Version_32 := 16#9cd34a09#;
   pragma Export (C, u00155, "aunit__reporter__gnattestS");
   u00156 : constant Version_32 := 16#b48102f5#;
   pragma Export (C, u00156, "gnat__ioB");
   u00157 : constant Version_32 := 16#6227e843#;
   pragma Export (C, u00157, "gnat__ioS");
   u00158 : constant Version_32 := 16#11965634#;
   pragma Export (C, u00158, "aunit__runB");
   u00159 : constant Version_32 := 16#4b2a8016#;
   pragma Export (C, u00159, "aunit__runS");
   u00160 : constant Version_32 := 16#d01edb9b#;
   pragma Export (C, u00160, "aunit__test_suitesB");
   u00161 : constant Version_32 := 16#f3c7e671#;
   pragma Export (C, u00161, "aunit__test_suitesS");
   u00162 : constant Version_32 := 16#6f82b887#;
   pragma Export (C, u00162, "gnat__command_lineB");
   u00163 : constant Version_32 := 16#c4427fe3#;
   pragma Export (C, u00163, "gnat__command_lineS");
   u00164 : constant Version_32 := 16#8f637df8#;
   pragma Export (C, u00164, "ada__characters__handlingB");
   u00165 : constant Version_32 := 16#3b3f6154#;
   pragma Export (C, u00165, "ada__characters__handlingS");
   u00166 : constant Version_32 := 16#92f05f13#;
   pragma Export (C, u00166, "ada__strings__maps__constantsS");
   u00167 : constant Version_32 := 16#261c554b#;
   pragma Export (C, u00167, "ada__strings__unboundedB");
   u00168 : constant Version_32 := 16#e303cf90#;
   pragma Export (C, u00168, "ada__strings__unboundedS");
   u00169 : constant Version_32 := 16#5073d598#;
   pragma Export (C, u00169, "system__machine_codeS");
   u00170 : constant Version_32 := 16#e5ac57f8#;
   pragma Export (C, u00170, "system__atomic_countersB");
   u00171 : constant Version_32 := 16#92b43a9c#;
   pragma Export (C, u00171, "system__atomic_countersS");
   u00172 : constant Version_32 := 16#1ac8b3b4#;
   pragma Export (C, u00172, "ada__text_ioB");
   u00173 : constant Version_32 := 16#ba9eea88#;
   pragma Export (C, u00173, "ada__text_ioS");
   u00174 : constant Version_32 := 16#967994fc#;
   pragma Export (C, u00174, "system__file_ioB");
   u00175 : constant Version_32 := 16#e3384250#;
   pragma Export (C, u00175, "system__file_ioS");
   u00176 : constant Version_32 := 16#d0432c8d#;
   pragma Export (C, u00176, "system__img_enum_newB");
   u00177 : constant Version_32 := 16#3e84a896#;
   pragma Export (C, u00177, "system__img_enum_newS");
   u00178 : constant Version_32 := 16#a25be73b#;
   pragma Export (C, u00178, "system__os_libB");
   u00179 : constant Version_32 := 16#94c13856#;
   pragma Export (C, u00179, "system__os_libS");
   u00180 : constant Version_32 := 16#1a817b8e#;
   pragma Export (C, u00180, "system__stringsB");
   u00181 : constant Version_32 := 16#2177bf30#;
   pragma Export (C, u00181, "system__stringsS");
   u00182 : constant Version_32 := 16#906f0f88#;
   pragma Export (C, u00182, "system__file_control_blockS");
   u00183 : constant Version_32 := 16#d2ba3f74#;
   pragma Export (C, u00183, "gnat__directory_operationsB");
   u00184 : constant Version_32 := 16#de5549d5#;
   pragma Export (C, u00184, "gnat__directory_operationsS");
   u00185 : constant Version_32 := 16#e5480ede#;
   pragma Export (C, u00185, "ada__strings__fixedB");
   u00186 : constant Version_32 := 16#a86b22b3#;
   pragma Export (C, u00186, "ada__strings__fixedS");
   u00187 : constant Version_32 := 16#ebb9e033#;
   pragma Export (C, u00187, "gnat__os_libS");
   u00188 : constant Version_32 := 16#f8f38c17#;
   pragma Export (C, u00188, "system__val_intB");
   u00189 : constant Version_32 := 16#176d8469#;
   pragma Export (C, u00189, "system__val_intS");
   u00190 : constant Version_32 := 16#d9fb597b#;
   pragma Export (C, u00190, "ada__command_lineB");
   u00191 : constant Version_32 := 16#d59e21a4#;
   pragma Export (C, u00191, "ada__command_lineS");
   u00192 : constant Version_32 := 16#084c16d0#;
   pragma Export (C, u00192, "gnat__regexpS");
   u00193 : constant Version_32 := 16#933fac2f#;
   pragma Export (C, u00193, "system__regexpB");
   u00194 : constant Version_32 := 16#aa4c10b3#;
   pragma Export (C, u00194, "system__regexpS");
   u00195 : constant Version_32 := 16#b4645806#;
   pragma Export (C, u00195, "gnat__stringsS");
   u00196 : constant Version_32 := 16#33489ddc#;
   pragma Export (C, u00196, "gnattest_generatedS");
   u00197 : constant Version_32 := 16#79beb305#;
   pragma Export (C, u00197, "gnattest_main_suiteB");
   u00198 : constant Version_32 := 16#eea1e993#;
   pragma Export (C, u00198, "gnattest_main_suiteS");
   u00199 : constant Version_32 := 16#abf7cd23#;
   pragma Export (C, u00199, "paramB");
   u00200 : constant Version_32 := 16#6805ec8c#;
   pragma Export (C, u00200, "paramS");
   u00201 : constant Version_32 := 16#4b37b589#;
   pragma Export (C, u00201, "system__val_enumB");
   u00202 : constant Version_32 := 16#e4d2ecc3#;
   pragma Export (C, u00202, "system__val_enumS");
   u00203 : constant Version_32 := 16#a6cec3cf#;
   pragma Export (C, u00203, "system__strings__stream_opsB");
   u00204 : constant Version_32 := 16#5ed775a4#;
   pragma Export (C, u00204, "system__strings__stream_opsS");
   u00205 : constant Version_32 := 16#9f609ffa#;
   pragma Export (C, u00205, "ada__streams__stream_ioB");
   u00206 : constant Version_32 := 16#3aff46f1#;
   pragma Export (C, u00206, "ada__streams__stream_ioS");
   u00207 : constant Version_32 := 16#5de653db#;
   pragma Export (C, u00207, "system__communicationB");
   u00208 : constant Version_32 := 16#6f11cd91#;
   pragma Export (C, u00208, "system__communicationS");
   u00209 : constant Version_32 := 16#54efff58#;
   pragma Export (C, u00209, "param__params_test_dataB");
   u00210 : constant Version_32 := 16#f3f327eb#;
   pragma Export (C, u00210, "param__params_test_dataS");
   u00211 : constant Version_32 := 16#269b1972#;
   pragma Export (C, u00211, "aunit__test_fixturesB");
   u00212 : constant Version_32 := 16#3b99f1a5#;
   pragma Export (C, u00212, "aunit__test_fixturesS");
   u00213 : constant Version_32 := 16#d76fa29a#;
   pragma Export (C, u00213, "param__params_test_data__params_testsB");
   u00214 : constant Version_32 := 16#3d21b276#;
   pragma Export (C, u00214, "param__params_test_data__params_testsS");
   u00215 : constant Version_32 := 16#e0e722b4#;
   pragma Export (C, u00215, "test_infoS");
   u00216 : constant Version_32 := 16#12817d26#;
   pragma Export (C, u00216, "param__params_test_data__params_tests__suiteB");
   u00217 : constant Version_32 := 16#8ca72ff8#;
   pragma Export (C, u00217, "param__params_test_data__params_tests__suiteS");
   u00218 : constant Version_32 := 16#8f189ee8#;
   pragma Export (C, u00218, "aunit__test_callerB");
   u00219 : constant Version_32 := 16#581d22b8#;
   pragma Export (C, u00219, "aunit__test_callerS");
   u00220 : constant Version_32 := 16#c6f3ebcc#;
   pragma Export (C, u00220, "param__test_dataB");
   u00221 : constant Version_32 := 16#bff2ddf2#;
   pragma Export (C, u00221, "param__test_dataS");
   u00222 : constant Version_32 := 16#49ef437a#;
   pragma Export (C, u00222, "param__test_data__testsB");
   u00223 : constant Version_32 := 16#286a0bda#;
   pragma Export (C, u00223, "param__test_data__testsS");
   u00224 : constant Version_32 := 16#e6889926#;
   pragma Export (C, u00224, "param__test_data__tests__suiteB");
   u00225 : constant Version_32 := 16#91318ae0#;
   pragma Export (C, u00225, "param__test_data__tests__suiteS");
   u00226 : constant Version_32 := 16#8b0e0cae#;
   pragma Export (C, u00226, "searchB");
   u00227 : constant Version_32 := 16#1eac0e8b#;
   pragma Export (C, u00227, "searchS");
   u00228 : constant Version_32 := 16#7bfaddd0#;
   pragma Export (C, u00228, "ada__directoriesB");
   u00229 : constant Version_32 := 16#c81b541a#;
   pragma Export (C, u00229, "ada__directoriesS");
   u00230 : constant Version_32 := 16#7a13e6d7#;
   pragma Export (C, u00230, "ada__calendar__formattingB");
   u00231 : constant Version_32 := 16#929f882b#;
   pragma Export (C, u00231, "ada__calendar__formattingS");
   u00232 : constant Version_32 := 16#e3cca715#;
   pragma Export (C, u00232, "ada__calendar__time_zonesB");
   u00233 : constant Version_32 := 16#98f012d7#;
   pragma Export (C, u00233, "ada__calendar__time_zonesS");
   u00234 : constant Version_32 := 16#8ff77155#;
   pragma Export (C, u00234, "system__val_realB");
   u00235 : constant Version_32 := 16#a1e1d947#;
   pragma Export (C, u00235, "system__val_realS");
   u00236 : constant Version_32 := 16#0be1b996#;
   pragma Export (C, u00236, "system__exn_llfB");
   u00237 : constant Version_32 := 16#de4cb0b9#;
   pragma Export (C, u00237, "system__exn_llfS");
   u00238 : constant Version_32 := 16#1b28662b#;
   pragma Export (C, u00238, "system__float_controlB");
   u00239 : constant Version_32 := 16#bf34ed6a#;
   pragma Export (C, u00239, "system__float_controlS");
   u00240 : constant Version_32 := 16#0fb8c821#;
   pragma Export (C, u00240, "system__powten_tableS");
   u00241 : constant Version_32 := 16#0163d4b2#;
   pragma Export (C, u00241, "ada__directories__validityB");
   u00242 : constant Version_32 := 16#a2334639#;
   pragma Export (C, u00242, "ada__directories__validityS");
   u00243 : constant Version_32 := 16#f131b3c1#;
   pragma Export (C, u00243, "system__file_attributesS");
   u00244 : constant Version_32 := 16#8abf0aca#;
   pragma Export (C, u00244, "system__os_constantsS");
   u00245 : constant Version_32 := 16#c4e3cc82#;
   pragma Export (C, u00245, "search__test_dataB");
   u00246 : constant Version_32 := 16#1f1a76ae#;
   pragma Export (C, u00246, "search__test_dataS");
   u00247 : constant Version_32 := 16#f755a72f#;
   pragma Export (C, u00247, "search__test_data__testsB");
   u00248 : constant Version_32 := 16#e8acdab6#;
   pragma Export (C, u00248, "search__test_data__testsS");
   u00249 : constant Version_32 := 16#eb31c03f#;
   pragma Export (C, u00249, "search__test_data__tests__suiteB");
   u00250 : constant Version_32 := 16#ba2788e8#;
   pragma Export (C, u00250, "search__test_data__tests__suiteS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.handling%s
   --  ada.characters.latin_1%s
   --  ada.command_line%s
   --  gnat%s
   --  gnat.io%s
   --  gnat.io%b
   --  gnat.source_info%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.atomic_counters%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.exn_llf%s
   --  system.exn_llf%b
   --  system.float_control%s
   --  system.float_control%b
   --  system.htable%s
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.io%s
   --  system.io%b
   --  system.machine_code%s
   --  system.atomic_counters%b
   --  system.os_primitives%s
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.powten_table%s
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  gnat.strings%s
   --  system.os_lib%s
   --  gnat.os_lib%s
   --  system.task_lock%s
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.soft_links%s
   --  system.task_lock%b
   --  system.unsigned_types%s
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.val_enum%s
   --  system.val_int%s
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_real%s
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.val_real%b
   --  system.val_llu%b
   --  system.val_lli%b
   --  system.val_int%b
   --  system.val_enum%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  system.address_image%s
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.fixed%s
   --  ada.strings.maps.constants%s
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.strings.superbounded%s
   --  ada.strings.bounded%s
   --  ada.strings.bounded%b
   --  ada.tags%s
   --  ada.streams%s
   --  ada.streams%b
   --  interfaces.c%s
   --  interfaces.c.strings%s
   --  system.communication%s
   --  system.communication%b
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  system.os_constants%s
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  system.win32%s
   --  system.win32.ext%s
   --  system.os_primitives%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.calendar.time_zones%s
   --  ada.calendar.time_zones%b
   --  ada.calendar.formatting%s
   --  gnat.directory_operations%s
   --  system.file_attributes%s
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.file_control_block%s
   --  ada.streams.stream_io%s
   --  system.file_io%s
   --  ada.streams.stream_io%b
   --  system.object_reader%s
   --  system.dwarf_lines%s
   --  system.secondary_stack%s
   --  system.file_io%b
   --  system.storage_pools.subpools%b
   --  system.finalization_masters%b
   --  interfaces.c.strings%b
   --  interfaces.c%b
   --  ada.tags%b
   --  ada.strings.superbounded%b
   --  ada.strings.fixed%b
   --  ada.strings.maps%b
   --  system.soft_links%b
   --  system.os_lib%b
   --  ada.command_line%b
   --  ada.characters.handling%b
   --  system.secondary_stack%b
   --  system.dwarf_lines%b
   --  system.object_reader%b
   --  gnat.directory_operations%b
   --  ada.calendar.formatting%b
   --  system.address_image%b
   --  ada.exceptions.traceback%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  ada.directories%s
   --  ada.directories.validity%s
   --  ada.directories.validity%b
   --  system.regexp%s
   --  system.regexp%b
   --  ada.directories%b
   --  gnat.regexp%s
   --  gnat.command_line%s
   --  system.strings.stream_ops%s
   --  system.strings.stream_ops%b
   --  system.traceback%s
   --  ada.exceptions%b
   --  system.traceback%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  gnat.command_line%b
   --  gnat.traceback%s
   --  gnat.traceback%b
   --  gnat.traceback.symbolic%s
   --  gnat.traceback.symbolic%b
   --  ada_containers%s
   --  ada_containers.aunit_lists%s
   --  aunit%s
   --  aunit.memory%s
   --  aunit.memory%b
   --  aunit%b
   --  aunit.memory.utils%s
   --  aunit.memory.utils%b
   --  ada_containers.aunit_lists%b
   --  aunit.tests%s
   --  aunit.test_filters%s
   --  aunit.options%s
   --  aunit.time_measure%s
   --  aunit.time_measure%b
   --  aunit.test_results%s
   --  aunit.test_results%b
   --  aunit.assertions%s
   --  aunit.assertions%b
   --  aunit.reporter%s
   --  aunit.reporter.gnattest%s
   --  aunit.reporter.gnattest%b
   --  aunit.simple_test_cases%s
   --  aunit.simple_test_cases%b
   --  aunit.test_filters%b
   --  aunit.test_fixtures%s
   --  aunit.test_fixtures%b
   --  aunit.test_caller%s
   --  aunit.test_caller%b
   --  aunit.test_suites%s
   --  aunit.test_suites%b
   --  aunit.run%s
   --  aunit.run%b
   --  gnattest_generated%s
   --  gnattest_main_suite%s
   --  test_runner%b
   --  param%s
   --  param%b
   --  param.params_test_data%s
   --  param.params_test_data%b
   --  param.params_test_data.params_tests%s
   --  param.params_test_data.params_tests.suite%s
   --  param.params_test_data.params_tests.suite%b
   --  param.test_data%s
   --  param.test_data%b
   --  param.test_data.tests%s
   --  param.test_data.tests.suite%s
   --  param.test_data.tests.suite%b
   --  search%s
   --  search%b
   --  search.test_data%s
   --  search.test_data%b
   --  search.test_data.tests%s
   --  search.test_data.tests%b
   --  search.test_data.tests.suite%s
   --  search.test_data.tests.suite%b
   --  gnattest_main_suite%b
   --  test_info%s
   --  param.test_data.tests%b
   --  param.params_test_data.params_tests%b
   --  END ELABORATION ORDER


end ada_main;
