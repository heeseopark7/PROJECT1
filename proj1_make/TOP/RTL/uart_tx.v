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
reg             [3:0]   r_tick_cnt          ;
wire                    tick_done           ; //  1bit 신호 끝
reg             [2:0]   r_bit_cnt           ;
wire                    bit_done            ; // 8번째 bit 보내는 중
reg             [7:0]   r_shift             ;
reg                     o_tx                ;

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

//  tick counter 0 ~ 15
assign      tick_done = i_tick_16x && (r_tick_cnt == 4'd15) ;

always @(posedge i_clk or negedge i_nRst)begin
    if (!i_nRst)
        r_tick_cnt <= 4'd0                  ;
    else if (r_state == IDLE)
        r_tick_cnt <= 4'd0                  ;
    else if (tick_done)
        r_tick_cnt <= 4'd0                  ; // 1bit 끝 다시세기
    else if (i_tick_16x)
        r_tick_cnt <= r_tick_cnt + 1        ;
end

//  bit counter 0 ~ 7
assign      bit_done = (r_bit_cnt == 3'd7)  ;

always @(posedge i_clk or negedge i_nRst)begin
    if (!i_nRst)
        r_bit_cnt <= 3'd0                   ;
    else if (r_state == IDLE)
        r_bit_cnt <= 3'd0                   ;
    else if ((r_state == DATA) && tick_done) // DATA상태이면서 1bit 끝날때마다
        r_bit_cnt <= r_bit_cnt + 1          ;
end

//  shift-register
always @(posedge i_clk or negedge i_nRst)begin
    if (!i_nRst)
        r_shift <= 8'd0                     ;
    else if ( (r_state == IDLE) && i_tx_start ) // 전송 명령(cmd_decoder) 들어온 순간
        r_shift <= i_tx_data                ;   // 보낼 데이터 복사해두기 (전송 중 i_tx_data 바뀌어도 r_shift 유지)
    else if ( (r_state == DATA) && tick_done )  // 비트 한 칸 끝날 때마다
        r_shift <= r_shift >> 1             ;   // 오른쪽으로 밀어서 다음 비트를 [0]으로 (LSB First)
end

//  tx 출력
assign o_tx_busy = (r_state != IDLE)        ;  //  IDLE이 아니면 busy신호 보내기

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