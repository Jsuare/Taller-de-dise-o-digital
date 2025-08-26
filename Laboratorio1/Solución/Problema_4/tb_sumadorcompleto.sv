`timescale 1ns/1ps

module tb_adders;

    // DUT: sumador ripple-carry de 8 bits
    logic [7:0] a, b;
    logic cin;
    logic [7:0] sum;
    logic cout, ovf;

    rca #(8) dut (
        .a(a), .b(b), .cin(cin),
        .sum(sum), .cout(cout), .ovf(ovf)
    );

    // Función de referencia (overflow en complemento a 2)
    function logic ref_ovf(input logic [7:0] aa, bb, ss);
        return (aa[7] == bb[7]) && (ss[7] != aa[7]);
    endfunction

    initial begin
        $display("==== PRUEBA SIMPLE DEL SUMADOR 8-bit ====");

        // Caso 1: 5 + 3
        a = 8'd5; b = 8'd3; cin = 0; #1;
        $display("5 + 3 = %0d (sum=%0d cout=%0b ovf=%0b)", a, b, sum, cout, ovf);

        // Caso 2: 100 + 50
        a = 8'd100; b = 8'd50; cin = 0; #1;
        $display("100 + 50 = sum=%0d cout=%0b ovf=%0b", sum, cout, ovf);

        // Caso 3: Overflow con negativos
        a = 8'sd120; b = 8'sd120; cin = 0; #1;
        $display("120 + 120 = sum=%0d cout=%0b ovf=%0b (ref_ovf=%0b)",
                  sum, cout, ovf, ref_ovf(a,b,sum));

        // Caso 4: con carry in
        a = 8'd200; b = 8'd55; cin = 1; #1;
        $display("200 + 55 + cin=1 -> sum=%0d cout=%0b ovf=%0b",
                  sum, cout, ovf);

        $display("==== FIN DE PRUEBAS ====");
        $finish;
    end
endmodule
