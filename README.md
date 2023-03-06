# Programación de E/S en lenguaje arm
**"Manejo de periféricos de E/S en lenguaje arm"**

En este espacio de github se encuentra un ejemplo del libro *"Embedded Systems with ARM CORTEX-M Microcontrollers in Assembly Language and C"*.
El ejemplo fue el 7.11 Example of Converting String to Integer (atoi)

Objetivo de la práctica

* 1.Leer de la entrada estándar los argumentos de un programa que procesa un arreglo.
* 2.Procesar los argumentos de una función.
* 3.Imprimir en la terminal estándar el resultado de una función.


Para desarrollar esta practica del profesor Adán Geovanni Medrano Chávez
# El primer paso fue el desarrollo de un programa en lenguaje C de arreglos.
![image](https://user-images.githubusercontent.com/109257116/222993170-2269c68c-ae85-447a-8e8b-9203c8cc0a4c.png)

Este fue nuestro programa el cual se encuentra en una carpeta en este repositorio.
Para realizar la compilación de este programa base escrito en C.

Este comando es util para la compilación.

 **arm-gcc main.c -S -march=armv7-m -mtune=cortex-m3**
 
Para hacer el ensamble del programa en ensamblador modificado que lee y
escribe desde la terminal estándar.

Este comando es util para ensamblar

 **arm-as main.s -o main.o**
 
Para realizar el enlace del código objeto con la biblioteca estándar se utiliza el comando.El enlace implícito con la biblioteca estándar permite que la función
main pueda ser ejecutada. La opción static indica que el
programa no tiene dependencias con bibliotecas dinámicas.

 **arm-gcc main.o -o main.elf -static**
 
La ejecución del programa se realiza mediante el comando 

**./main.elf.** 

La ejecución también se consigue empleando el comando 
**arm-run main.elf**
donde arm-run es un alias de qemu-static-user.
