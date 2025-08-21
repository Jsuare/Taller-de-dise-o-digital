`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  1. Diseñe la ALU con un modelo utilizando SystemVerilog.
//  Parta de los circuitos básicos (sumadores, restadores, decorrimiento,etc.)
//  que con sidere necesarios.
// Estudiante a cargo: Francisco Javier Suarez Sarmiento 
// Laboratorio 1. 
//////////////////////////////////////////////////////////////////////////////////
module ALU#(  
    parameter bits = 8 // Tamaño de los bits
)(
    input  logic [bits-1:0] ALUA,      // Entrada A
    input  logic [bits-1:0] ALUB,      // Entrada B
    input  logic ALUFlagIn,            // Bandera de entrada
    input  logic [3:0] ALUControl,     // Código de operación
    output logic ALUFlags,             // Bandera 
    output logic [bits-1:0] ALUResult, // Resultado de la ALU
    output logic C                     // Último bit expulsado
);

    // Auxiliares
    logic carry_suma;
    logic carry_resta;

    always @(*) begin
        // Valores defecto
        ALUResult   = '0;
        C           = 0;
        carry_suma  = 0;
        carry_resta = 0;

        case(ALUControl)
            4'h0: begin // AND
                ALUResult = ALUA & ALUB;
                C = 0;
            end

            4'h1: begin // OR
                ALUResult = ALUA | ALUB;
                C = 0;
            end

            4'h2: begin // not
                ALUResult = (ALUFlagIn == 0) ? ~ALUA : ~ALUB;
                C = 0;
            end

            4'h3: begin // suma
                {carry_suma, ALUResult} = ALUA + ALUB + ALUFlagIn;
                C = carry_suma;
            end

            4'h4: begin // resta
                {carry_resta, ALUResult} = ALUA - ALUB + ALUFlagIn;
                C = carry_resta; 
            end

            4'h5: begin // incremetar
                if (ALUFlagIn == 0)
                    {carry_suma, ALUResult} = ALUA + 1;
                else
                    {carry_suma, ALUResult} = ALUB + 1;
                C = carry_suma;
            end

            4'h6: begin // decrementar
                if (ALUFlagIn == 0)
                    {carry_resta, ALUResult} = ALUA - 1;
                else
                    {carry_resta, ALUResult} = ALUB - 1;
                C = carry_resta; 
            end

            4'h7: begin // XOR
                ALUResult = ALUA ^ ALUB;
                C = 0;
            end

            4'h8: begin // SHIFT-L 
                if (ALUB == 0) begin
                    ALUResult = ALUA;
                    C = 0;
                end else begin
                    ALUResult = (ALUA << ALUB) | (ALUFlagIn ? ((1 << ALUB) - 1) : 0);
                    C = ALUA[bits-ALUB];
                end
            end

            4'h9: begin // SHIFT-R 
                if (ALUB == 0) begin
                    ALUResult = ALUA;
                    C = 0;
                end else begin
                    ALUResult = (ALUA >> ALUB) | (ALUFlagIn ? (((1 << ALUB) - 1) << (bits-ALUB)) : 0);
                    C = ALUA[ALUB-1]; 
                end
            end

            4'hA: begin // SHIFT-ARITH-L 
                if (ALUB == 0) begin
                    ALUResult = ALUA;
                    C = 0;
                end else begin
                    ALUResult = (ALUA <<< ALUB) | (ALUFlagIn ? ((1 << ALUB) - 1) : 0);
                    C = ALUA[bits-ALUB];
                end
            end

            4'hB: begin // maximo
                ALUResult = (ALUA > ALUB) ? ALUA : ALUB;
                C = 0;
            end

            4'hC: begin // minimo
                ALUResult = (ALUA < ALUB) ? ALUA : ALUB;
                C = 0;
            end
            default: begin
                ALUResult = '0;
                C = 0;
            end
        endcase
    end

    // Bandera de carry y arimetrica
    always @(*) begin
        case(ALUControl)
            4'h3, 4'h5: // SUMA / INC
                ALUFlags = carry_suma; 
            4'h4, 4'h6: // RESTA / DEC
                ALUFlags = carry_resta; 
            default:
                ALUFlags = 0; 
        endcase
    end
endmodule
