`timescale 1ns/1ps

module usr_tb;
    // Define inputs as 'reg' and outputs as 'wire'
    reg clk, reset, s_in_l, s_in_r;
    reg [1:0] sel;
    reg [3:0] p_in;
    wire [3:0] q_out;

    // Instantiate the designed module
    universal_shift_register uut (
        .clk(clk), .reset(reset), .select(sel),
        .parallel_in(p_in), .serial_in_left(s_in_l),
        .serial_in_right(s_in_r), .q(q_out)
    );

    // Clock Generation: toggles every 5ns (100MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test Scenario
    initial begin
        // GTKWave için dalga formu dosyasını oluştur [cite: 185]
        $dumpfile("usr_result.vcd");
        $dumpvars(0, usr_tb);

        reset = 1; #15; reset = 0;     // 1. Reset State
        
        sel = 2'b11; p_in = 4'b1010; #10; // 2. Parallel Load: Load '1010'
        
        sel = 2'b00; #20;  // 3. Hold: Keep the value for 20ns
        
        // 4. Shift Right: Shift with '1' entering from the right
        sel = 2'b01; s_in_r = 1; #10; // Expected: 1101
        #10;                        // Expected: 1110
        
        sel = 2'b10; s_in_l = 1; #10; // 5. Shift Left: Shift with '0' entering from the left
        #10;

        $display("Simulasyon tamamlandi. GTKWave ile vcd dosyasini inceleyin.");
        $finish; // End the simulation
    end
endmodule