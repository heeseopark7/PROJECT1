`timescale 1ns / 1ps

module cmd_decoder (
    i_clk       ,
    i_nRst      ,
    i_rx_done   ,
    i_rx_data   ,
    o_led_ctrl  ,
    o_tx_start  ,
    o_tx_data   
);

input                   i_clk       ;
input                   i_nRst      ;
input                   i_rx_done   ;
input       [7:0]       i_rx_data   ;
output                  o_led_ctrl  ;
output                  o_tx_start  ;
output      [7:0]       o_tx_data   ;

//  led control
reg                     o_led_ctrl  ;

always @(posedge i_clk or negedge i_nRst)begin
    if (!i_nRst)
        o_led_ctrl <= 1'b0          ;
    else if ((i_rx_data == 8'h72) && i_rx_done) // run
        o_led_ctrl <= 1'b1          ;
    else if ((i_rx_data == 8'h6F) && i_rx_done) // off
        o_led_ctrl <= 1'b0          ;
end

assign o_tx_start = i_rx_done && (i_rx_data != 8'h72) && (i_rx_data != 8'h6F);
assign o_tx_data  = i_rx_data                                                ; 
    
endmodule