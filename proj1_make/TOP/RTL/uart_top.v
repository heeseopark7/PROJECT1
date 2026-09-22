`timescale 1ns / 1ps

module uart_top (
    i_clk       ,
    i_nRst      ,
    i_rx        ,
    o_tx        ,
    o_led_ctrl
);

input           i_clk       ;
input           i_nRst      ;
input           i_rx        ;
output          o_tx        ;
output          o_led_ctrl  ;

wire            w_tick_16x  ;
wire            w_tx_start  ;
wire    [7:0]   w_tx_data   ;
wire    [7:0]   w_rx_data   ;
wire            w_rx_done   ;



//  baud_generator
baud_gen uut1   (
    .i_clk      (i_clk      ),
    .i_nRst     (i_nRst     ),
    .o_tick_16x (w_tick_16x )
);

//  tx
uart_tx uut2    (
    .i_clk      (i_clk      ),
    .i_nRst     (i_nRst     ),
    .i_tick_16x (w_tick_16x ),
    .i_tx_start (w_tx_start ),
    .i_tx_data  (w_tx_data  ),
    .o_tx_busy  (           ),
    .o_tx       (o_tx       ) 
);

//  rx
uart_rx uut3    (
    .i_clk      (i_clk      ),
    .i_nRst     (i_nRst     ),
    .i_tick_16x (w_tick_16x ),
    .i_rx       (i_rx       ),
    .o_rx_done  (w_rx_done  ),
    .o_frame_err(),
    .o_rx_data  (w_rx_data  ) 
);

//  command decoder
cmd_decoder uut4(
    .i_clk      (i_clk      ),
    .i_nRst     (i_nRst     ),
    .i_rx_done  (w_rx_done  ),
    .i_rx_data  (w_rx_data  ),
    .o_led_ctrl (o_led_ctrl ),
    .o_tx_start (w_tx_start ),
    .o_tx_data  (w_tx_data  )
);

endmodule