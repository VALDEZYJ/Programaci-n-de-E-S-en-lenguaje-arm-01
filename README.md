Autores:

*EDUARDO GONZALEZ GONZALEZ

*ALEJANDRO MARTINEZ GUZMAN

*YOSHUA J. VALDEZ HERNANDEZ

# Programación de E/S en lenguaje arm
**"Manejo de periféricos de E/S en lenguaje arm"**

En este espacio de github se encuentra un ejemplo del libro *"Embedded Systems with ARM CORTEX-M Microcontrollers in Assembly Language and C"*.
El ejemplo fue el 7.11 Example of Converting String to Integer (atoi)

Objetivo de la práctica:

* Leer de la entrada estándar los argumentos de un programa que procesa un arreglo.
* Procesar los argumentos de una función.
* Imprimir en la terminal estándar el resultado de una función.


 
#Desarrollo de un programa en lenguaje C que procesa arreglos.
![image](https://user-images.githubusercontent.com/109257116/222993170-2269c68c-ae85-447a-8e8b-9203c8cc0a4c.png)

Este fue nuestro programa el cual se encuentra en una carpeta en este repositorio.

Para realizar el ensamble de este programa escrito en C.

Este comando es útil:

 >#**arm-gcc main.c -S -march=armv7-m -mtune=cortex-m3**
 
Para convertir el código ensamblador a código objeto 

Este comando es útil:

 >#**arm-as main.s -o main.o**
 
Para realizar el enlace del código objeto con la biblioteca estándar se utiliza el comando.

El enlace implícito con la biblioteca estándar permite que la función
main pueda ser ejecutada. La opción static indica que el
programa no tiene dependencias con bibliotecas dinámicas.

 >#**arm-gcc main.o -o main.elf -static**
 
La ejecución del programa se realiza mediante el comando 

>#**./main.elf.** 

La ejecución también se consigue empleando el comando 
>#**arm-run main.elf**
donde arm-run es un alias de qemu-static-user.

# Marcos correspondientes a las funciones usadas 
![image](https://user-images.githubusercontent.com/109257116/223004987-c17c2d8b-076a-45dd-8412-d1858ec4d804.png)

# Funcionamiento 

*El funcionamiento de este programa consiste en recibir una cadena de números enteros mediante un llamado al sistema, la cadena es procesada y convertida en ASCII. 
La salida se refleja en la terminal gracias a la función "Display" que recibe el arreglo convertido en ASCII y lo imprime como salida.*

