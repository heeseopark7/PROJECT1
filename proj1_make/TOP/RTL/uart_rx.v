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

reg                 r_rx_sync1          ;
reg                 r_rx_sync2          ;
reg         [1:0]   r_state             ;
reg         [3:0]   r_tick_cnt          ;
wire                tick_mid            ;
wire                tick_done           ;
reg         [2:0]   r_bit_cnt           ;
wire                bit_done            ;
reg         [7:0]   r_shift             ;

//     i_rx 2단 동기화 (2-FF synchronizer)
//   - i_rx는 PC에서 오는 비동기 신호라 i_clk 에지 순간에 바뀌면 FF가 메타스테이블이 될 수 있음
//   - 1단(sync1)이 흔들려도 한 클록 뒤 2단(sync2)이 안정된 값을 잡음
//   - 모듈 내부는 i_rx 대신 r_rx_sync2만 사용 → FSM/시프트/frame_err가 항상 같은 값을 봄
always @( posedge i_clk or negedge i_nRst) begin
    if (!i_nRst) begin
        r_rx_sync1 <= 1'b1              ;
        r_rx_sync2 <= 1'b1              ;
    end
    else begin
        r_rx_sync1 <= i_rx              ;
        r_rx_sync2 <= r_rx_sync1        ;

    end
end

//  FSM
always @( posedge i_clk or negedge i_nRst ) begin
    if ( !i_nRst )
        r_state <= IDLE                 ;
    else begin
        case ( r_state )
            IDLE    :   if ( !r_rx_sync2            )   r_state <= START  ;
            // START : IDLE에서 본 0이 진짜 스타트비트인지 확인
            START   :   if ( tick_mid && r_rx_sync2 )   r_state <= IDLE   ; //   - tick_mid(7)에서 r_rx_sync2가 1이면 반 비트도 안 되는 글리치 → IDLE 복귀 (false start 거부)
                        else if ( tick_done         )   r_state <= DATA   ; //   - 가운데에서도 0이면 진짜 스타트비트 → tick_done(15)에 DATA로 천이          
            DATA    :   if ( tick_done && bit_done  )   r_state <= STOP   ;
            STOP    :   if ( tick_done              )   r_state <= IDLE   ;
        endcase
    end
end

//  tick counter
assign      tick_mid    = i_tick_16x && (r_tick_cnt == 4'd7 )           ; // 1bit 가운데 (샘플링 지점)
assign      tick_done   = i_tick_16x && (r_tick_cnt == 4'd15)           ; // 1bit 끝지점

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
always @( posedge i_clk or negedge i_nRst ) begin
    if      ( !i_nRst )
        r_shift <= 8'd0                       ;
    else if ( (r_state == DATA) && tick_mid )
        r_shift <= {r_rx_sync2, r_shift[7:1]} ;    
end

//  출력
assign o_rx_data    = r_shift                                               ;
assign o_rx_done    = (r_state == STOP) && tick_done                        ;
assign o_frame_err  = (r_state == STOP) && tick_mid && (r_rx_sync2 == 1'b0) ; // STOP비트 가운데에서 0이면 프레임에러

endmodule