`timescale 1ns / 1ps

module ALU_tb;

    // Definición de señales
    logic [3:0] ALUA, ALUB, ALUResult, ALUControl;
    logic ALUFlagIn;
    logic ALUFlags, C;

    // Instancia del módulo ALU parametrizable
    ALU #(.bits(4)) dut(
        .ALUA(ALUA),
        .ALUB(ALUB),
        .ALUFlagIn(ALUFlagIn),
        .ALUControl(ALUControl),
        .ALUFlags(ALUFlags),
        .ALUResult(ALUResult),
        .C(C)
    );

    // Procedimiento de test
    initial begin 
        // Valores iniciales
        ALUA = 4'b1011; // 11
        ALUB = 4'b0011; // 3
        ALUFlagIn = 0;

        // --- Operaciones lógicas ---
        ALUControl = 4'h0; #10;
        assert(ALUResult == (ALUA & ALUB)) else $fatal("Error: AND failed!");

        ALUControl = 4'h1; #10;
        assert(ALUResult == (ALUA | ALUB)) else $fatal("Error: OR failed!");

        ALUControl = 4'h7; #10;
        assert(ALUResult == (ALUA ^ ALUB)) else $fatal("Error: XOR failed!");

        // --- NOT con ALUFlagIn ---
        ALUControl = 4'h2; ALUFlagIn = 0; #10;
        assert(ALUResult == ~ALUA) else $fatal("Error: NOT A failed!");
        ALUControl = 4'h2; ALUFlagIn = 1; #10;
        assert(ALUResult == ~ALUB) else $fatal("Error: NOT B failed!");

        // --- Aritméticas ---
        ALUControl = 4'h3; ALUFlagIn = 0; #10;
        assert(ALUResult == (ALUA + ALUB)) else $fatal("Error: ADD failed!");

        ALUControl = 4'h4; ALUFlagIn = 0; #10;
        assert(ALUResult == (ALUA - ALUB)) else $fatal("Error: SUB failed!");

        ALUControl = 4'h5; ALUFlagIn = 0; #10;
        assert(ALUResult == (ALUA + 1)) else $fatal("Error: INC A failed!");
        ALUControl = 4'h5; ALUFlagIn = 1; #10;
        assert(ALUResult == (ALUB + 1)) else $fatal("Error: INC B failed!");

        ALUControl = 4'h6; ALUFlagIn = 0; #10;
        assert(ALUResult == (ALUA - 1)) else $fatal("Error: DEC A failed!");
        ALUControl = 4'h6; ALUFlagIn = 1; #10;
        assert(ALUResult == (ALUB - 1)) else $fatal("Error: DEC B failed!");

        // --- Corrimientos ---
        ALUControl = 4'h8; ALUB = 2; ALUFlagIn = 0; #10;
        assert(ALUResult == (ALUA << ALUB)) else $fatal("Error: LSHIFT failed!");

        ALUControl = 4'h9; ALUB = 2; ALUFlagIn = 0; #10;
        assert(ALUResult == (ALUA >> ALUB)) else $fatal("Error: RSHIFT failed!");

        ALUControl = 4'hA; ALUB = 2; ALUFlagIn = 0; #10;
        assert(ALUResult == (ALUA <<< ALUB)) else $fatal("Error: ARITH LSHIFT failed!");

        // --- Máximo y mínimo ---
        ALUControl = 4'hB; #10;
        assert(ALUResult == ((ALUA > ALUB) ? ALUA : ALUB)) else $fatal("Error: MAX failed!");

        ALUControl = 4'hC; #10;
        assert(ALUResult == ((ALUA < ALUB) ? ALUA : ALUB)) else $fatal("Error: MIN failed!");

        $display("✅ All tests passed!");
        $finish;
    end

endmodule