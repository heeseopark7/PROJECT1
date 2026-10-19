######################################################################

# Created by Genus(TM) Synthesis Solution 22.17-s071_1 on Tue Oct 20 01:37:35 KST 2026

# This file contains the Genus script for design:uart_top

######################################################################

set_db -quiet init_lib_search_path {../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045/timing ../../../../SoC/GPDK045/digital/giolib045_v3.5/timing ../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045/lef ../../../../SoC/GPDK045/digital/giolib045_v3.5/lef ../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045_tech/qrc/qx}
set_db -quiet operating_conditions_min PVT_1P1V_0C
set_db -quiet operating_conditions_min_library library:default_emulate_libset_max/fast_vdd1v0
set_db -quiet operating_conditions_library_given true
set_db -quiet design_mode_process 60.0
set_db -quiet phys_assume_met_fill 0.0
set_db -quiet map_placed_for_route_early_global false
set_db -quiet phys_use_invs_extraction true
set_db -quiet phys_route_time_out 120.0
set_db -quiet db_units 2000
set_db -quiet capacitance_per_unit_length_mmmc {}
set_db -quiet resistance_per_unit_length_mmmc {}
set_db -quiet runtime_by_stage {{PBS_Generic-Start 0 25 0.0 22.998736} {to_generic 2 27 2 26} {first_condense 0 28 0 27} {PBS_Generic_Opt-Post 3 28 3.7646409999999975 26.763377} {{PBS_Generic-Postgen HBO Optimizations} 0 28 0.0 26.763377} {PBS_TechMap-Start 0 31 0.0 27.755602} {{PBS_TechMap-Premap HBO Optimizations} 0 31 0.0 27.755602} {second_condense 0 31 0 29} {reify 1 32 1 31} {global_incr_map 1 33 0 31} {{PBS_Techmap-Global Mapping} 2 33 2.3776919999999997 30.133294} {{PBS_TechMap-Datapath Postmap Operations} 2 35 2.0 32.133294} {{PBS_TechMap-Postmap HBO Optimizations} 0 35 -0.0018260000000012155 32.131468} {{PBS_TechMap-Postmap Clock Gating} 0 35 0.0 32.131468} {{PBS_TechMap-Postmap Cleanup} 0 35 -0.0031699999999972306 32.128298} {PBS_Techmap-Post_MBCI 0 35 0.0 32.128298} {incr_opt 1 38 0 34} }
set_db -quiet timing_adjust_tns_of_complex_flops false
set_db -quiet hdl_array_naming_style %s_%d
set_db -quiet tinfo_tstamp_file .rs_hah013.tstamp
set_db -quiet metric_enable true
set_db -quiet auto_ungroup none
set_db -quiet max_cpus_per_server 2
set_db -quiet syn_generic_effort high
set_db -quiet use_area_from_lef true
set_db -quiet uniquify_naming_style uart_top_%s_%d
set_db -quiet optimize_merge_flops false
set_db -quiet optimize_merge_latches false
set_db -quiet phys_use_segment_parasitics true
set_db -quiet probabilistic_extraction true
set_db -quiet ple_correlation_factors {1.9000 2.0000}
set_db -quiet maximum_interval_of_vias inf
set_db -quiet layer_aware_buffer true
set_db -quiet ple_mode global
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/ANTENNA .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY1X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY1X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY2X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY2X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY3X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY3X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY4X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY4X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/HOLDX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TIEHI .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TIELO .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX12 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX16 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX20 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX3 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX6 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX12 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX16 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX20 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX3 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX6 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATXL .avoid true
set_db -quiet operating_conditions operating_condition:default_emulate_libset_max/slow_vdd1v0/PVT_0P9V_125C
set_db -quiet wireload_selection none
set_db -quiet operating_condition:default_emulate_libset_max/fast_vdd1v0/PVT_1P1V_0C .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/fast_vdd1v0/_nominal_ .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/slow_vdd1v0/PVT_0P9V_125C .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/slow_vdd1v0/_nominal_ .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/giolib045/slow .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/giolib045/_nominal_ .tree_type balanced_tree
# BEGIN MSV SECTION
# END MSV SECTION
define_clock -name MAIN_CLOCK -domain domain_1 -period 800.0 -divide_period 1 -rise 0 -divide_rise 1 -fall 1 -divide_fall 2 -remove -design design:uart_top port:uart_top/i_clk
set_db -quiet clock:uart_top/MAIN_CLOCK .slew {100.0 100.0 100.0 100.0}
set_db -quiet clock:uart_top/MAIN_CLOCK .clock_network_late_latency {200.0 200.0 200.0 200.0}
set_db -quiet clock:uart_top/MAIN_CLOCK .clock_source_late_latency {200.0 200.0 200.0 200.0}
set_db -quiet clock:uart_top/MAIN_CLOCK .clock_setup_uncertainty {100.0 100.0}
define_cost_group -design design:uart_top -name MAIN_CLOCK
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_top/MAIN_CLOCK -name in_del port:uart_top/i_nRst
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:uart_top/MAIN_CLOCK -name in_del_1_1 port:uart_top/i_rx
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_top/MAIN_CLOCK -name in_del_2_1 port:uart_top/i_nRst
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:uart_top/MAIN_CLOCK -name in_del_3_1 port:uart_top/i_rx
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_top/MAIN_CLOCK -name ou_del port:uart_top/o_tx
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:uart_top/MAIN_CLOCK -name ou_del_3_1 port:uart_top/o_led_ctrl
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_top/MAIN_CLOCK -name ou_del_4_1 port:uart_top/o_tx
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:uart_top/MAIN_CLOCK -name ou_del_5_1 port:uart_top/o_led_ctrl
path_group -paths [specify_paths -lenient -to clock:uart_top/MAIN_CLOCK]  -name MAIN_CLOCK -group cost_group:uart_top/MAIN_CLOCK -user_priority -1047552
# BEGIN DFT SECTION
set_db -quiet dft_scan_style muxed_scan
set_db -quiet dft_scanbit_waveform_analysis false
# END DFT SECTION
set_db -quiet design:uart_top .seq_reason_deleted_internal {}
set_db -quiet design:uart_top .qos_by_stage {{to_generic {wns -11111111} {tns -111111111} {vep -111111111} {area 73002} {cell_count 262} {utilization  0.00} {runtime 2 27 2 26} }{first_condense {wns -11111111} {tns -111111111} {vep -111111111} {area 72893} {cell_count 246} {utilization  0.00} {runtime 0 28 0 27} }{second_condense {wns -11111111} {tns -111111111} {vep -111111111} {area 72891} {cell_count 245} {utilization  0.00} {runtime 0 31 0 29} }{reify {wns -1780} {tns 2760} {vep 11} {area 72551} {cell_count 177} {utilization  0.00} {runtime 1 32 1 31} }{global_incr_map {wns -1779} {tns 3503} {vep 12} {area 72509} {cell_count 161} {utilization  0.00} {runtime 1 33 0 31} }{incr_opt {wns -1779} {tns 2657} {vep 3} {area 72527} {cell_count 160} {utilization  0.00} {runtime 1 38 0 34} }}
set_db -quiet design:uart_top .seq_mbci_coverage 0.0
set_db -quiet design:uart_top .hdl_filelist {{default -v2001 {SYNTHESIS} {../RTL/uart_top.v ../RTL/cmd_decoder.v ../RTL/uart_rx.v ../RTL/uart_tx.v ../RTL/baud_gen.v} {../RTL} {}}}
set_db -quiet design:uart_top .verification_directory fv/uart_top
set_db -quiet port:uart_top/i_clk .is_ideal_network true
set_db -quiet port:uart_top/i_clk .original_name i_clk
set_db -quiet port:uart_top/i_clk .ideal_network true
set_db -quiet port:uart_top/i_nRst .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_top/i_nRst .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_top/i_nRst .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_top/i_nRst .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_top/i_nRst .is_ideal_network true
set_db -quiet port:uart_top/i_nRst .original_name i_nRst
set_db -quiet port:uart_top/i_nRst .ideal_network true
set_db -quiet port:uart_top/i_rx .driver_pin_rise_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_top/i_rx .driver_pin_fall_min lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_top/i_rx .driver_pin_rise_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_top/i_rx .driver_pin_fall_max lib_pin:default_emulate_libset_max/giolib045/PADDI/Y
set_db -quiet port:uart_top/i_rx .original_name i_rx
set_db -quiet port:uart_top/o_tx .external_pin_cap_min 3.0
set_db -quiet port:uart_top/o_tx .external_capacitance_max {3.0 3.0}
set_db -quiet port:uart_top/o_tx .external_capacitance_min 3.0
set_db -quiet port:uart_top/o_tx .original_name o_tx
set_db -quiet port:uart_top/o_tx .external_pin_cap {3.0 3.0}
set_db -quiet port:uart_top/o_led_ctrl .external_pin_cap_min 3.0
set_db -quiet port:uart_top/o_led_ctrl .external_capacitance_max {3.0 3.0}
set_db -quiet port:uart_top/o_led_ctrl .external_capacitance_min 3.0
set_db -quiet port:uart_top/o_led_ctrl .original_name o_led_ctrl
set_db -quiet port:uart_top/o_led_ctrl .external_pin_cap {3.0 3.0}
set_db -quiet module:uart_top/baud_gen .hdl_filelist {{default -v2001 {SYNTHESIS} {../RTL/baud_gen.v} {../RTL} {}}}
set_db -quiet inst:uart_top/dut1/r_count_reg_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut1/r_count_reg_7 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut1/r_count_reg_7 .original_name {{dut1/r_count[7]}}
set_db -quiet inst:uart_top/dut1/r_count_reg_7 .single_bit_orig_name {dut1/r_count[7]}
set_db -quiet pin:uart_top/dut1/r_count_reg_7/Q .original_name {dut1/r_count[7]/q}
set_db -quiet inst:uart_top/dut1/r_count_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut1/r_count_reg_6 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut1/r_count_reg_6 .original_name {{dut1/r_count[6]}}
set_db -quiet inst:uart_top/dut1/r_count_reg_6 .single_bit_orig_name {dut1/r_count[6]}
set_db -quiet pin:uart_top/dut1/r_count_reg_6/Q .original_name {dut1/r_count[6]/q}
set_db -quiet inst:uart_top/dut1/r_count_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut1/r_count_reg_5 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut1/r_count_reg_5 .original_name {{dut1/r_count[5]}}
set_db -quiet inst:uart_top/dut1/r_count_reg_5 .single_bit_orig_name {dut1/r_count[5]}
set_db -quiet pin:uart_top/dut1/r_count_reg_5/Q .original_name {dut1/r_count[5]/q}
set_db -quiet inst:uart_top/dut1/r_count_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut1/r_count_reg_4 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut1/r_count_reg_4 .original_name {{dut1/r_count[4]}}
set_db -quiet inst:uart_top/dut1/r_count_reg_4 .single_bit_orig_name {dut1/r_count[4]}
set_db -quiet pin:uart_top/dut1/r_count_reg_4/Q .original_name {dut1/r_count[4]/q}
set_db -quiet inst:uart_top/dut1/r_count_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut1/r_count_reg_3 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut1/r_count_reg_3 .original_name {{dut1/r_count[3]}}
set_db -quiet inst:uart_top/dut1/r_count_reg_3 .single_bit_orig_name {dut1/r_count[3]}
set_db -quiet pin:uart_top/dut1/r_count_reg_3/Q .original_name {dut1/r_count[3]/q}
set_db -quiet inst:uart_top/dut1/r_count_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut1/r_count_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut1/r_count_reg_2 .original_name {{dut1/r_count[2]}}
set_db -quiet inst:uart_top/dut1/r_count_reg_2 .single_bit_orig_name {dut1/r_count[2]}
set_db -quiet pin:uart_top/dut1/r_count_reg_2/Q .original_name {dut1/r_count[2]/q}
set_db -quiet inst:uart_top/dut1/r_count_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut1/r_count_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut1/r_count_reg_1 .original_name {{dut1/r_count[1]}}
set_db -quiet inst:uart_top/dut1/r_count_reg_1 .single_bit_orig_name {dut1/r_count[1]}
set_db -quiet pin:uart_top/dut1/r_count_reg_1/Q .original_name {dut1/r_count[1]/q}
set_db -quiet inst:uart_top/dut1/r_count_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut1/r_count_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut1/r_count_reg_0 .original_name {{dut1/r_count[0]}}
set_db -quiet inst:uart_top/dut1/r_count_reg_0 .single_bit_orig_name {dut1/r_count[0]}
set_db -quiet pin:uart_top/dut1/r_count_reg_0/Q .original_name {dut1/r_count[0]/q}
set_db -quiet module:uart_top/uart_tx .is_sop_cluster true
set_db -quiet module:uart_top/uart_tx .hdl_filelist {{default -v2001 {SYNTHESIS} {../RTL/uart_tx.v} {../RTL} {}}}
set_db -quiet inst:uart_top/dut2/r_shift_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut2/r_shift_reg_3 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut2/r_shift_reg_3 .original_name {{dut2/r_shift[3]}}
set_db -quiet inst:uart_top/dut2/r_shift_reg_3 .single_bit_orig_name {dut2/r_shift[3]}
set_db -quiet pin:uart_top/dut2/r_shift_reg_3/Q .original_name {dut2/r_shift[3]/q}
set_db -quiet inst:uart_top/dut2/r_shift_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut2/r_shift_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut2/r_shift_reg_2 .original_name {{dut2/r_shift[2]}}
set_db -quiet inst:uart_top/dut2/r_shift_reg_2 .single_bit_orig_name {dut2/r_shift[2]}
set_db -quiet pin:uart_top/dut2/r_shift_reg_2/Q .original_name {dut2/r_shift[2]/q}
set_db -quiet inst:uart_top/dut2/r_shift_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut2/r_shift_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut2/r_shift_reg_1 .original_name {{dut2/r_shift[1]}}
set_db -quiet inst:uart_top/dut2/r_shift_reg_1 .single_bit_orig_name {dut2/r_shift[1]}
set_db -quiet pin:uart_top/dut2/r_shift_reg_1/Q .original_name {dut2/r_shift[1]/q}
set_db -quiet inst:uart_top/dut2/r_shift_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut2/r_shift_reg_4 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut2/r_shift_reg_4 .original_name {{dut2/r_shift[4]}}
set_db -quiet inst:uart_top/dut2/r_shift_reg_4 .single_bit_orig_name {dut2/r_shift[4]}
set_db -quiet pin:uart_top/dut2/r_shift_reg_4/Q .original_name {dut2/r_shift[4]/q}
set_db -quiet inst:uart_top/dut2/r_shift_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut2/r_shift_reg_6 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut2/r_shift_reg_6 .original_name {{dut2/r_shift[6]}}
set_db -quiet inst:uart_top/dut2/r_shift_reg_6 .single_bit_orig_name {dut2/r_shift[6]}
set_db -quiet pin:uart_top/dut2/r_shift_reg_6/Q .original_name {dut2/r_shift[6]/q}
set_db -quiet inst:uart_top/dut2/r_shift_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut2/r_shift_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut2/r_shift_reg_0 .original_name {{dut2/r_shift[0]}}
set_db -quiet inst:uart_top/dut2/r_shift_reg_0 .single_bit_orig_name {dut2/r_shift[0]}
set_db -quiet pin:uart_top/dut2/r_shift_reg_0/Q .original_name {dut2/r_shift[0]/q}
set_db -quiet inst:uart_top/dut2/r_shift_reg_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut2/r_shift_reg_7 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut2/r_shift_reg_7 .original_name {{dut2/r_shift[7]}}
set_db -quiet inst:uart_top/dut2/r_shift_reg_7 .single_bit_orig_name {dut2/r_shift[7]}
set_db -quiet pin:uart_top/dut2/r_shift_reg_7/Q .original_name {dut2/r_shift[7]/q}
set_db -quiet inst:uart_top/dut2/r_shift_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut2/r_shift_reg_5 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut2/r_shift_reg_5 .original_name {{dut2/r_shift[5]}}
set_db -quiet inst:uart_top/dut2/r_shift_reg_5 .single_bit_orig_name {dut2/r_shift[5]}
set_db -quiet pin:uart_top/dut2/r_shift_reg_5/Q .original_name {dut2/r_shift[5]/q}
set_db -quiet inst:uart_top/dut2/r_bit_cnt_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut2/r_bit_cnt_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut2/r_bit_cnt_reg_1 .original_name {{dut2/r_bit_cnt[1]}}
set_db -quiet inst:uart_top/dut2/r_bit_cnt_reg_1 .single_bit_orig_name {dut2/r_bit_cnt[1]}
set_db -quiet pin:uart_top/dut2/r_bit_cnt_reg_1/Q .original_name {dut2/r_bit_cnt[1]/q}
set_db -quiet inst:uart_top/dut2/r_bit_cnt_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut2/r_bit_cnt_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut2/r_bit_cnt_reg_0 .original_name {{dut2/r_bit_cnt[0]}}
set_db -quiet inst:uart_top/dut2/r_bit_cnt_reg_0 .single_bit_orig_name {dut2/r_bit_cnt[0]}
set_db -quiet pin:uart_top/dut2/r_bit_cnt_reg_0/Q .original_name {dut2/r_bit_cnt[0]/q}
set_db -quiet inst:uart_top/dut2/r_bit_cnt_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut2/r_bit_cnt_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut2/r_bit_cnt_reg_2 .original_name {{dut2/r_bit_cnt[2]}}
set_db -quiet inst:uart_top/dut2/r_bit_cnt_reg_2 .single_bit_orig_name {dut2/r_bit_cnt[2]}
set_db -quiet pin:uart_top/dut2/r_bit_cnt_reg_2/Q .original_name {dut2/r_bit_cnt[2]/q}
set_db -quiet inst:uart_top/dut2/r_state_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut2/r_state_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut2/r_state_reg_1 .original_name {{dut2/r_state[1]}}
set_db -quiet inst:uart_top/dut2/r_state_reg_1 .single_bit_orig_name {dut2/r_state[1]}
set_db -quiet pin:uart_top/dut2/r_state_reg_1/Q .original_name {dut2/r_state[1]/q}
set_db -quiet pin:uart_top/dut2/r_state_reg_1/QN .original_name {dut2/r_state[1]/q}
set_db -quiet inst:uart_top/dut2/r_tick_cnt_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut2/r_tick_cnt_reg_3 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut2/r_tick_cnt_reg_3 .original_name {{dut2/r_tick_cnt[3]}}
set_db -quiet inst:uart_top/dut2/r_tick_cnt_reg_3 .single_bit_orig_name {dut2/r_tick_cnt[3]}
set_db -quiet pin:uart_top/dut2/r_tick_cnt_reg_3/Q .original_name {dut2/r_tick_cnt[3]/q}
set_db -quiet inst:uart_top/dut2/r_tick_cnt_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut2/r_tick_cnt_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut2/r_tick_cnt_reg_2 .original_name {{dut2/r_tick_cnt[2]}}
set_db -quiet inst:uart_top/dut2/r_tick_cnt_reg_2 .single_bit_orig_name {dut2/r_tick_cnt[2]}
set_db -quiet pin:uart_top/dut2/r_tick_cnt_reg_2/Q .original_name {dut2/r_tick_cnt[2]/q}
set_db -quiet inst:uart_top/dut2/r_tick_cnt_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut2/r_tick_cnt_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut2/r_tick_cnt_reg_1 .original_name {{dut2/r_tick_cnt[1]}}
set_db -quiet inst:uart_top/dut2/r_tick_cnt_reg_1 .single_bit_orig_name {dut2/r_tick_cnt[1]}
set_db -quiet pin:uart_top/dut2/r_tick_cnt_reg_1/Q .original_name {dut2/r_tick_cnt[1]/q}
set_db -quiet inst:uart_top/dut2/r_tick_cnt_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut2/r_tick_cnt_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut2/r_tick_cnt_reg_0 .original_name {{dut2/r_tick_cnt[0]}}
set_db -quiet inst:uart_top/dut2/r_tick_cnt_reg_0 .single_bit_orig_name {dut2/r_tick_cnt[0]}
set_db -quiet pin:uart_top/dut2/r_tick_cnt_reg_0/Q .original_name {dut2/r_tick_cnt[0]/q}
set_db -quiet inst:uart_top/dut2/r_state_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut2/r_state_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut2/r_state_reg_0 .original_name {{dut2/r_state[0]}}
set_db -quiet inst:uart_top/dut2/r_state_reg_0 .single_bit_orig_name {dut2/r_state[0]}
set_db -quiet pin:uart_top/dut2/r_state_reg_0/Q .original_name {dut2/r_state[0]/q}
set_db -quiet pin:uart_top/dut2/r_state_reg_0/QN .original_name {dut2/r_state[0]/q}
set_db -quiet module:uart_top/uart_rx .hdl_filelist {{default -v2001 {SYNTHESIS} {../RTL/uart_rx.v} {../RTL} {}}}
set_db -quiet inst:uart_top/dut3/r_rx_sync2_reg .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut3/r_rx_sync2_reg .gint_phase_inversion false
set_db -quiet inst:uart_top/dut3/r_rx_sync2_reg .original_name dut3/r_rx_sync2
set_db -quiet inst:uart_top/dut3/r_rx_sync2_reg .single_bit_orig_name dut3/r_rx_sync2
set_db -quiet pin:uart_top/dut3/r_rx_sync2_reg/Q .original_name dut3/r_rx_sync2/q
set_db -quiet pin:uart_top/dut3/r_rx_sync2_reg/QN .original_name dut3/r_rx_sync2/q
set_db -quiet inst:uart_top/dut3/r_rx_sync1_reg .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut3/r_rx_sync1_reg .gint_phase_inversion false
set_db -quiet inst:uart_top/dut3/r_rx_sync1_reg .original_name dut3/r_rx_sync1
set_db -quiet inst:uart_top/dut3/r_rx_sync1_reg .single_bit_orig_name dut3/r_rx_sync1
set_db -quiet pin:uart_top/dut3/r_rx_sync1_reg/Q .original_name dut3/r_rx_sync1/q
set_db -quiet pin:uart_top/dut3/r_rx_sync1_reg/QN .original_name dut3/r_rx_sync1/q
set_db -quiet inst:uart_top/dut3/r_state_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut3/r_state_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut3/r_state_reg_0 .original_name {{dut3/r_state[0]}}
set_db -quiet inst:uart_top/dut3/r_state_reg_0 .single_bit_orig_name {dut3/r_state[0]}
set_db -quiet pin:uart_top/dut3/r_state_reg_0/Q .original_name {dut3/r_state[0]/q}
set_db -quiet inst:uart_top/dut3/r_bit_cnt_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut3/r_bit_cnt_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut3/r_bit_cnt_reg_2 .original_name {{dut3/r_bit_cnt[2]}}
set_db -quiet inst:uart_top/dut3/r_bit_cnt_reg_2 .single_bit_orig_name {dut3/r_bit_cnt[2]}
set_db -quiet pin:uart_top/dut3/r_bit_cnt_reg_2/Q .original_name {dut3/r_bit_cnt[2]/q}
set_db -quiet inst:uart_top/dut3/r_shift_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut3/r_shift_reg_4 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut3/r_shift_reg_4 .original_name {{dut3/r_shift[4]}}
set_db -quiet inst:uart_top/dut3/r_shift_reg_4 .single_bit_orig_name {dut3/r_shift[4]}
set_db -quiet pin:uart_top/dut3/r_shift_reg_4/Q .original_name {dut3/r_shift[4]/q}
set_db -quiet inst:uart_top/dut3/r_shift_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut3/r_shift_reg_3 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut3/r_shift_reg_3 .original_name {{dut3/r_shift[3]}}
set_db -quiet inst:uart_top/dut3/r_shift_reg_3 .single_bit_orig_name {dut3/r_shift[3]}
set_db -quiet pin:uart_top/dut3/r_shift_reg_3/Q .original_name {dut3/r_shift[3]/q}
set_db -quiet inst:uart_top/dut3/r_shift_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut3/r_shift_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut3/r_shift_reg_2 .original_name {{dut3/r_shift[2]}}
set_db -quiet inst:uart_top/dut3/r_shift_reg_2 .single_bit_orig_name {dut3/r_shift[2]}
set_db -quiet pin:uart_top/dut3/r_shift_reg_2/Q .original_name {dut3/r_shift[2]/q}
set_db -quiet inst:uart_top/dut3/r_shift_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut3/r_shift_reg_5 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut3/r_shift_reg_5 .original_name {{dut3/r_shift[5]}}
set_db -quiet inst:uart_top/dut3/r_shift_reg_5 .single_bit_orig_name {dut3/r_shift[5]}
set_db -quiet pin:uart_top/dut3/r_shift_reg_5/Q .original_name {dut3/r_shift[5]/q}
set_db -quiet inst:uart_top/dut3/r_shift_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut3/r_shift_reg_6 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut3/r_shift_reg_6 .original_name {{dut3/r_shift[6]}}
set_db -quiet inst:uart_top/dut3/r_shift_reg_6 .single_bit_orig_name {dut3/r_shift[6]}
set_db -quiet pin:uart_top/dut3/r_shift_reg_6/Q .original_name {dut3/r_shift[6]/q}
set_db -quiet inst:uart_top/dut3/r_shift_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut3/r_shift_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut3/r_shift_reg_0 .original_name {{dut3/r_shift[0]}}
set_db -quiet inst:uart_top/dut3/r_shift_reg_0 .single_bit_orig_name {dut3/r_shift[0]}
set_db -quiet pin:uart_top/dut3/r_shift_reg_0/Q .original_name {dut3/r_shift[0]/q}
set_db -quiet inst:uart_top/dut3/r_shift_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut3/r_shift_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut3/r_shift_reg_1 .original_name {{dut3/r_shift[1]}}
set_db -quiet inst:uart_top/dut3/r_shift_reg_1 .single_bit_orig_name {dut3/r_shift[1]}
set_db -quiet pin:uart_top/dut3/r_shift_reg_1/Q .original_name {dut3/r_shift[1]/q}
set_db -quiet inst:uart_top/dut3/r_shift_reg_7 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut3/r_shift_reg_7 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut3/r_shift_reg_7 .original_name {{dut3/r_shift[7]}}
set_db -quiet inst:uart_top/dut3/r_shift_reg_7 .single_bit_orig_name {dut3/r_shift[7]}
set_db -quiet pin:uart_top/dut3/r_shift_reg_7/Q .original_name {dut3/r_shift[7]/q}
set_db -quiet inst:uart_top/dut3/r_bit_cnt_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut3/r_bit_cnt_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut3/r_bit_cnt_reg_1 .original_name {{dut3/r_bit_cnt[1]}}
set_db -quiet inst:uart_top/dut3/r_bit_cnt_reg_1 .single_bit_orig_name {dut3/r_bit_cnt[1]}
set_db -quiet pin:uart_top/dut3/r_bit_cnt_reg_1/Q .original_name {dut3/r_bit_cnt[1]/q}
set_db -quiet inst:uart_top/dut3/r_bit_cnt_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut3/r_bit_cnt_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut3/r_bit_cnt_reg_0 .original_name {{dut3/r_bit_cnt[0]}}
set_db -quiet inst:uart_top/dut3/r_bit_cnt_reg_0 .single_bit_orig_name {dut3/r_bit_cnt[0]}
set_db -quiet pin:uart_top/dut3/r_bit_cnt_reg_0/Q .original_name {dut3/r_bit_cnt[0]/q}
set_db -quiet inst:uart_top/dut3/r_tick_cnt_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut3/r_tick_cnt_reg_3 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut3/r_tick_cnt_reg_3 .original_name {{dut3/r_tick_cnt[3]}}
set_db -quiet inst:uart_top/dut3/r_tick_cnt_reg_3 .single_bit_orig_name {dut3/r_tick_cnt[3]}
set_db -quiet pin:uart_top/dut3/r_tick_cnt_reg_3/Q .original_name {dut3/r_tick_cnt[3]/q}
set_db -quiet inst:uart_top/dut3/r_tick_cnt_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut3/r_tick_cnt_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut3/r_tick_cnt_reg_1 .original_name {{dut3/r_tick_cnt[1]}}
set_db -quiet inst:uart_top/dut3/r_tick_cnt_reg_1 .single_bit_orig_name {dut3/r_tick_cnt[1]}
set_db -quiet pin:uart_top/dut3/r_tick_cnt_reg_1/Q .original_name {dut3/r_tick_cnt[1]/q}
set_db -quiet inst:uart_top/dut3/r_tick_cnt_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut3/r_tick_cnt_reg_2 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut3/r_tick_cnt_reg_2 .original_name {{dut3/r_tick_cnt[2]}}
set_db -quiet inst:uart_top/dut3/r_tick_cnt_reg_2 .single_bit_orig_name {dut3/r_tick_cnt[2]}
set_db -quiet pin:uart_top/dut3/r_tick_cnt_reg_2/Q .original_name {dut3/r_tick_cnt[2]/q}
set_db -quiet inst:uart_top/dut3/r_tick_cnt_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut3/r_tick_cnt_reg_0 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut3/r_tick_cnt_reg_0 .original_name {{dut3/r_tick_cnt[0]}}
set_db -quiet inst:uart_top/dut3/r_tick_cnt_reg_0 .single_bit_orig_name {dut3/r_tick_cnt[0]}
set_db -quiet pin:uart_top/dut3/r_tick_cnt_reg_0/Q .original_name {dut3/r_tick_cnt[0]/q}
set_db -quiet inst:uart_top/dut3/r_state_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut3/r_state_reg_1 .gint_phase_inversion false
set_db -quiet inst:uart_top/dut3/r_state_reg_1 .original_name {{dut3/r_state[1]}}
set_db -quiet inst:uart_top/dut3/r_state_reg_1 .single_bit_orig_name {dut3/r_state[1]}
set_db -quiet pin:uart_top/dut3/r_state_reg_1/Q .original_name {dut3/r_state[1]/q}
set_db -quiet pin:uart_top/dut3/r_state_reg_1/QN .original_name {dut3/r_state[1]/q}
set_db -quiet module:uart_top/cmd_decoder .hdl_filelist {{default -v2001 {SYNTHESIS} {../RTL/cmd_decoder.v} {../RTL} {}}}
set_db -quiet inst:uart_top/dut4/o_led_ctrl_reg .orig_hdl_instantiated false
set_db -quiet inst:uart_top/dut4/o_led_ctrl_reg .gint_phase_inversion false
set_db -quiet inst:uart_top/dut4/o_led_ctrl_reg .original_name dut4/o_led_ctrl
set_db -quiet inst:uart_top/dut4/o_led_ctrl_reg .single_bit_orig_name dut4/o_led_ctrl
set_db -quiet pin:uart_top/dut4/o_led_ctrl_reg/Q .original_name dut4/o_led_ctrl/q
set_db -quiet inst:uart_top/pad1 .dont_touch_reason set_dont_touch
set_db -quiet inst:uart_top/pad1 .dont_touch_file 0
set_db -quiet inst:uart_top/pad1 .dont_touch true
set_db -quiet inst:uart_top/pad1 .preserve true
set_db -quiet inst:uart_top/pad2 .dont_touch_reason set_dont_touch
set_db -quiet inst:uart_top/pad2 .dont_touch_file 0
set_db -quiet inst:uart_top/pad2 .dont_touch true
set_db -quiet inst:uart_top/pad2 .preserve true
set_db -quiet inst:uart_top/pad3 .dont_touch_reason set_dont_touch
set_db -quiet inst:uart_top/pad3 .dont_touch_file 0
set_db -quiet inst:uart_top/pad3 .dont_touch true
set_db -quiet inst:uart_top/pad3 .preserve true
set_db -quiet inst:uart_top/pad4 .dont_touch_reason set_dont_touch
set_db -quiet inst:uart_top/pad4 .dont_touch_file 0
set_db -quiet inst:uart_top/pad4 .dont_touch true
set_db -quiet inst:uart_top/pad4 .preserve true
set_db -quiet inst:uart_top/pad5 .dont_touch_reason set_dont_touch
set_db -quiet inst:uart_top/pad5 .dont_touch_file 0
set_db -quiet inst:uart_top/pad5 .dont_touch true
set_db -quiet inst:uart_top/pad5 .preserve true
# BEGIN PMBIST SECTION
# END PMBIST SECTION
# BEGIN PHYSICAL ANNOTATION SECTION
# END PHYSICAL ANNOTATION SECTION
# BEGIN GLO TBR TABLE
set_db -quiet design:uart_top .set_boundary_change_new {start restore}
set_db -quiet design:uart_top .set_boundary_change_new {finish restore}
# END GLO TBR TABLE
set_db -quiet source_verbose true
#############################################################
#####   FLOW WRITE   ########################################
##
## Written by Genus(TM) Synthesis Solution version 22.17-s071_1
## flowkit v22.15-s003_1
## Written on 01:37:36 20-Oct 2026
#############################################################
#####   Flow Definitions   ##################################

