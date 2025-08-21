`timescale 1ns / 1ps

module mux4x1 #(
    parameter int W = 4   // Bit width
) (
    input  logic [W-1:0] A,
    input  logic [W-1:0] B,
    input  logic [W-1:0] C,
    input  logic [W-1:0] D,
    input  logic [1:0]   select,
    output logic [W-1:0] mux_out
);

    always_comb begin
        unique case (select)
            2'b00 : mux_out = A;
            2'b01 : mux_out = B;
            2'b10 : mux_out = C;
            2'b11 : mux_out = D;
            default: mux_out = '0;  // SV shortcut for all zeros
        endcase
    end

endmodule
