xrun -64bit \
     +max_err_count+50 \
     +define+function_sim \
     -access +rwc \
     -profile \
     -profthread \
     -gui \
     +libext+.v \
     -incdir ../../RTL \
     -incdir ../TESTBENCH \
     -y ../../RTL \
     -y ../../../../../../../GPDK045/digital/giolib045_v3.5/vlog \
     -y ../../../../../../../GPDK045/digital/gsclib045_all_v4.4/gsclib045_svt_v4.4/gsclib045/verilog \
     -y ../../../../../../../GPDK045/digital \
     ../TESTBENCH/tb_baud_gen.v \
     ../../RTL/baud_gen.v \
     ../../../../../../../GPDK045/digital/giolib045_v3.5/vlog/pads_FF_s1vg.v \
     ../../../../../../../GPDK045/digital/gsclib045_all_v4.4/gsclib045_svt_v4.4/gsclib045/verilog/slow_vdd1v0_basicCells.v \
     -l func_sim.log