#############################################################
#####   Step Definitions   ##################################


#############################################################
#####   Attribute Definitions   #############################

if {[is_attribute flow_edit_end_steps -obj_type root]} {set_db flow_edit_end_steps {}}
if {[is_attribute flow_edit_start_steps -obj_type root]} {set_db flow_edit_start_steps {}}
if {[is_attribute flow_footer_tcl -obj_type root]} {set_db flow_footer_tcl {}}
if {[is_attribute flow_header_tcl -obj_type root]} {set_db flow_header_tcl {}}
if {[is_attribute flow_metadata -obj_type root]} {set_db flow_metadata {}}
if {[is_attribute flow_setup_config -obj_type root]} {set_db flow_setup_config {HUDDLE {!!map {}}}}
if {[is_attribute flow_step_begin_tcl -obj_type root]} {set_db flow_step_begin_tcl {}}
if {[is_attribute flow_step_check_tcl -obj_type root]} {set_db flow_step_check_tcl {}}
if {[is_attribute flow_step_end_tcl -obj_type root]} {set_db flow_step_end_tcl {}}
if {[is_attribute flow_step_order -obj_type root]} {set_db flow_step_order {}}
if {[is_attribute flow_summary_tcl -obj_type root]} {set_db flow_summary_tcl {}}
if {[is_attribute flow_template_feature_definition -obj_type root]} {set_db flow_template_feature_definition {}}
if {[is_attribute flow_template_type -obj_type root]} {set_db flow_template_type {}}
if {[is_attribute flow_template_tools -obj_type root]} {set_db flow_template_tools {}}
if {[is_attribute flow_template_version -obj_type root]} {set_db flow_template_version {}}
if {[is_attribute flow_user_templates -obj_type root]} {set_db flow_user_templates {}}


