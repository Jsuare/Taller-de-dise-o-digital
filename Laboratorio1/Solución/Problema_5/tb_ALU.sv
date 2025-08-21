`timescale 1ns/1ps

module tb_ALU();
  parameter bits = 8;//Parametro 
  logic [bits-1:0] A, B;//Conexion
  logic FlagIn;
  logic [3:0] Control;
  logic FlagOut;
  logic [bits-1:0] Result;
  logic C;

  ALU #(bits) dut (
    .ALUA(A),
    .ALUB(B),
    .ALUFlagIn(FlagIn),
    .ALUControl(Control),
    .ALUFlags(FlagOut),
    .ALUResult(Result),
    .C(C));

  task test_case(input [3:0] ctrl, input [bits-1:0] a, b, input logic flag_in);
    begin
      A = a;
      B = b;
      FlagIn = flag_in;
      Control = ctrl;
      #5;
    end
  endtask

  initial begin
    // AND
    test_case(4'h0, 8'hF0, 8'h0F, 0);
    // OR
    test_case(4'h1, 8'hF0, 8'h0F, 0);
    // NOT (A)
    test_case(4'h2, 8'h55, 8'hAA, 0);
    // NOT (B)
    test_case(4'h2, 8'h55, 8'hAA, 1);
    // SUMA
    test_case(4'h3, 8'h0A, 8'h05, 0); // 10+5
    test_case(4'h3, 8'hFF, 8'h01, 0); // Overflow
    // RESTA
    test_case(4'h4, 8'h0A, 8'h05, 0); // 10-5
    test_case(4'h4, 8'h05, 8'h0A, 0); // Negativo
    // INC
    test_case(4'h5, 8'h0A, 8'h00, 0); // A+1
    test_case(4'h5, 8'h00, 8'h0A, 1); // B+1
    // DEC
    test_case(4'h6, 8'h0A, 8'h00, 0); // A-1
    test_case(4'h6, 8'h00, 8'h0A, 1); // B-1
    // XOR
    test_case(4'h7, 8'hF0, 8'h0F, 0);
    // SHIFT-L lógico
    test_case(4'h8, 8'h81, 8'h01, 0);
    test_case(4'h8, 8'h81, 8'h01, 1);
    // SHIFT-R lógico
    test_case(4'h9, 8'h81, 8'h01, 0);
    test_case(4'h9, 8'h81, 8'h01, 1);
    // SHIFT-ARITH-L
    test_case(4'hA, 8'h81, 8'h01, 0);
    // MAX
    test_case(4'hB, 8'h55, 8'hAA, 0);
    test_case(4'hB, 8'hAA, 8'h55, 0);
    // MIN
    test_case(4'hC, 8'h55, 8'hAA, 0);
    test_case(4'hC, 8'hAA, 8'h55, 0);
  end
endmodule
