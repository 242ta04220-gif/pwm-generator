`timescale 1ns/1ps

module pwm_generator_tb;

    parameter COUNTER_WIDTH = 8;

    reg clk;
    reg reset;
    reg [COUNTER_WIDTH-1:0] duty_cycle;
    wire pwm_out;

    pwm_generator #(
        .COUNTER_WIDTH(COUNTER_WIDTH)
    ) uut (
        .clk(clk),
        .reset(reset),
        .duty_cycle(duty_cycle),
        .pwm_out(pwm_out)
    );

    // 10 ns clock period
    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        reset = 1'b1;
        duty_cycle = 8'd0;

        // Reset
        #20;
        reset = 1'b0;

        // 25% duty cycle
        duty_cycle = 8'd64;
        #2560;

        // 50% duty cycle
        duty_cycle = 8'd128;
        #2560;

        // 75% duty cycle
        duty_cycle = 8'd192;
        #2560;

        // ~100% duty cycle
        duty_cycle = 8'd255;
        #2560;

        $finish;
    end

    // Generate waveform
    initial begin
        $dumpfile("pwm_generator.vcd");
        $dumpvars(0, pwm_generator_tb);
    end

    initial begin
        $monitor("Time = %0t | Duty = %0d | PWM = %b",
                 $time, duty_cycle, pwm_out);
    end

endmodule
