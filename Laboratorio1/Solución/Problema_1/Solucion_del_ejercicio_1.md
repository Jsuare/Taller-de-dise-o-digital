# 3.1. Ejercicio 1. Switches, botones y LEDs
 1. Diseñe un módulo que reciba como entradas las señales producidas por los 16 interruptores disponibles en la tarjeta con FPGA que se utilizará en el curso.
 2. Las salidas del módulo se mostrarán en los 16 LEDs disponibles en la tarjeta de desarrollo.
 3. El bloque a desarrollar debe subdividir los 16 interruptores en 4 grupos de 4. Lo mismo aplica para los LEDs. Cada grupo de 4 interruptores estará gobernado por un botón (push button) diferente en la tarjeta. De esta manera, al presionar un botón, el grupo de LEDs correspondiente se mantendrá apagado sin importar la combinación de interruptores del grupo asignado (los otros grupos no deben ser afectados).
 4. Implemente un banco de pruebas (testbench) para validar el funcionamiento de su diseño. Realice su validación a nivel post-síntesis.
 5. Realice una validación de su diseño en la tarjeta con FPGA.

## Objetivo a realizar.
Diseñar e implementar un módulo digital utilizando una tarje FPGA: Nexys 4, que permita controlar 16 LEDs mediante 16 interruptores, teniendo en cuenta el bloqueo de ciertos grupos de led de acuerdo a las especificaciones dadas.

## Planteamiento de la solución. 
Al trabajar con una tarjeta de desarrollo Nexys 4, la cual tiene integrada una FPGA modelo Artix-7 en conjunto con una serie de elementos perífericos que permiten que tengas a nuestra disposición el set de ledes e interrutores para este trabajo. 
Podemos determinar según la hoja de datos de está que tenemos:
    1. 16 interruptores enumerados del SW0 al SW15
    2. 16 LEDs enumerados del LD0 al LD15
    3. 4 botones enumerados del BTN0 al BTN3

Por lo que podemos establecer 4 grupos de 16 ledes controlados bajo un solo botón para el apagado permanente, mientras que cada uno de los ledes trendrá un variación de acuerdo con los interrutores establecido para cada led. 
## Requerimiento. 
El módulo es establecera como un receptor donde recibe la señal de 16 interruptores para apagar y encender los ledes correspondientes a este interruptor. De manera que a través de la luz del led podamos verificar el estado de lso interruptores en sus 16 ledes correspondientes.
Al mismo tiempo se debe de establecer 4 grupos de ledes con sus 4 interruptores de manera que podemos seguir utilizando la nomeclatura del la hoja de datos de la tarjeta. 

### Subdividir los 16 interruptores en 4 grupos de 4:
Grupo 1 será interruptores de SW0 a SW3
Grupo 2 será interruptores de SW4 a SW7
Grupo 3 será interruptores de SW8 a SW11
Grupo 4 será interruptores de SW12 a SW15

### Subdividir los 16 LEDs en los mismos 4 grupos de 4 LEDs, correspondientes a cada grupo de interruptores.
Entonces tenemos 4 grupos de 4 interruptores con 4 ledes cada uno, cada grupo será controlado por un boton especifico del BTN0 al BTN3, si se presiona un boton este grupo de leds se mantiene apagando sin importar en que posición este los interruptores de este grupo. Mientras los otros sets de ledes seguiran su comportamiento normal regido por sus interruptores y sus botones cabeceros no activos. 
De esto con cada grupo establecido teniendo en jeraquía principal el boton, seguido por el interruptor y esto reflejado en el boton. 

# Solución del ejercicio.

Se establecio el siguiente codigo para determinar el funcionamiento de los ledes estos reflejaran el valor dado por la combinación de switch, pero tendrá por jeraquía que si el boton de cabecera se activa este grupo de ledes permanecera apagados por el periodo de tiempo que el botón este precionado. El codigo top para el ejercicio es el siguiente:
Como se puede observar se utilizo el medio del las condicionales if para determinar si se debe de apagar o no, mientras que se establece como definido la codificación de los switch para representarse por los leds.

## Realización del testbech.
Al igual que todos los problemas se establecio un tb para verificar su funcionamiento, acontinuación se detalla la función de este:
![Prueba 1](../Imagenes%20para%20la%20solucion/prueba1.png)

Como vemos en la simulación el boton 0 esta activo por lo que los leds estan apagados completamente, mientras que en los otros tres bloques se ve la representación de los switch, sin importar el orden. 
# Prueba completa.
![Simulación completa](../Imagenes%20para%20la%20solucion/Simulacióncompleta.png)

Está prueba es más vizual por lo que se aplicará en una tarjeta FPGA para logra completar el funcionamiento completo del ejercicio. 
Acontinuación se muestra un video de como se realizó la prueba:
[Ver video de pruebas finales](../Imagenes%20para%20la%20solucion/Pruebasfinales.mp4)
