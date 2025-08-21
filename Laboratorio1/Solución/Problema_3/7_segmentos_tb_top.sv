`timescale 1ns/1ps
//////////////////////////////////////////////////////////////
//Test bech para verificar el funcionamiento del 7 segmentos 
//Desarrollador: Francisco Javier Suarez Sarmiento
//               Laura Elena Brenes Espinoza
/////////////////////////////////////////////////////////////
module tb_top;
    reg  [15:0] sw; //conexiones
    reg  [1:0]  btn;
    wire [6:0]  a_to_g;
    wire [7:0]  an;
    wire        dp;

    top dut ( //conexiones internas
        .sw(sw),
        .btn(btn),
        .a_to_g(a_to_g),
        .an(an),
        .dp(dp));

    integer j; //auxiliar pivote

    initial begin
        $display("=== Testbench===");

        // Grupo 0
        btn = 2'b00;
        for (j = 0; j < 16; j = j + 1) begin
            sw = {12'b0, j[3:0]}; // inicializa todos los bits
            #5;
            $display("Grupo 0, btn=%b, sw[3:0]=%h, a_to_g=%b, an=%b", btn, sw[3:0], a_to_g, an);
        end

        // Grupo 1
        btn = 2'b01;
        for (j = 0; j < 16; j = j + 1) begin
            sw = {8'b0, j[3:0], 4'b0}; // inicializa todos los bits
            #5;
            $display("Grupo 1, btn=%b, sw[7:4]=%h, a_to_g=%b, an=%b", btn, sw[7:4], a_to_g, an);
        end

        // Grupo 2
        btn = 2'b10;
        for (j = 0; j < 16; j = j + 1) begin
            sw = {4'b0, j[3:0], 8'b0};
            #5;
            $display("Grupo 2, btn=%b, sw[11:8]=%h, a_to_g=%b, an=%b", btn, sw[11:8], a_to_g, an);
        end

        // Grupo 3
        btn = 2'b11;
        for (j = 0; j < 16; j = j + 1) begin
            sw = {j[3:0], 12'b0};
            #5;
            $display("Grupo 3, btn=%b, sw[15:12]=%h, a_to_g=%b, an=%b", btn, sw[15:12], a_to_g, an);
        end

        $display("=======================");
        $stop;
    end
endmodule