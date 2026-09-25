`timescale 1ns / 1ps 

module baud_gen #(
    parameter   DIV = 8'd216 //  0~216 카운트 = 217분주 (33.333MHz / (9600 x 16))
)(
        i_clk       ,
        i_nRst      ,
        o_tick_16x  

);

input           i_clk       ;
input           i_nRst      ;
output          o_tick_16x  ;

reg     [7:0]   r_count     ;

always@( posedge i_clk or negedge i_nRst ) begin
    if (!i_nRst) begin
        r_count <= 8'd0         ;
    end
    else if (r_count == DIV) begin
        r_count <= 8'd0         ;
    end
    else begin
        r_count <= r_count + 1  ;
    end
end

assign o_tick_16x = ( r_count == DIV )  ;

endmodule