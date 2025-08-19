`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  1. Diseñe la ALU con un modelo utilizando SystemVerilog.
//  Parta de los circuitos básicos (sumadores, restadores, decorrimiento,etc.)
//  que con sidere necesarios.
// Estudiante a cargo: Francisco Javier Suarez Sarmiento 
// Laboratorio 1. 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module ALU#(
    parameter bits = 4 // Tamaño de los bits
)(
    input  logic [bits-1:0] ALUA,      // Entrada A
    input  logic [bits-1:0] ALUB,      // Entrada B
    input  logic ALUFlagIn,            // Bandera de entrada
    input  logic [3:0] ALUControl,     // Código de operación
    output logic ALUFlags,             // Bandera de carry (para suma/resta)
    output logic [bits-1:0] ALUResult, // Resultado de la ALU
    output logic C                     // Último bit salido en corrimientos
);

    // Variables auxiliares
    logic carry_out_suma;
    logic carry_out_resta;

    always @(*) begin
        // Valores por defecto seguros
        ALUResult = 0;
        C = 0;
        carry_out_suma = 0;
        carry_out_resta = 0;

        case(ALUControl)
            4'h0: // AND
                ALUResult = ALUA & ALUB;

            4'h1: // OR
                ALUResult = ALUA | ALUB;

            4'h2: // NOT (sobre un operando, depende de ALUFlagIn)
                ALUResult = (ALUFlagIn == 0) ? ~ALUA : ~ALUB;

            4'h3: // Suma en complemento a dos
                {carry_out_suma, ALUResult} = ALUA + ALUB + ALUFlagIn;

            4'h4: // Resta en complemento a dos
                {carry_out_resta, ALUResult} = ALUA - (ALUB + ALUFlagIn);

            4'h5: // Incrementar en uno (A o B según ALUFlagIn)
                {carry_out_suma, ALUResult} = (ALUFlagIn == 0) ? (ALUA + 1) : (ALUB + 1);

            4'h6: // Decrementar en uno (A o B según ALUFlagIn)
                {carry_out_resta, ALUResult} = (ALUFlagIn == 0) ? (ALUA - 1) : (ALUB - 1);

            4'h7: // XOR
                ALUResult = ALUA ^ ALUB;
            4'h8: begin // SHIFT-L lógico
    if (ALUB == 0) begin
        ALUResult = ALUA;
        C = 0;
    end else begin
        ALUResult = (ALUA << ALUB) | (ALUFlagIn ? ((1 << ALUB) - 1) : 0);
        C = ALUA[bits-ALUB];
    end
end

4'h9: begin // SHIFT-R lógico
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

            4'hB: // Máximo entre operandos
                ALUResult = (ALUA > ALUB) ? ALUA : ALUB;

            4'hC: // Mínimo entre operandos
                ALUResult = (ALUA < ALUB) ? ALUA : ALUB;

            default: 
                ALUResult = 0; // Valor seguro
        endcase
    end
    
    // Bandera de carry (solo en suma/resta/incremento/decremento)
    always @(*) begin
        case(ALUControl)
            4'h3, 4'h5: // Suma e incremento
                ALUFlags = carry_out_suma; 
            4'h4, 4'h6: // Resta y decremento
                ALUFlags = carry_out_resta; 
            default:
                ALUFlags = 0; 
        endcase
    end
endmodule
