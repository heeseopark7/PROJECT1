`timescale 1ns / 1ps

module uart_rx (
    i_clk       ,
    i_nRst      ,
    i_tick_16x  ,
    i_rx        ,
    o_rx_done   ,
    o_frame_err ,
    o_rx_data   
);

input               i_clk               ;
input               i_nRst              ;
input               i_tick_16x          ;
input               i_rx                ;
output              o_rx_done           ;
output              o_frame_err         ;
output      [7:0]   o_rx_data           ;

localparam  [1:0]   IDLE    = 2'b00     ;
localparam  [1:0]   START   = 2'b01     ;
localparam  [1:0]   DATA    = 2'b10     ;
localparam  [1:0]   STOP    = 2'b11     ;


//  FSM
reg         [1:0]   r_state             ;
    
always @( posedge i_clk or negedge i_nRst ) begin
    if ( !i_nRst )
        r_state <= IDLE                 ;
    else begin
        case ( r_state )
            IDLE    :   if ( !i_rx              )     r_state <= START  ;
            START   :   if ( tick_mid && i_rx   )     r_state <= IDLE   ;
                        else if ( tick_done     )     r_state <= DATA   ;
                         
            DATA    :   if ( tick_done && bit_done)   r_state <= STOP   ;
            STOP    :   if ( tick_done          )     r_state <= IDLE   ;
        endcase
    end
end

//  tick counter
reg         [3:0]   r_tick_cnt          ;
wire                tick_mid            ;
wire                tick_done           ;

assign      tick_mid    = i_tick_16x && (r_tick_cnt == 4'd7 )           ;
assign      tick_done   = i_tick_16x && (r_tick_cnt == 4'd15)           ;

always @( posedge i_clk or negedge i_nRst ) begin
    if      ( !i_nRst         )
        r_tick_cnt <= 4'd0              ;
    else if ( r_state == IDLE )
        r_tick_cnt <= 4'd0              ;
    else if ( tick_done       )
        r_tick_cnt <= 4'd0              ;
    else if ( i_tick_16x      )
        r_tick_cnt <= r_tick_cnt + 1    ;
end

//  bit counter
reg         [2:0]   r_bit_cnt           ;
wire                bit_done            ;

assign          bit_done    = ( r_bit_cnt == 3'd7 );

always @( posedge i_clk or negedge i_nRst ) begin
    if      ( !i_nRst )
        r_bit_cnt <= 3'd0               ;
    else if ( r_state == IDLE )
        r_bit_cnt <= 3'd0               ;
    else if ( (r_state == DATA) && tick_done )
        r_bit_cnt <= r_bit_cnt + 1      ;
    
end

// shift register

reg         [7:0]   r_shift             ;

always @(posedge i_clk or negedge i_nRst)begin
    if      ( !i_nRst )
        r_shift <= 8'b0                 ;
    else if ( (r_state == DATA) && tick_mid )
        r_shift <= {i_rx, r_shift[7:1]} ;    
end

//  출력

assign o_rx_data    = r_shift           ;
assign o_rx_done    = (r_state == STOP) && tick_done ;
assign o_frame_err  = (r_state == STOP) && tick_mid && (i_rx == 0) ;
endmodule