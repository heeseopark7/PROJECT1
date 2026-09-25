`timescale 1ns / 1ps

module tb_uart_top  ;

parameter CLK_PERIOD = 21;  // 30ns x 70% (pessimistic)
parameter BIT_PERIOD = 217*16*CLK_PERIOD; // 1비트 = 217클록(baud_gen DIV+1) x 16tick

reg     i_clk       ;
reg     i_nRst      ;
reg     i_rx        ;
wire    o_tx        ;
wire    o_led_ctrl  ;

initial i_clk = 1'b0;
always #(CLK_PERIOD/2.0)
    i_clk = ~i_clk  ;

initial begin
    i_nRst  = 1'b0              ;
    i_rx    = 1'b1              ;
    repeat(4) @(posedge i_clk)  ;
    i_nRst  = 1'b1              ;
end

uart_top    u_uart_top (
    .i_clk          (i_clk     ),
    .i_nRst         (i_nRst    ),
    .i_rx           (i_rx      ),
    .o_tx           (o_tx      ),
    .o_led_ctrl     (o_led_ctrl)
);



endmodule