.text
.globl main
main:
    #Initialize array
    addi x12, x0, 0x100 # base address of array 
    addi x11, x0, 5     #sizeof = 5 

    #storing values in array

    addi x5, x0, 3
    sw x5, 0(x12)

    addi x5, x0, 4
    sw x5, 4(x12)

    addi x5, x0, 5
    sw x5, 8(x12)

    addi x5, x0, 6
    sw x5, 12(x12)

    addi x5, x0, 7
    sw x5, 16(x12)

    # a (base address)-> x10, len -> x11
    addi x10, x12, 0  # base address in x10
    addi x11, x0, 5    # len in x11 

#BUBBLE SORT
bubble:
    # if a == null or len == 0 
    beq  x10, x0, Exit
    beq  x11, x0, Exit

    # i = 0 
    addi x5, x0, 0           

outer_loop:
    # for (i = 0; i < len; i++)
    bge  x5, x11, Exit       
    
    # j = i initialize
    addi x6, x5, 0      

inner_loop:
    # for (j = i; j < len; j++) 
    bge  x6, x11, next_i     

    # address of a[i] -> x7
    slli x7, x5, 2           # i * 4
    add  x7, x7, x10         # address = base + offset
    
    # address of a[j] -> x28
    slli x28, x6, 2          # j * 4
    add  x28, x28, x10       # address of a[j]

    #load c[i] and c[i-1]
    lw   x29, 0(x7)          # x29 = a[i]
    lw   x30, 0(x28)         # x30 = a[j]


    # if (a[i] < a[j]), then swap 
    bge  x29, x30, next_j   

    #SWAP
    addi x31, x29, 0         # int temp = a[i]; 
    sw   x30, 0(x7)          # a[i] = a[j]; 
    sw   x31, 0(x28)         # a[j] = temp;

next_j:
    addi x6, x6, 1           # j++
    j    inner_loop          # continue

next_i:
    addi x5, x5, 1           # i++
    j    outer_loop          # continue

Exit:
end:
    j end