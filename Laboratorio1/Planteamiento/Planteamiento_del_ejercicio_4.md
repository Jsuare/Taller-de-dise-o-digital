# 3.4. Ejercicio 4. Sumador y ruta critica.
En este ejercicio se debe de diseñar un sumador y ruta critica, por lo que el diseño se fundamenta en el sumador completo (full adder)
de 1 bit, el bloque base para cualquier sumador de múltiples bits. Este circuito recibe tres entradas (A, B y Cin) y genera dos salidas:
la suma (S) y el acarreo de salida (Cout).La funcionalidad del full adder se define a partir de su tabla de verdad, que detalla las salidas
para todas las combinaciones posibles de las entradas.

![image1](https://github.com/Jsuare/Taller-de-diseno-digital/blob/a01721797d882ebf84e55ed57a9dd98f21f2da69/Laboratorio1/Imagenes%20para%20el%20planteamiento/pro4fo1.png)

De la tabla de verdad, se obtienen los siguientes diagramas de Karnaugh para el carry-out y para el resultado de la suma:
## Carry out: 

![image](https://github.com/Jsuare/Taller-de-diseno-digital/blob/b8d0a6445d96f669e9b6891b9e9b9d3c24869e79/Laboratorio1/Imagenes%20para%20el%20planteamiento/pro4fo4.png)

```math
C<sub>out</sub> = BC<sub>in</sub> + AC<sub>in</sub> + AB
```

## Suma:

![image](https://github.com/Jsuare/Taller-de-diseno-digital/blob/b8d0a6445d96f669e9b6891b9e9b9d3c24869e79/Laboratorio1/Imagenes%20para%20el%20planteamiento/por4fo3.png)

```math
Suma = A ⊕ B ⊕ C<sub>in</sub>
```
## El modelado estructural del 1-bit full adder: 
El diseño final del circuito se puede representar a través de un diagrama estructural, que muestra la interconexión de las compuertas lógicas.

![image](https://github.com/Jsuare/Taller-de-diseno-digital/blob/d2aadbd094e578079cb43d001a9c68b67ab62ae5/Laboratorio1/Imagenes%20para%20el%20planteamiento/Imagen6.png)

Usando el diseño anterior, podemos crear un ripple carry adder que se vea de la siguiente forma.

![image](https://github.com/Jsuare/Taller-de-diseno-digital/blob/6fad5de37fcf9668571f66ee5b99f92eafc55bb8/Laboratorio1/Imagenes%20para%20el%20planteamiento/image.png)

