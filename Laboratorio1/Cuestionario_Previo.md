#  Lab. 1: Introducción al diseño digital con HDL y herramientas EDA de síntesis
## Cuestionario previo
 Para el desarrollo de este laboratorio se deben responder las siguientes preguntas.
 ### 1. Explique qué es el modelado de comportamiento y de estructura en diseño digital. Brinde un ejemplo de cada uno empleando SystemVerilog.
 #### Respuesta:
 El modelado de comportamiento y modelado estructural de un diseño digital basándonos en la estructura del lenguaje de systemVerilog, primero demos de detallar qué es el lenguaje de programación systemVerilog, este es un lenguaje descripción y verificación de hardware bajo las siglas HDVL (Hardware Description and Verification Language), Que extiende a Verilog el cual es uno de los lenguajes de verificación de circuitos integrados más utilizados a nivel global. De esta manera podemos describir un circuito lógico hasta un procesador para una síntesis en FPGA, como también a su vez verificar que el hardware funciona correctamente mediante terstbench. 
 Este es la versión mejorada o más actualizada del lenguaje verilog, el cual no sólo sirve para diseñar, sino que también comprueba el funcionamiento de manera más eficiente y nos da más accesos a los desarrollos de las FPGA más actuales, por lo cual su uso será de suma importancia en este laboratorio.
Teniendo esto en claro pasamos a la descripción del modelado de diseños, este por medio de un diseño digital con HDL bajo el lenguaje de systemverilog el cual nos va a permitir a través de varios niveles de abstracción describir un circuito lógico, Dónde podemos tomar dos flujos de diseño como los son el modelado de comportamiento o el modelado estructural.

El modelado de comportamiento es la descripción del circuito a través de su función lógica y su operación en un tiempo definido, no es necesario especificar cómo está compuesto físicamente o cuáles conexiones se debe tener, es decir, es un modelo por medio de bloques donde sólo define qué va a hacer el circuito.

El modelo estructural es la descripción del circuito incluyendo sus componentes básicos y las interconexiones necesarias para ejecutar una instrucción, es como tomar un diagrama esquemático bajo el lenguaje de systemverilog. En este podemos presentar con puertas lógicas, sumadores, registros, multiplexores, entre otros componentes y como anteriormente se dijo sus Conexiones explícitas para cada señal y cada componente.

Por lo cual podemos ver que ambos diseños o ambos modelados van de la mano con la diferencia de que en uno presentamos un nivel de abstracción más alto y rápido cómo es en el modelo de comportamiento mientras que el modelado estructural es un control sobre hardware más específico y alto, y su uso es típicamente relacionado a los integrados de módulos y síntesis controlada.

 ### 2. Explique el proceso de síntesis lógica en el diseño de circuitos digitales, tanto para el desarrollo de un ASIC como para una FPGA.
 #### Respuesta:
 ### 3. Investigue sobre la tecnología de FPGAs. Describa el funcionamiento de la lógica programable en general, así como los componentes básicos de un chip de FPGAs.
 #### Respuesta:
