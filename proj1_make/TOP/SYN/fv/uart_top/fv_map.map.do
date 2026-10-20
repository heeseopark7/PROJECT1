
//input ports
add mapped point i_clk i_clk -type PI PI
add mapped point i_nRst i_nRst -type PI PI
add mapped point i_rx i_rx -type PI PI

//output ports
add mapped point o_tx o_tx -type PO PO
add mapped point o_led_ctrl o_led_ctrl -type PO PO

//inout ports




//Sequential Pins
add mapped point dut1/r_count[7]/q dut1/r_count_reg_7/Q -type DFF DFF
add mapped point dut1/r_count[6]/q dut1/r_count_reg_6/Q -type DFF DFF
add mapped point dut1/r_count[5]/q dut1/r_count_reg_5/Q -type DFF DFF
add mapped point dut1/r_count[4]/q dut1/r_count_reg_4/Q -type DFF DFF
add mapped point dut1/r_count[3]/q dut1/r_count_reg_3/Q -type DFF DFF
add mapped point dut1/r_count[2]/q dut1/r_count_reg_2/Q -type DFF DFF
add mapped point dut1/r_count[1]/q dut1/r_count_reg_1/Q -type DFF DFF
add mapped point dut1/r_count[0]/q dut1/r_count_reg_0/Q -type DFF DFF
add mapped point dut2/r_shift[2]/q dut2/r_shift_reg_2/Q -type DFF DFF
add mapped point dut2/r_shift[5]/q dut2/r_shift_reg_5/Q -type DFF DFF
add mapped point dut2/r_state[0]/q dut2/r_state_reg_0/Q -type DFF DFF
add mapped point dut2/r_shift[3]/q dut2/r_shift_reg_3/Q -type DFF DFF
add mapped point dut2/r_shift[1]/q dut2/r_shift_reg_1/Q -type DFF DFF
add mapped point dut2/r_shift[0]/q dut2/r_shift_reg_0/Q -type DFF DFF
add mapped point dut2/r_shift[4]/q dut2/r_shift_reg_4/Q -type DFF DFF
add mapped point dut2/r_shift[6]/q dut2/r_shift_reg_6/Q -type DFF DFF
add mapped point dut2/r_shift[7]/q dut2/r_shift_reg_7/Q -type DFF DFF
add mapped point dut2/r_bit_cnt[1]/q dut2/r_bit_cnt_reg_1/Q -type DFF DFF
add mapped point dut2/r_bit_cnt[0]/q dut2/r_bit_cnt_reg_0/Q -type DFF DFF
add mapped point dut2/r_bit_cnt[2]/q dut2/r_bit_cnt_reg_2/Q -type DFF DFF
add mapped point dut2/r_state[1]/q dut2/r_state_reg_1/Q -type DFF DFF
add mapped point dut2/r_tick_cnt[3]/q dut2/r_tick_cnt_reg_3/Q -type DFF DFF
add mapped point dut2/r_tick_cnt[2]/q dut2/r_tick_cnt_reg_2/Q -type DFF DFF
add mapped point dut2/r_tick_cnt[1]/q dut2/r_tick_cnt_reg_1/Q -type DFF DFF
add mapped point dut2/r_tick_cnt[0]/q dut2/r_tick_cnt_reg_0/Q -type DFF DFF
add mapped point dut3/r_rx_sync2/q dut3/r_rx_sync2_reg/Q -type DFF DFF
add mapped point dut3/r_rx_sync1/q dut3/r_rx_sync1_reg/Q -type DFF DFF
add mapped point dut3/r_state[0]/q dut3/r_state_reg_0/Q -type DFF DFF
add mapped point dut3/r_bit_cnt[2]/q dut3/r_bit_cnt_reg_2/Q -type DFF DFF
add mapped point dut3/r_shift[4]/q dut3/r_shift_reg_4/Q -type DFF DFF
add mapped point dut3/r_shift[3]/q dut3/r_shift_reg_3/Q -type DFF DFF
add mapped point dut3/r_shift[2]/q dut3/r_shift_reg_2/Q -type DFF DFF
add mapped point dut3/r_shift[5]/q dut3/r_shift_reg_5/Q -type DFF DFF
add mapped point dut3/r_shift[6]/q dut3/r_shift_reg_6/Q -type DFF DFF
add mapped point dut3/r_shift[0]/q dut3/r_shift_reg_0/Q -type DFF DFF
add mapped point dut3/r_shift[1]/q dut3/r_shift_reg_1/Q -type DFF DFF
add mapped point dut3/r_shift[7]/q dut3/r_shift_reg_7/Q -type DFF DFF
add mapped point dut3/r_bit_cnt[1]/q dut3/r_bit_cnt_reg_1/Q -type DFF DFF
add mapped point dut3/r_bit_cnt[0]/q dut3/r_bit_cnt_reg_0/Q -type DFF DFF
add mapped point dut3/r_tick_cnt[3]/q dut3/r_tick_cnt_reg_3/Q -type DFF DFF
add mapped point dut3/r_tick_cnt[1]/q dut3/r_tick_cnt_reg_1/Q -type DFF DFF
add mapped point dut3/r_tick_cnt[2]/q dut3/r_tick_cnt_reg_2/Q -type DFF DFF
add mapped point dut3/r_tick_cnt[0]/q dut3/r_tick_cnt_reg_0/Q -type DFF DFF
add mapped point dut3/r_state[1]/q dut3/r_state_reg_1/Q -type DFF DFF
add mapped point dut4/o_led_ctrl/q dut4/o_led_ctrl_reg/Q -type DFF DFF



//Black Boxes



//Empty Modules as Blackboxes
