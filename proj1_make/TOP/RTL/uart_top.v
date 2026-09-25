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

wire            w_clk       ;
wire            w_nRst      ;
wire            w_rx        ;
wire            w_tx        ;
wire            w_led_ctrl  ;

//  baud_generator
baud_gen dut1   (
    .i_clk      (w_clk      ),
    .i_nRst     (w_nRst     ),
    .o_tick_16x (w_tick_16x )
);

//  tx
uart_tx dut2    (
    .i_clk      (w_clk      ),
    .i_nRst     (w_nRst     ),
    .i_tick_16x (w_tick_16x ),
    .i_tx_start (w_tx_start ),
    .i_tx_data  (w_tx_data  ),
    .o_tx_busy  (           ), //  미사용: 송신 요청이 rx_done에만 연동되는 echo 구조라 busy 확인 불필요
    .o_tx       (w_tx       ) 
);

//  rx
uart_rx dut3    (
    .i_clk      (w_clk      ),
    .i_nRst     (w_nRst     ),
    .i_tick_16x (w_tick_16x ),
    .i_rx       (w_rx       ),
    .o_rx_done  (w_rx_done  ),
    .o_frame_err(           ), //  미사용: 프레임 에러 처리 기능 없음 (스펙 외)
    .o_rx_data  (w_rx_data  ) 
);

//  command decoder
cmd_decoder dut4(
    .i_clk      (w_clk      ),
    .i_nRst     (w_nRst     ),
    .i_rx_done  (w_rx_done  ),
    .i_rx_data  (w_rx_data  ),
    .o_led_ctrl (w_led_ctrl ),
    .o_tx_start (w_tx_start ),
    .o_tx_data  (w_tx_data  )
);

//  i_clk pad connect
PADDI pad1(
    .PAD        (i_clk      ),
    .Y          (w_clk      )
);

//  i_nRst pad connect
PADDI pad2(
    .PAD        (i_nRst     ),
    .Y          (w_nRst     )
);

//  i_rx pad connect
PADDI pad3(
    .PAD        (i_rx       ),
    .Y          (w_rx       )
);

//  o_tx pad connect
PADDO pad4(
    .A          (w_tx       ),
    .PAD        (o_tx       )
);

//  o_led_ctrl pad connect
PADDO pad5(
    .A          (w_led_ctrl ),
    .PAD        (o_led_ctrl )
);

endmodule