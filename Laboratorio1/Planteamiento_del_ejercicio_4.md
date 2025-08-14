# 3.4. Ejercicio 4. Sumador y ruta critica.
En este ejercicio se debe de diseñar un sumador y ruta critica, por lo que el diseño se fundamenta en el sumador completo (full adder)
de 1 bit, el bloque base para cualquier sumador de múltiples bits. Este circuito recibe tres entradas (A, B y Cin) y genera dos salidas:
la suma (S) y el acarreo de salida (Cout).La funcionalidad del full adder se define a partir de su tabla de verdad, que detalla las salidas
para todas las combinaciones posibles de las entradas.

![image1](https://github.com/Jsuare/Taller-de-diseno-digital/blob/a01721797d882ebf84e55ed57a9dd98f21f2da69/Laboratorio1/Imagenes%20para%20el%20planteamiento/pro4fo1.png)
De la tabla de verdad, se obtienen los siguientes diagramas de Karnaugh para el carry-out y para el resultado de la suma:
* Carry out: 

![image](https://github.com/Jsuare/Taller-de-diseno-digital/blob/b8d0a6445d96f669e9b6891b9e9b9d3c24869e79/Laboratorio1/Imagenes%20para%20el%20planteamiento/pro4fo4.png)

```math
C<sub>out</sub> = BC<sub>in</sub> + AC<sub>in</sub> + AB
```

* Suma:

![image](https://github.com/Jsuare/Taller-de-diseno-digital/blob/b8d0a6445d96f669e9b6891b9e9b9d3c24869e79/Laboratorio1/Imagenes%20para%20el%20planteamiento/por4fo3.png)

```math
Suma = A ⊕ B ⊕ C<sub>in</sub>
```
El modelado estructural del 1-bit full adder:

![image](https://github.com/Jsuare/Taller-de-diseno-digital/blob/b8d0a6445d96f669e9b6891b9e9b9d3c24869e79/Laboratorio1/Imagenes%20para%20el%20planteamiento/image.png)

Es posible sintetizar un ripple carry adder utilizando full adders de la siguiente manera:

![image](https://user-images.githubusercontent.com/124763075/219274813-1707b9dc-fd28-4915-90fd-8bff11bee091.png)

Diagrama de bloques del carry look ahead adder

![image](https://user-images.githubusercontent.com/124763075/219274887-975fd4ad-a9c5-4fd3-a7b9-0aee0efdd2c5.png)

Tabla de verdad de la lógica look ahead
	
![image](https://user-images.githubusercontent.com/124763075/219274937-9ff9d9b4-7933-4049-b6f9-68fedce18707.png)

