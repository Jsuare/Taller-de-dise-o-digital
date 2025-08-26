`timescale 1ns/1ps

// ------------------------------
// 1-bit Full Adder
// ------------------------------
module top(
    input  logic a,
    input  logic b,
    input  logic cin,
    output logic sum,
    output logic cout
);
    assign {cout, sum} = a + b + cin;
endmodule

// ------------------------------
// Ripple-Carry Adder parametrizabl
// ------------------------------
module rca #(
    parameter int N = 8
)(
    input  logic [N-1:0] a,
    input  logic [N-1:0] b,
    input  logic         cin,
    output logic [N-1:0] sum,
    output logic         cout,
    output logic         ovf    
);
    logic [N:0] c;
    assign c[0] = cin;

    genvar i;
    generate
        for (i = 0; i < N; i++) begin : g_fa
            fa_1b u_fa (
                .a   (a[i]),
                .b   (b[i]),
                .cin (c[i]),
                .sum (sum[i]),
                .cout(c[i+1])
            );
        end
    endgenerate
    assign cout = c[N];
    assign ovf  = c[N] ^ c[N-1];
endmodule

// ------------------------------
// 4-bit Carry Lookahead Adder (bloque)
// ------------------------------
module cla4(
    input  logic [3:0] a,
    input  logic [3:0] b,
    input  logic       cin,
    output logic [3:0] sum,
    output logic       cout,
    output logic       pg, 
    output logic       gg   
);
    logic [3:0] p, g;
    logic c1, c2, c3, c4;

    assign p = a ^ b;  
    assign g = a & b;  
    assign c1 = g[0] | (p[0] & cin);
    assign c2 = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin);
    assign c3 = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
    assign c4 = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) |
                (p[3] & p[2] & p[1] & p[0] & cin);

    assign sum = {p[3]^c3, p[2]^c2, p[1]^c1, p[0]^cin};
    assign cout = c4;

    assign pg = &p;          
    assign gg = g[3] | (p[3]&g[2]) | (p[3]&p[2]&g[1]) | (p[3]&p[2]&p[1]&g[0]);
endmodule

// ------------------------------
// 16-bit Carry Lookahead Adder
// -----------------------------
module cla16(
    input  logic [15:0] a,
    input  logic [15:0] b,
    input  logic        cin,
    output logic [15:0] sum,
    output logic        cout,
    output logic        ovf
);
    logic [3:0] pg, gg;
    logic [4:0] c;
    assign c[0] = cin;

    cla4 u0(.a(a[3:0]),   .b(b[3:0]),   .cin(c[0]), .sum(sum[3:0]),   .cout(), .pg(pg[0]), .gg(gg[0]));
    cla4 u1(.a(a[7:4]),   .b(b[7:4]),   .cin(c[1]), .sum(sum[7:4]),   .cout(), .pg(pg[1]), .gg(gg[1]));
    cla4 u2(.a(a[11:8]),  .b(b[11:8]),  .cin(c[2]), .sum(sum[11:8]),  .cout(), .pg(pg[2]), .gg(gg[2]));
    cla4 u3(.a(a[15:12]), .b(b[15:12]), .cin(c[3]), .sum(sum[15:12]), .cout(), .pg(pg[3]), .gg(gg[3]));
    assign c[1] = gg[0] | (pg[0] & c[0]);
    assign c[2] = gg[1] | (pg[1] & c[1]);
    assign c[3] = gg[2] | (pg[2] & c[2]);
    assign c[4] = gg[3] | (pg[3] & c[3]);

    assign cout = c[4];
    assign ovf  = c[4] ^ c[3];  // overflow 2's complement
endmodule
