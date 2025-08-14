 # 3.5. Ejercicio5. Unidad aritmética lógica (ALU)
 En este ejercicio deberá diseñar una ALU parametrizable de n bits, como se muestra en la Figura2.
 Dicha unidad deberá tomardos números de n bits como entrada, así como un bus de control,
 denominado ALU Control, que debe permitir seleccionar cuál de las operaciones aplicar. Debe respetar los nombre sindicados en la figura en la interfaz de sumódulo. Las diferentes operaciones que debe realizar la ALU(incluyendo sucódigo de operación en hexadecimal)son:
 0h-and,
 1h-or,
 2h-not(sobreunoperando),
 3h-suma(encomplementoados),
 4h-resta(encomplementoados),
 5h- incrementarenunoeloperando,
 6h-decrementarenunoeloperando,
 7h-xor,
 8h-corrimientoalaizquierdadeloperandoA,
 9h-corrimientoaladerechadeloperandoA.
 ah-corrimientoaritm´eticoalaizquierda,
 bh-máximoentreoperandos→max(A,B)y
 ch-mínimoentreoperandos→min(A,B).

 La bandera de entrada ALUF lag Inrepresenta el acarreo de entrada para la suma y resta, o el
 bit de entrada en los corrimientos hacia la izquierda o derecha. Su funciónes permitir conectar
 2 ALU paraproveer el doble del número de bits en estas operaciones. En las operaciones de
 negación, incremento y decremento, esta bandera selecciona cuál de los operandos utilizar (0
 debe seleccionar al operando A y 1 al operando B). En el resto de operaciones lógicas, esta señal
 es ignorada.
 Para las operaciones de corrimiento a la derecha o la izquierda, el operando adesplazares siempre
 dado por A y cuántos bits a desplazares siempre dado por B.La bandera ALUFlagIn indica con
 qué valor deben rellenarse los nuevos bits introducidos, y la bandera desalida C indica cual fue
 el “último” bit que salió de la ventana representada.
 ## Por ejemplo:
 Para una ALU de 8 bit, si A=110101102, y B=000000112, ALUFlagIn=1,
 entonces,en un desplazamiento a la izquierda el resultado es Y=10110111, con C=0, mientras
 que para un desplazamiento a la derecha el resultado es Y=11111010 con C=1.
 Adicionalmente la ALU deberá generar una bandera de resultado Cero(Z). Dicha bandera es uno
 si el resultado es cero independientemente de la operación lógica o aritmética seleccionada.
 Con base en la descripciónanterior:
 1. Diseñe la ALU con un modelo utilizando SystemVerilog. Parta de los circuitos básicos (sumadores, restadores, decorrimiento,etc.)que con sidere necesarios. Muestre los diagramas debloques, tablas de verdad y circuitos decada módulo en el diseño.
 
2. Realice al menos un testbench de auto-chequeo, usando SystemVerilog, en el que se muestre
 de manera simple el funcionamiento completo de la ALU en 4 bits.

 ## Plantamiento del problema a solucionar
 La idea es diseñar una ALU parametrizable de n bits que reciba A, B, un bus de control ALUControl (4 bits, códigos 0h–Ch) y una bandera ALUFlagIn. 
 Debe producir el resultado Y[n-1:0] de acuerdo a la parametrización establecida en el inicio y las banderas C de acarreo y Z resultado cero. La ALU debe implementar 13 operaciones: AND, OR, NOT (unario), SUMA, RESTA, INC, DEC, XOR, SHIFT-L, SHIFT-R, SHIFT-ARITH-L, MAX, MIN. Por lo cuál debemos de tener presente que los multiplexores deben de poder trabajar con esa cantidad de operaciones. 

 # Tabla de funcionamiento de las operaciones de la ALU.
 Como estamos trabajando con 13 operaciones se emplea el hexadecimal para estos valores y facilitar la implementación.
# Tabla de decodificación de operaciones ALU

| Código (hex) | Operación | Expresión base |
|---|---|---|
| 0h | AND | Y = A & B; C = 0 |
| 1h | OR  | Y = A | B; C = 0 |
| 2h | NOT (unario) | Y = ~OpSel; C = 0 |
| 3h | SUMA | Y = A + B + ALUFlagIn; C = carry_out |
| 4h | RESTA | Y = A - B + ALUFlagIn; C = carry_out* |
| 5h | INC | Y = OpSel + 1; C = carry_out |
| 6h | DEC | Y = OpSel - 1; C = borrow* |
| 7h | XOR | Y = A ^ B; C = 0 |
| 8h | SHIFT-L lógico | Y = A << k (k = B); relleno = ALUFlagIn; C = último bit expulsado |
| 9h | SHIFT-R lógico | Y = A >> k; relleno = ALUFlagIn; C = último bit expulsado |
| Ah | SHIFT-ARITH-L | igual a lógico-izq. para sin signo; C = último bit expulsado |
| Bh | MAX | Y = max(A,B) (sin signo); C = 0 |
| Ch | MIN | Y = min(A,B) (sin signo); C = 0 |

### MUX 2:1 
`Y = S ? D1 : D0`
| S | Y |
|---|---|
| 0 | D0 |
| 1 | D1 |

### Full Adder 1 bit 
Entradas: A, B, Cin → Salidas: S, Cout

| A | B | Cin | S | Cout |
|---|---|-----|---|------|
| 0 | 0 | 0   | 0 | 0    |
| 0 | 0 | 1   | 1 | 0    |
| 0 | 1 | 0   | 1 | 0    |
| 0 | 1 | 1   | 0 | 1    |
| 1 | 0 | 0   | 1 | 0    |
| 1 | 0 | 1   | 0 | 1    |
| 1 | 1 | 0   | 0 | 1    |
| 1 | 1 | 1   | 1 | 1    |


## Unidad de corrimiento expulsado

| Operación | Y  | C  |
|---|---|---|
| SHIFT-L (8h) | Desplaza A a izquierda k, rellena con ALUFlagIn | C = A[N-k] si 1 ≤ k ≤ N, si k = 0 ⇒ 0 |
| SHIFT-R (9h) | Desplaza A a derecha k, rellena con ALUFlagIn | C = A[k-1] si 1 ≤ k ≤ N, si k = 0 ⇒ 0 |
| SHIFT-ARITH-L (Ah) | Igual a SHIFT-L para sin signo | Igual a SHIFT-L |
