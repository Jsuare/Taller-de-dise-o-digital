`timescale 1ns/1ps

module tb_ALU();
  parameter bits = 8;
  logic [bits-1:0] A, B;
  logic FlagIn;
  logic [3:0] Control;
  logic [bits-1:0] Result;
  logic FlagOut;
  logic C;

  ALU #(bits) dut (
    .ALUA(A),
    .ALUB(B),
    .ALUFlagIn(FlagIn),
    .ALUControl(Control),
    .ALUFlags(FlagOut),
    .ALUResult(Result),
    .C(C));

  initial begin
    // Valores ejemplo
    A = 8'b11010110;  
    B = 8'b00000011;   
    FlagIn = 1;
    Control = 4'h8;
    #10;
    $display("SHIFT-L: A=%b, B=%d, Result=%b, C=%b, FlagOut=%b",
              A, B, Result, C, FlagOut);
    Control = 4'h9;
    #10;
    $display("SHIFT-R: A=%b, B=%d, Result=%b, C=%b, FlagOut=%b",
              A, B, Result, C, FlagOut);
    $finish;
  end
endmodule
