`timescale 1ns / 1ps
/////////////////////////////////////////////////////////////////////////////////////////////////////
//Para este ejercicio se utiliza el display de 7 segmentos para mostrar el valor de cero a 
//quince establecido por los switch y por medio 
// de cuatro bloques determinado por un mux  de cuatro botones.
//Desarrollador: Francisco Javier Suarez Sarmiento
//               Laura Elena Brenes Espinoza
/////////////////////////////////////////////////////////////////////////////////////////////////////

module top( //modulo top
    input  wire [15:0] sw, //Nombres de acuerdo a la tarjeta    
    input  wire [1:0]  btn,   
    output wire [6:0]  a_to_g,//nombre para el display
    output reg  [7:0]  an,
    output wire        dp );

    assign dp = 1'b1; // Decimal point fijo apagado

    // Selección del grupo de switches a mostrar
    reg [3:0] selected_sw;
    always_comb begin
        case(btn)
            2'b00: selected_sw = sw[3:0];     // bloque 0
            2'b01: selected_sw = sw[7:4];     // bloque 1
            2'b10: selected_sw = sw[11:8];    // bloque 2
            2'b11: selected_sw = sw[15:12];   // bloque 3
            default: selected_sw = 4'b0000;
        endcase
    end

    // Instanciación del decodificador hexadecimal a 7 segmentos
    hex7seg D1(.x(selected_sw), .a_to_g(a_to_g));

    // Control de ánodos
    always_comb begin
        an = 8'b11111111; // todos apagados (recuerda que son activos en bajo)
        case(btn)
            2'b00: an[0] = 0; // display 0
            2'b01: an[1] = 0; // display 1
            2'b10: an[2] = 0; // display 2
            2'b11: an[3] = 0; // display 3
        endcase
    end

endmodule

// Decodificador hexadecimal a 7 segmentos
module hex7seg(
    input  wire [3:0] x,
    output reg  [6:0] a_to_g
);
    always_comb begin
        case(x) //todas las combinaciones para los 15 numeros
            4'h0: a_to_g = 7'b1000000;
            4'h1: a_to_g = 7'b1111001;
            4'h2: a_to_g = 7'b0100100;
            4'h3: a_to_g = 7'b0110000;
            4'h4: a_to_g = 7'b0011001;
            4'h5: a_to_g = 7'b0010010;
            4'h6: a_to_g = 7'b0000010;
            4'h7: a_to_g = 7'b1111000;
            4'h8: a_to_g = 7'b0000000;
            4'h9: a_to_g = 7'b0010000;
            4'hA: a_to_g = 7'b0001000;
            4'hB: a_to_g = 7'b0000011;
            4'hC: a_to_g = 7'b1000110;
            4'hD: a_to_g = 7'b0100001;
            4'hE: a_to_g = 7'b0000110;
            4'hF: a_to_g = 7'b0001110;
            default: a_to_g = 7'b1111111;
        endcase
    end
endmodule