set log file ./log/all.log -replace

read library -verilog -both \
	../../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045/verilog/slow_vdd1v0_basicCells.v \
	../../../../../SoC/GPDK045/digital/gsclib045_all_v4.4/gsclib045/verilog/fast_vdd1v0_basicCells.v \
	../../../../../SoC/GPDK045/digital/giolib045_v3.5/vlog/pads_SS_s1vg.v

read design ../RTL/uart_top.v \
	    ../RTL/baud_gen.v \
	    ../RTL/cmd_decoder.v \
	    ../RTL/uart_tx.v \
	    ../RTL/uart_rx.v \
	    ../../../cortexm0_designstart/implementation/cortex_m0_mcu_system_cadence_8ns/mapped/cmsdk_mcu_system_syn_final.v -verilog -golden

read design ../SYN/mapped/cmsdk_mcu_syn_final.v -verilog -revised

set system mode lec

add compare points -all

compare

report verification
report statistics
