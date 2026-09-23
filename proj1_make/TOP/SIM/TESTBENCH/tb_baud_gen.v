`timescale 1ns / 1ps

module tb_baud_gen ();

parameter CLK_PERIOD = 30;

reg     i_clk           ;
reg     i_nRst          ;
wire    w_tick_16x      ;

baud_gen dut (
        .i_clk       (i_clk     ),
        .i_nRst      (i_nRst    ),
        .o_tick_16x  (w_tick_16x)
);

initial i_clk = 1'b0;
always #(CLK_PERIOD/2) i_clk = ~i_clk;

initial begin
    i_nRst = 1'b0       ;
    #(CLK_PERIOD * 4 )  ;
    i_nRst = 1'b1       ;
end

initial begin
    #(CLK_PERIOD * 655) ;
    $stop               ;
end

initial begin
$dumpfile("./DUMP/baud_gen.vcd");
$dumpvars(0, tb_baud_gen);
end

endmodule
