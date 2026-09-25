`timescale 1ns / 1ps

module uart_top_n (
    i_clk       ,
    i_nRst      ,
    i_rx        ,
    o_tx        ,
    o_led_ctrl
);

// 외부 실핀 (Package Pin / PAD)
input           i_clk       ;
input           i_nRst      ;
input           i_rx        ;
output          o_tx        ;
output          o_led_ctrl  ;

// 패드를 통과한 뒤의 내부 신호 (서브모듈들이 사용)
wire            in_clk      ;
wire            in_nRst     ;
wire            in_rx       ;
wire            out_tx      ;
wire            out_led_ctrl;

wire            w_tick_16x  ;
wire            w_tx_start  ;
wire    [7:0]   w_tx_data   ;
wire    [7:0]   w_rx_data   ;
wire            w_rx_done   ;

//=============================================================
// IO PAD Instantiation
//=============================================================

// Input Buffer - Clock
PADDI pad1 (
    .PAD (i_clk  ),
    .Y   (in_clk )
);

// Input Buffer - Reset (active low)
PADDI pad2 (
    .PAD (i_nRst ),
    .Y   (in_nRst)
);

// Input Buffer - UART RX
PADDI pad3 (
    .PAD (i_rx   ),
    .Y   (in_rx  )
);

// Output Driver - UART TX
PADDO pad4 (
    .A   (out_tx ),
    .PAD (o_tx   )
);

// Output Driver - LED control
PADDO pad5 (
    .A   (out_led_ctrl),
    .PAD (o_led_ctrl  )
);

//=============================================================
// Core Logic (패드를 통과한 내부 신호로 연결)
//=============================================================

//  baud_generator
baud_gen uut1   (
    .i_clk      (in_clk     ),
    .i_nRst     (in_nRst    ),
    .o_tick_16x (w_tick_16x )
);

//  tx
uart_tx uut2    (
    .i_clk      (in_clk     ),
    .i_nRst     (in_nRst    ),
    .i_tick_16x (w_tick_16x ),
    .i_tx_start (w_tx_start ),
    .i_tx_data  (w_tx_data  ),
    .o_tx_busy  (           ),
    .o_tx       (out_tx     ) 
);

//  rx
uart_rx uut3    (
    .i_clk      (in_clk     ),
    .i_nRst     (in_nRst    ),
    .i_tick_16x (w_tick_16x ),
    .i_rx       (in_rx      ),
    .o_rx_done  (w_rx_done  ),
    .o_frame_err(),
    .o_rx_data  (w_rx_data  ) 
);

//  command decoder
cmd_decoder uut4(
    .i_clk      (in_clk      ),
    .i_nRst     (in_nRst     ),
    .i_rx_done  (w_rx_done   ),
    .i_rx_data  (w_rx_data   ),
    .o_led_ctrl (out_led_ctrl),
    .o_tx_start (w_tx_start  ),
    .o_tx_data  (w_tx_data   )
);

endmodule