`timescale 1ns / 1ps 

module  uart_tx (
    i_clk       ,
    i_nRst      ,
    i_tick_16x  ,
    i_tx_start  ,
    i_tx_data   ,
    o_tx_busy   ,
    o_tx        
);

//  포트 선언
input                   i_clk           ;
input                   i_nRst          ;
input                   i_tick_16x      ;
input                   i_tx_start      ;
input           [7:0]   i_tx_data       ;
output                  o_tx_busy       ;
output                  o_tx            ;

//  localparam FSM 정의
localparam      [1:0]   IDLE    = 2'b00 ;
localparam      [1:0]   START   = 2'b01 ;
localparam      [1:0]   DATA    = 2'b10 ;
localparam      [1:0]   STOP    = 2'b11 ;

reg             [1:0]   r_state         ;

// FSM
always @(posedge i_clk or negedge i_nRst)begin
    
    if(!i_nRst)
        r_state <= IDLE     ;
    
    else begin
    
        case (r_state)
        IDLE    :   if  (i_tx_start )               r_state <=  START   ;
        START   :   if  (tick_done  )               r_state <=  DATA    ;
        DATA    :   if  (tick_done && bit_done )    r_state <=  STOP    ;
        STOP    :   if  (tick_done  )               r_state <=  IDLE    ;
        endcase

    end

end

reg             [3:0]   r_tick_cnt      ;
wire                    tick_done       ;

assign      tick_done = i_tick_16x && (r_tick_cnt == 4'd15) ;

//  tick counter 0 ~ 15
always @(posedge i_clk or negedge i_nRst)begin
    if (!i_nRst)
        r_tick_cnt <= 4'd0              ;
    else if (r_state == IDLE)
        r_tick_cnt <= 4'd0              ;
    else if (tick_done)
        r_tick_cnt <= 4'd0              ;
    else if (i_tick_16x)
        r_tick_cnt <= r_tick_cnt + 1    ;
end

reg             [2:0]   r_bit_cnt       ;
wire                    bit_done        ;
assign      bit_done = (r_bit_cnt == 3'd7)  ;

//  bit counter 0 ~ 7
always @(posedge i_clk or negedge i_nRst)begin
    if (!i_nRst)
        r_bit_cnt <= 3'd0               ;
    else if (r_state == IDLE)
        r_bit_cnt <= 3'd0               ;
    else if ((r_state == DATA) && tick_done)
        r_bit_cnt <= r_bit_cnt + 1      ;
end

reg             [7:0]   r_shift         ;

//  shift-register
always @(posedge i_clk or negedge i_nRst)begin
    if (!i_nRst)
        r_shift <= 8'd0                 ;
    else if ( (r_state == IDLE) && i_tx_start ) 
        r_shift <= i_tx_data            ;
    else if ( (r_state == DATA) && tick_done )
        r_shift <= r_shift >> 1         ;
end

//  tx 출력

assign o_tx_busy = (r_state != IDLE)    ;

reg                     o_tx            ;

always @(*)begin
    case (r_state)
    IDLE    :       o_tx =  1'b1        ; 
    START   :       o_tx =  1'b0        ;
    DATA    :       o_tx =  r_shift[0]  ;
    STOP    :       o_tx =  1'b1        ;
    default :       o_tx =  1'b1        ;
    endcase
end

endmodule