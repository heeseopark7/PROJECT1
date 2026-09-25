`timescale 1ns / 1ps

module tb_uart_top_n;

// -------------------------------------------------------------
// Parameters - 실제 baud_gen 설정(클럭/보레이트)에 맞게 수정할 것
// -------------------------------------------------------------
parameter CLK_PERIOD  = 20;                          // 50MHz 가정 (20ns) -> 환경에 맞게 수정
parameter BAUD_RATE   = 9600;                         // baud_gen이 만드는 통신 속도 -> 환경에 맞게 수정
parameter BIT_PERIOD  = 1_000_000_000 / BAUD_RATE;    // 1비트 전송 시간 (ns)

// DUT 외부 실핀
reg         i_clk;
reg         i_nRst;
reg         i_rx;
wire        o_tx;
wire        o_led_ctrl;

// -------------------------------------------------------------
// DUT (Design Under Test) - IOPAD 포함된 uart_top
// -------------------------------------------------------------
uart_top_n dut (
    .i_clk      (i_clk      ),
    .i_nRst     (i_nRst     ),
    .i_rx       (i_rx       ),
    .o_tx       (o_tx       ),
    .o_led_ctrl (o_led_ctrl )
);

// -------------------------------------------------------------
// Clock generation
// -------------------------------------------------------------
initial i_clk = 1'b0;
always #(CLK_PERIOD/2) i_clk = ~i_clk;

// -------------------------------------------------------------
// UART 1바이트 송신 task
// (Start bit 1 + Data 8bit LSB first + Stop bit 1)
// -------------------------------------------------------------
task send_uart_byte;
    input [7:0] data;
    integer i;
    begin
        // Start bit
        i_rx = 1'b0;
        #(BIT_PERIOD);

        // Data bits (LSB first)
        for (i = 0; i < 8; i = i + 1) begin
            i_rx = data[i];
            #(BIT_PERIOD);
        end

        // Stop bit
        i_rx = 1'b1;
        #(BIT_PERIOD);
    end
endtask

// -------------------------------------------------------------
// Stimulus
// -------------------------------------------------------------
initial begin
    i_nRst = 1'b0;
    i_rx   = 1'b1;   // UART idle 상태 = high

    #(CLK_PERIOD * 10);
    i_nRst = 1'b1;

    #(BIT_PERIOD * 5);

    // 예시 프레임 전송 - cmd_decoder 프로토콜에 맞는 실제 커맨드 값으로 교체 필요
    send_uart_byte(8'h41);   // 'A'
    #(BIT_PERIOD * 5);
    send_uart_byte(8'h42);   // 'B'

    #(BIT_PERIOD * 20);
    $finish;
end

// -------------------------------------------------------------
// Monitor
// -------------------------------------------------------------
initial begin
    $monitor("time=%0t nRst=%b rx=%b tx=%b led=%b",
              $time, i_nRst, i_rx, o_tx, o_led_ctrl);
end

// -------------------------------------------------------------
// VCD dump - xrun +define+function_sim 옵션이 켜졌을 때만 활성화
// -------------------------------------------------------------
`ifdef function_sim
initial begin
    $dumpfile("./DUMP/uart_top_n.vcd");
    $dumpvars(0, tb_uart_top_n);
end
`endif

endmodule
