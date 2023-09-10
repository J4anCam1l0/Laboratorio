.data
fib_msg: .asciiz "Fibonacci Series:\n"
term_msg: .asciiz "Term "
newline: .asciiz "\n"

.text
.globl main

main:
    # Inicializar los primeros dos términos de Fibonacci
    li $t0, 0    # Término actual (n)
    li $t1, 1    # Siguiente término (n+1)
    li $t2, 10   # Número de términos a calcular
    li $t3, 0    # Contador

    # Imprimir el mensaje de la serie Fibonacci
    la $a0, fib_msg
    li $v0, 4
    syscall

calculate_fibonacci:
    # Imprimir el término actual
    la $a0, term_msg
    li $v0, 4
    syscall
    move $a0, $t0
    li $v0, 1
    syscall
    li $v0, 4
    la $a0, newline
    syscall

    # Calcular el siguiente término de Fibonacci
    add $t4, $t0, $t1   # $t4 = $t0 + $t1
    move $t0, $t1       # Mover $t1 a $t0
    move $t1, $t4       # Mover $t4 a $t1

    # Incrementar el contador
    addi $t3, $t3, 1

    # Comprobar si se han calculado todos los términos
    beq $t3, $t2, exit

    # Volver a calcular el siguiente término de Fibonacci
    j calculate_fibonacci

exit:
    # Salir del programa
    li $v0, 10
    syscall
