module universal_shift_register (
    input clk,
    input reset,              // CLR input in schema
    input [1:0] select,       // S1 and S0 
    input [3:0] parallel_in,  // I3 ınputs
    input serial_in_left,     // Rıghtmost Mux I2 ınput
    input serial_in_right,    // Leftmost Mux I1 ınput
    output reg [3:0] q        // Output
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 4'b0000;
        end else begin
            case (select)
                2'b00: q <= q;                         // Hold (I0)
                2'b01: q <= {serial_in_right, q[3:1]}; // Shift Right (I1)
                2'b10: q <= {q[2:0], serial_in_left};  // Shift Left (I2)
                2'b11: q <= parallel_in;               // Parallel Load (I3)
            endcase
        end
    end
endmodule