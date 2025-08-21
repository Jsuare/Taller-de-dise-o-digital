# 3.3. Ejercicio 3. Decodificador para display de 7 segmentos
 1. Diseñe un decodificador para un display de 7 segmentos. Este debe recibir un valor binario,
 representado con 4 bits, y mostrar su representaci´on correspondiente en hexadecimal.
 2. Valide el funcionamiento de su diseño mediante un testbench exhaustivo.
 3. Modifique su diseño de manera que 4 grupos de 4 switchs provean un potencial valor
 a mostrar en el display de 7 segmentos, como se ilustra en la Figura 1. Estas entradas
 estar´an multiplexadas al display de 7 segmentos (sw 1-4, sw 5-8, sw 9-12, y sw 13-16)
 y mediante dos de los botones (push button) disponibles (btn 1-2) realizará la selección
 de cuál de las 4 entradas se mostrará.
 4. Implemente un testbench exhaustivo con el que valide el correcto funcionamiento de su
 diseño. Realice su validación a nivel post-s´ıntesis.
 5. Realice una validación de su diseño en la tarjeta con FPGA que se utilizará a lo largo del
 curso.
# Objetivo 
Implementar y validar un decodificador de 7 segmentos para mostrar valores hexadecimales a partir de 4 bits, con selección de entre cuatro grupos de switches usando botones en la placa Nexys 4.

# Planteamiento de la solución
## Tabla de verdad para el 7 segmento. 

| Entrada (Hex) | Entrada binaria | Segmentos `{a,b,c,d,e,f,g}` | 
| ------------- | --------------- | --------------------------- | 
| 0             | 0000            | 1111110                     | 
| 1             | 0001            | 0110000                     | 
| 2             | 0010            | 1101101                     |
| 3             | 0011            | 1111001                     | 
| 4             | 0100            | 0110011                     | 
| 5             | 0101            | 1011011                     | 
| 6             | 0110            | 1011111                     | 
| 7             | 0111            | 1110000                     | 
| 8             | 1000            | 1111111                     | 
| 9             | 1001            | 1111011                     | 
| A             | 1010            | 1110111                     | 
| B             | 1011            | 0011111                     | 
| C             | 1100            | 1001110                     | 
| D             | 1101            | 0111101                     | 
| E             | 1110            | 1001111                     | 
| F             | 1111            | 1000111                     | 

# Solucion del ejercicio.
Para el 7 segmentos se debe de tener una configuración de cadaled que comforma el dispositivo de manera que al tener 4 bits representados por los switch, estos se deben de representar correctamente en el display. También se debde de tener en cuenta la jerarquía de los botones para determinar cual de lo cuatro display se esta utilizando, a partir de la configuración del multiplexor del ejercicio 2 podemos determinar la siguiente tabla:
## Tabla del muxtiplexor para el 7 segmento. 

| Bloque de switch| combinacón del mux | Display|
| --------------- | ------------------ | -------|
| 0               |     00             |    0   |
| 1               |     01             |    1   |
| 2               |     10             |    2   |
| 3               |     11             |    3   |

De está forma en cada display se mostrará la combinacion de bits por así decirlo de los switch en 4 display de manera que se muestre los valores de cero a quince en el 7 segmentos.
El codigo utilizado es el siguiente: 
[Ver código 7_segmentos_top.sv](7_segmentos_top.sv)


Y como los demás casos se utilizará la simulación para ver el como se comporta cada caso del 7 segmentos antes de implementarlo en la tarjeta FPGA.
El codigo del tb es el siguiente: 
[Ver código 7_segmentos_tb_top.sv](7_segmentos_tb_top.sv)

La simulación del ejercicio se divide en varios espacio pero aqui podemos ver como funciona y su correcta implementación.
![Simulación ejercicio 3](../Imagenes%20para%20la%20solucion/simulacionejercico3.png)

Como en el ejecicio 1, este ejercicio debe emplearse a través de una tarjeta FPGA, por lo que en el siguiente video se puede ver la implementación. 
[Ver video ejercicio 3](../Imagenes%20para%20la%20solucion/ejercicio3prueba.mp4)
