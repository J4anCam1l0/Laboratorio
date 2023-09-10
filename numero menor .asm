.data
    prompt1: .asciiz "Ingrese el primer número: "
    prompt2: .asciiz "Ingrese el segundo número: "
    prompt3: .asciiz "Ingrese el tercer número: "
    result: .asciiz "El número más pequeño es: "

.text
.globl main

main:
    # Solicitar el primer número al usuario
    li $v0, 4
    la $a0, prompt1
    syscall
    
    # Leer el primer número
    li $v0, 5
    syscall
    move $t0, $v0

    # Solicitar el segundo número al usuario
    li $v0, 4
    la $a0, prompt2
    syscall

    # Leer el segundo número
    li $v0, 5
    syscall
    move $t1, $v0

    # Solicitar el tercer número al usuario
    li $v0, 4
    la $a0, prompt3
    syscall

    # Leer el tercer número
    li $v0, 5
    syscall
    move $t2, $v0

    # Comparar los números para encontrar el más pequeño
    move $t3, $t0  # $t3 contendrá el número más pequeño inicialmente

    slt $t4, $t1, $t0  # $t4 = 1 si $t1 < $t0, 0 en caso contrario
    beq $t4, $zero, no_menor1

    move $t3, $t1  # Actualizar $t3 si $t1 es más pequeño

no_menor1:
    slt $t4, $t2, $t3  # $t4 = 1 si $t2 < $t3, 0 en caso contrario
    beq $t4, $zero, no_menor2

    move $t3, $t2  # Actualizar $t3 si $t2 es más pequeño

no_menor2:
    # Imprimir el resultado
    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    # Salir del programa
    li $v0, 10
    syscall