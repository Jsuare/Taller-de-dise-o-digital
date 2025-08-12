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
La síntesis lógica es el proceso de convertir una descripción de un circuito digital en un lenguaje de descripción de hardware (RTL, como VHDL o Verilog) en una lista de conexiones lógicas (**netlist**) optimizada. Este proceso prepara el diseño para la implementación física, pero la forma en que lo hace difiere significativamente entre ASICs y FPGAs.

### **Síntesis para ASICs**

En el diseño de un **Circuito Integrado para Aplicaciones Específicas (ASIC)**, la síntesis mapea el diseño a una **librería de celdas estándar** fijas. Estas celdas son bloques lógicos básicos (como compuertas y flip-flops) diseñados para una tecnología de fabricación específica. La síntesis optimiza el circuito para minimizar el área, el consumo de energía y el retardo, generando un netlist que luego se utiliza en la etapa de diseño físico (*place and route*) para crear el chip de silicio. El resultado es un chip permanente y no reprogramable.

### **Síntesis para FPGAs**

Para un **Dispositivo Lógico Programable en Campo (FPGA)**, la síntesis mapea el diseño a los recursos fijos del chip, como las **tablas de búsqueda (LUTs)**, los **flip-flops** y otros bloques programables. A diferencia de los ASICs, el hardware físico ya existe. La síntesis genera una *netlist* que describe cómo deben configurarse estos recursos. Finalmente, esta *netlist* se utiliza para crear un archivo de **bitstream**, que es la configuración que se carga en la FPGA para programar su funcionamiento. La principal ventaja es que este proceso es reprogramable, lo que permite modificar el circuito después de su fabricación.
 
 ### 3. Investigue sobre la tecnología de FPGAs. Describa el funcionamiento de la lógica programable en general, así como los componentes básicos de un chip de FPGAs.
 #### Respuesta:
La tecnología de FPGA, la cual sus siglas en ingles significan Field-Programmable Gate Array o en español Matrix de Puertas Programables en Campo, es un dispositivo de lógica programable que permite implementar circuitos digitales personalizados, estos cuentan con las caracteristicas de:
- Flexible
- Reconfigurable
- No requiere la fabricación de un chip específico
Para poderlo entender de la mejor manera, se relizara la comparación de microcontroladores o procesadores vs FPGA:
- Los microcontroladores o procesadores suelen ejecutar instrucciones de un software.
- Las FPGA se configuran físicamente su hardware interno, con el fin de realizar una función lógica concreta, lo que se traduce en un alto paralelismo y baja latencia.

Es imporntante aclarar que la lógica programable se basa en matrices de bloques lógicos y rutas de interconexión, las cuales pueden ser configuradas por el usuario para realizar operaciones lógicas y aritméticas en específico. En el caso de la FPGA, esta configuración se realiza cargando un bitstream, a lo que se refiere a cargar un archivo binario generado por herramientas de síntesis, en su memoria de configuración.

Las FPGA trabajan con los siguientes terminos generales:
- Diseño: el cual el usuario se encarga de describir el comportamiento del circuito. 
- Sínyyesis y Place&Route: Es donde el software traduce la descripción a conexiones físicas y asigna funciones a bloques lógicos e interconexiones.
- Programación: es la encargada que el bitstream se transfiera a la FPGA, configurando la red de lógica interna.
Al momento que la FPGA se haya configurado, logra ejecutar las operaciones de  forma concurrente en hardware, sin necesidad de un ciclo de instrucciones como en un procesador tradicional.

La estructura de la FPGA esta conformada por los siguientes componentes:
- LUTs (Look-Up Tables): es quien se encarga de las pequeñas tablas de verdad programables que implementan funciones lógicas combinacionales.
- Flip-Flops / Registros: es quien se encarga de los elementos secuenciales para almacenar bits y sincronizar señales con un reloj.
- CLBs (Configurable Logic Blocks): es quien se encarga de los bloques que agrupan LUTs, flip-flops y lógica adicional, estos constituyen las unidades básicas de procesamiento del FPGA.
- Matriz de interconexión programable: es quien se encarga de la red de enrutamiento que conecta CLBs, memorias y otros bloques de forma configurable.
- Bloques de memoria (Block RAM): es quien se encarga dela memoria interna de alta velocidad para almacenar datos intermedios o buffers.
- DSP slices: es quien se encarga de las unidades especializadas para operaciones matemáticas de alto rendimiento, ya sean los multiplicadores, sumadores, MAC.
- I/O Blocks (IOBs): es quien se encarga de las interfaces configurables para comunicar el FPGA con el mundo exterior, soportando diferentes estándares de señal.
- PLL/MMCM: es quien se encarga de los módulos para gestión de relojes y generación de frecuencias.

Por estas razones las FPGA son la tecnología que constituye una gran versatilidad si no que también combina la la flexibilidad del software con la velocidad del hardware, haciendo así que su arquitectura modular y reconfigurable sean ideales para adaptarse a las diferentes aplicaciones, como lo pueden ser procesos digitales, comunicaciones, visión por computadora, control de sistemas y prototipado de ASICs.
