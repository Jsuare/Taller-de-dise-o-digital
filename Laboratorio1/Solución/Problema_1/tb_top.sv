`timescale 1ns / 1ps
////////////////////////////////////////////////////
//Testbech para hacer las prueba de funcionamiento
//del ejercicio.
//Desarrollador: Francisco Javier Suarez Sarmiento
///////////////////////////////////////////////////
module tb_top();
    reg  [15:0] sw; //conexiones 
    reg  [3:0]  btn;
    wire [15:0] led;

    top uut ( //llamado al modulo principal
        .sw(sw), //coneciones entre ambos
        .btn(btn),
        .led(led));

    initial begin
        // Caso 1: todos los switches en 1, sin presionar botones
        sw  = 16'hFFFF;
        btn = 4'b0000;
        #10;

        // Caso 2: presionamos botón 0 (grupo 0 apagado)
        btn = 4'b0001;
        #10;

        // Caso 3: presionamos botón 1 (grupo 1 apagado)
        btn = 4'b0010;
        #10;

        // Caso 4: presionamos botón 2 (grupo 2 apagado)
        btn = 4'b0100;
        #10;

        // Caso 5: presionamos botón 3 (grupo 3 apagado)
        btn = 4'b1000;
        #10;

        // Caso 6: presionamos todos los botones (todos apagados)
        btn = 4'b1111;
        #10;

        // Caso 7: patron aleatorio
        sw  = 16'hA5A5; 
        btn = 4'b0101; 
        #10;
        $stop;
    end
endmodule