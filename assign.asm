#Name: Ibeni Christopher
#MAT NO.: COS/1668/2016
#level: 200 level
#Question : A program to compute the root of a quadratic equation


.data
prompt:.asciiz "\nEnter the value of a\n"
prompt1:.asciiz "Enter the value of b\n"
prompt2:.asciiz "Enter the value of c\n"
msg1:.asciiz "It's a complex number\n"
num:.float 4.0
num1:.float 2.0
msg2:.asciiz "The roots of the values inputed are:\n"
msg3:.asciiz " and "
msg4:.asciiz "The purpose of this  program is to compute the root of a quadratic equation"
msg5:.asciiz "\n \n"

.text
main:

lwc1 $f4 num

lwc1 $f5 num1

li $v0 4
la $a0 msg4
syscall


li $v0 4
la $a0 msg5
syscall

li $v0 4
la $a0 prompt
syscall

li $v0 6
syscall
mov.s $f1 $f0

li $v0 4
la $a0 prompt1
syscall

li $v0 6
syscall
mov.s $f2 $f0

li $v0 4
la $a0 prompt2
syscall

li $v0 6
syscall
mov.s $f3 $f0

jal calculation

li $v0 4
la $a0 msg2
syscall

li $v0 2
mov.s     $f12 $f11 
syscall

li $v0 4
la $a0 msg3
syscall

li $v0 2
mov.s    $f12 $f13 
syscall


b exit
	
calculation:

mul.s   $f30 $f1 $f3
mul.s $f29 $f30 $f4

mul.s $f28 $f2 $f2
sub.s $f27 $f28 $f29

mfc1 $t2 $f27
bltz   $t2 msg

sqrt.s  $f26 $f27

neg.s  $f9 $f2
add.s $f25 $f9 $f26
sub.s $f22 $f9 $f26
mul.s $f8 $f5 $f1
div.s  $f11 $f25 $f8
div.s  $f13 $f22 $f8
jr $ra
msg:
li $v0 4
la $a0 msg1
syscall

exit:
li $v0 10
syscall
