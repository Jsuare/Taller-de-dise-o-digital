`timescale 1ns / 1ps
////////////////////////////////////////////////////
//Para este ejercicio se plantea utilizar codi-
//cionales para establecer las jeraquias y poder
//obtener las combinaciones adecuadas.
//Desarrollador: Francisco Javier Suarez Sarmiento
///////////////////////////////////////////////////

module top( //modulo top con los tres componetes nesesarios a usar
    input  wire [15:0] sw, //nombres para las FPGA
    input  wire [3:0]  btn,
    output reg  [15:0] led);
    always @(*) begin
        // Grupo 0 (sw[3:0])
        if (btn[0])
            led[3:0] = 4'b0000;
        else
            led[3:0] = sw[3:0];
        // Grupo 1 (sw[7:4])
        if (btn[1])
            led[7:4] = 4'b0000;
        else
            led[7:4] = sw[7:4];
        // Grupo 2 (sw[11:8])
        if (btn[2])
            led[11:8] = 4'b0000;
        else
            led[11:8] = sw[11:8];
        // Grupo 3 (sw[15:12])
        if (btn[3])
            led[15:12] = 4'b0000;
        else
            led[15:12] = sw[15:12];
    end
endmodule