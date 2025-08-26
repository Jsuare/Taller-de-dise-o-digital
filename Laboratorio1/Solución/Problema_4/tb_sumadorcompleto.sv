`timescale 1ns/1ps

module tb_sumadorcompleto;
    localparam int N_EXH = 8;     
    localparam int N_RAND16 = 16;
    localparam int N_RAND64 = 64;
    localparam int RANDOM_VECTORS = 20000; 

    
    logic [N_EXH-1:0]  a8, b8;  logic cin8;  logic [N_EXH-1:0] sum8;  logic cout8, ovf8;
    rca #(N_EXH) dut_rca8 (.a(a8), .b(b8), .cin(cin8), .sum(sum8), .cout(cout8), .ovf(ovf8));

    logic [15:0] a16, b16; logic cin16; logic [15:0] sum16_rca, sum16_cla; logic cout16_rca, cout16_cla, ovf16_rca, ovf16_cla;
    rca   #(16) dut_rca16 (.a(a16), .b(b16), .cin(cin16), .sum(sum16_rca), .cout(cout16_rca), .ovf(ovf16_rca));
    cla16      dut_cla16 (.a(a16), .b(b16), .cin(cin16), .sum(sum16_cla), .cout(cout16_cla), .ovf(ovf16_cla));
    logic [63:0] a64, b64; logic cin64; logic [63:0] sum64; logic cout64, ovf64;
    rca #(64) dut_rca64 (.a(a64), .b(b64), .cin(cin64), .sum(sum64), .cout(cout64), .ovf(ovf64));
    function automatic logic ref_ovf_2c (input logic [63:0] aa, input logic [63:0] bb, input logic [63:0] ss, input int W);
        return (aa[W-1] == bb[W-1]) && (ss[W-1] != aa[W-1]);
    endfunction

    // ---------- Pruebas ----------
    initial begin
        $display("==== PRUEBA EXHAUSTIVA RCA %0d-bit ====", N_EXH);
        int errors = 0;
        for (int c = 0; c < 2; c++) begin
            cin8 = c;
            for (int ia = 0; ia < (1<<N_EXH); ia++) begin
                a8 = ia[N_EXH-1:0];
                for (int ib = 0; ib < (1<<N_EXH); ib++) begin
                    b8 = ib[N_EXH-1:0];
                    #1; // delta para evaluar
                    automatic int W = N_EXH;
                    logic [W:0] ref = {1'b0,a8} + {1'b0,b8} + cin8;
                    logic ref_ovf = ref_ovf_2c({{64-W{1'b0}},a8}, {{64-W{1'b0}},b8}, {{64-W{1'b0}},sum8}, W);

                    if (sum8 !== ref[W-1:0] || cout8 !== ref[W] || ovf8 !== ref_ovf) begin
                        $error("Fallo EXH: a=%0d b=%0d cin=%0d | sum=%0d cout=%0b ovf=%0b | ref_sum=%0d ref_cout=%0b ref_ovf=%0b",
                               ia, ib, c, sum8, cout8, ovf8, ref[W-1:0], ref[W], ref_ovf);
                        errors++;
                        if (errors > 10) $fatal(1, "Demasiados errores.");
                    end
                end
            end
        end
        $display("Exhaustiva RCA %0d-bit OK (errores=%0d)", N_EXH, errors);


        $display("==== PRUEBA ALEATORIA 16-bit (CLA vs RCA) ====");
        errors = 0;
        cin16 = 0;
        for (int k = 0; k < RANDOM_VECTORS; k++) begin
            a16 = $urandom();
            b16 = $urandom();
            cin16 = $urandom_range(0,1);
            #1;
            if (sum16_rca   !== sum16_cla   ||
                cout16_rca  !== cout16_cla  ||
                ovf16_rca   !== ovf16_cla) begin
                $error("Desacuerdo CLA/RCA 16b: a=%h b=%h cin=%0b | rca(sum=%h cout=%0b ovf=%0b) cla(sum=%h cout=%0b ovf=%0b)",
                       a16, b16, cin16, sum16_rca, cout16_rca, ovf16_rca, sum16_cla, cout16_cla, ovf16_cla);
                errors++;
                if (errors > 10) $fatal(1, "Demasiados errores.");
            end
        end
        $display("CLA16 vs RCA16 OK en %0d vectores.", RANDOM_VECTORS);
        $display("==== PRUEBA ALEATORIA 64-bit RCA ====");
        for (int k = 0; k < RANDOM_VECTORS; k++) begin
            a64 = {$urandom(), $urandom()};
            b64 = {$urandom(), $urandom()};
            cin64 = $urandom_range(0,1);
            #1;
            logic [64:0] ref64 = {1'b0,a64} + {1'b0,b64} + cin64;
            logic ref_ovf64 = ref_ovf_2c(a64, b64, sum64, 64);
            assert(sum64 === ref64[63:0] && cout64 === ref64[64] && ovf64 === ref_ovf64)
                else $fatal(1, "Fallo 64b: a=%h b=%h cin=%0b", a64, b64, cin64);
        end
        $display("RCA64 pruebas aleatorias OK.");

        $display("==== TODAS LAS PRUEBAS PASARON ====");
        $finish;
    end
endmodule
