.data
    num1:  .word 10        # Primer número
    num2:  .word 20        # Segundo número
    num3:  .word 15        # Tercer número
    max_num: .word 0       # Variable para almacenar el número mayor

.text
.globl main

main:
    # Cargar los tres números en registros
    lw $t0, num1
    lw $t1, num2
    lw $t2, num3

    # Comparar $t0 y $t1 para encontrar el mayor entre num1 y num2
    bgt $t0, $t1, num1_greater

    # Si $t1 es mayor o igual que $t0, almacenar $t1 en max_num
    sw $t1, max_num
    j compare_num3

num1_greater:
    # Si $t0 es mayor que $t1, almacenar $t0 en max_num
    sw $t0, max_num

compare_num3:
    # Comparar max_num (el mayor de num1 y num2) con num3
    lw $t3, max_num
    bgt $t3, $t2, print_max_num

    # Si $t2 es mayor o igual que max_num, almacenar $t2 en max_num
    sw $t2, max_num

print_max_num:
    # En este punto, $t2 contiene el número mayor
    # Puedes imprimirlo o usarlo según tus necesidades
    # Por ejemplo, aquí se imprime en la pantalla

    li $v0, 1           # Código 1 es para imprimir entero
    lw $a0, max_num     # Cargar max_num en $a0
    syscall

    # Terminar el programa
    li $v0, 10          # Código 10 es para salir del programa
    syscall

.data
    # Espacio de almacenamiento para max_num
    .space 4