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
![Diagrama del Bloque 1](Imagenes%20para%20el%20planteamiento/3.png)
# Planteamiento de la solución
Diseñar un decodificador 4→7 para display de 7 segmentos que muestre valores hexadecimales (0..F). Donde por medio de los 16 interruptores del la tarjeta Nexy 4 organizarmos en 4 grupos de 4 (cada grupo = un nibble) y, usando 2 botones, seleccionar cuál de las 4 entradas mostrar en el display mediante multiplexado.

## Entradas:
Los interruptores de la NExy 4 que esta bajo el nombre sw[15:0] 
Entonces son 16 interruptores organizados en 4 grupos: sw[3:0], sw[7:4], sw[11:8], sw[15:12])
También contamos con los botones del la tarjeta btn[1:0] de manera que son dos botones.

## Salidas:
La tarjeta trae incluido como periferico un seg[6:0] donde se debe de mostrar por medio de la uluminción de los leds las variables de salida.
Tmabién se debe de tomar en cuenta el an[3:0] (anodos/cátodos de los 4 dígitos si tu display físico), estos se ilumina si es activa la salidaa.

# Tabla de verdad para el 7 segmento. 

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