#############################################################
#####   Flow History   ######################################

if {[is_attribute flow_user_templates -obj_type root]} {set_db flow_user_templates {}}
if {[is_attribute flow_plugin_steps -obj_type root]} {set_db flow_plugin_steps {}}
if {[is_attribute flow_template_type -obj_type root]} {set_db flow_template_type {}}
if {[is_attribute flow_template_tools -obj_type root]} {set_db flow_template_tools {}}
if {[is_attribute flow_template_version -obj_type root]} {set_db flow_template_version {}}
if {[is_attribute flow_template_feature_definition -obj_type root]} {set_db flow_template_feature_definition {}}
if {[is_attribute flow_remark -obj_type root]} {set_db flow_remark {}}
if {[is_attribute flow_features -obj_type root]} {set_db flow_features {}}
if {[is_attribute flow_feature_values -obj_type root]} {set_db flow_feature_values {}}
if {[is_attribute flow_write_db_args -obj_type root]} {set_db flow_write_db_args {}}
if {[is_attribute flow_write_db_sdc -obj_type root]} {set_db flow_write_db_sdc true}
if {[is_attribute flow_write_db_common -obj_type root]} {set_db flow_write_db_common false}
if {[is_attribute flow_post_db_overwrite -obj_type root]} {set_db flow_post_db_overwrite {}}
if {[is_attribute flow_step_order -obj_type root]} {set_db flow_step_order {}}
if {[is_attribute flow_step_begin_tcl -obj_type root]} {set_db flow_step_begin_tcl {}}
if {[is_attribute flow_step_end_tcl -obj_type root]} {set_db flow_step_end_tcl {}}
if {[is_attribute flow_step_last -obj_type root]} {set_db flow_step_last {}}
if {[is_attribute flow_step_current -obj_type root]} {set_db flow_step_current {}}
if {[is_attribute flow_step_canonical_current -obj_type root]} {set_db flow_step_canonical_current {}}
if {[is_attribute flow_step_next -obj_type root]} {set_db flow_step_next {}}
if {[is_attribute flow_working_directory -obj_type root]} {set_db flow_working_directory .}
if {[is_attribute flow_branch -obj_type root]} {set_db flow_branch {}}
if {[is_attribute flow_caller_data -obj_type root]} {set_db flow_caller_data {}}
if {[is_attribute flow_metrics_snapshot_uuid -obj_type root]} {set_db flow_metrics_snapshot_uuid {}}
if {[is_attribute flow_starting_db -obj_type root]} {set_db flow_starting_db {}}
if {[is_attribute flow_db_directory -obj_type root]} {set_db flow_db_directory dbs}
if {[is_attribute flow_report_directory -obj_type root]} {set_db flow_report_directory reports}
if {[is_attribute flow_log_directory -obj_type root]} {set_db flow_log_directory logs}
if {[is_attribute flow_mail_to -obj_type root]} {set_db flow_mail_to {}}
if {[is_attribute flow_exit_when_done -obj_type root]} {set_db flow_exit_when_done false}
if {[is_attribute flow_mail_on_error -obj_type root]} {set_db flow_mail_on_error false}
if {[is_attribute flow_summary_tcl -obj_type root]} {set_db flow_summary_tcl {}}
if {[is_attribute flow_history -obj_type root]} {set_db flow_history {}}
if {[is_attribute flow_step_last_status -obj_type root]} {set_db flow_step_last_status not_run}
if {[is_attribute flow_step_last_msg -obj_type root]} {set_db flow_step_last_msg {}}
if {[is_attribute flow_run_tag -obj_type root]} {set_db flow_run_tag {}}
if {[is_attribute flow_current_cache -obj_type root]} {set_db flow_current_cache {}}
if {[is_attribute flow_step_order_cache -obj_type root]} {set_db flow_step_order_cache {}}
if {[is_attribute flow_step_results_cache -obj_type root]} {set_db flow_step_results_cache {}}
if {[is_attribute flow_metadata -obj_type root]} {set_db flow_metadata {}}
if {[is_attribute flow_execute_in_global -obj_type root]} {set_db flow_execute_in_global true}
if {[is_attribute flow_overwrite_db -obj_type root]} {set_db flow_overwrite_db false}
if {[is_attribute flow_print_run_information -obj_type root]} {set_db flow_print_run_information false}
if {[is_attribute flow_verbose -obj_type root]} {set_db flow_verbose true}
if {[is_attribute flow_print_run_information_full -obj_type root]} {set_db flow_print_run_information_full false}
if {[is_attribute flow_header_tcl -obj_type root]} {set_db flow_header_tcl {}}
if {[is_attribute flow_footer_tcl -obj_type root]} {set_db flow_footer_tcl {}}
if {[is_attribute flow_init_header_tcl -obj_type root]} {set_db flow_init_header_tcl {}}
if {[is_attribute flow_init_footer_tcl -obj_type root]} {set_db flow_init_footer_tcl {}}
if {[is_attribute flow_edit_start_steps -obj_type root]} {set_db flow_edit_start_steps {}}
if {[is_attribute flow_edit_end_steps -obj_type root]} {set_db flow_edit_end_steps {}}
if {[is_attribute flow_step_last_number -obj_type root]} {set_db flow_step_last_number 0}
if {[is_attribute flow_autoload_applets -obj_type root]} {set_db flow_autoload_applets false}
if {[is_attribute flow_autoload_dir -obj_type root]} {set_db flow_autoload_dir error}
if {[is_attribute flow_skip_auto_db_save -obj_type root]} {set_db flow_skip_auto_db_save true}
if {[is_attribute flow_skip_auto_generate_metrics -obj_type root]} {set_db flow_skip_auto_generate_metrics false}
if {[is_attribute flow_top -obj_type root]} {set_db flow_top {}}
if {[is_attribute flow_hier_path -obj_type root]} {set_db flow_hier_path {}}
if {[is_attribute flow_schedule -obj_type root]} {set_db flow_schedule {}}
if {[is_attribute flow_step_check_tcl -obj_type root]} {set_db flow_step_check_tcl {}}
if {[is_attribute flow_script -obj_type root]} {set_db flow_script {}}
if {[is_attribute flow_yaml_script -obj_type root]} {set_db flow_yaml_script {}}
if {[is_attribute flow_cla_enabled_features -obj_type root]} {set_db flow_cla_enabled_features {}}
if {[is_attribute flow_cla_inject_tcl -obj_type root]} {set_db flow_cla_inject_tcl {}}
if {[is_attribute flow_error_message -obj_type root]} {set_db flow_error_message {}}
if {[is_attribute flow_error_errorinfo -obj_type root]} {set_db flow_error_errorinfo {}}
if {[is_attribute flow_exclude_time_for_init_flow -obj_type root]} {set_db flow_exclude_time_for_init_flow false}
if {[is_attribute flow_error_write_db -obj_type root]} {set_db flow_error_write_db true}
if {[is_attribute flow_advanced_metric_isolation -obj_type root]} {set_db flow_advanced_metric_isolation flow}
if {[is_attribute flow_yaml_root -obj_type root]} {set_db flow_yaml_root {}}
if {[is_attribute flow_yaml_root_dir -obj_type root]} {set_db flow_yaml_root_dir {}}
if {[is_attribute flow_setup_config -obj_type root]} {set_db flow_setup_config {HUDDLE {!!map {}}}}

#############################################################
#####   User Defined Attributes   ###########################

