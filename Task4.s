# C- Code:
# int power(int base, int exp) {
#     if (exp == 0) return 1;
#     return base * power(base, exp - 1);
# }

main:
    addi, x10, x0, 2 # base = 2
    addi x11, x0, 3 # exp = 3
    jal x1, power
    j end

power:
    addi sp, sp, -8      # adjust stack for 2 items
    sw   x1, 4(sp)       # return address 
    sw   x10, 0(sp)      # base

    bne x11, x0, recursion
    addi x10, x0, 1      # Return 1 
    lw   x1, 4(sp) 
    addi sp, sp, 8       # Pop stack 
    jalr x0, 0(x1)       # Return 

recursion:
    addi x11, x11, -1 # exp = exp -1 
    jal  x1, power 

    lw   x5, 0(sp)       # Restore original base into x5 
    lw   x1, 4(sp)       # Restore return address 
    addi sp, sp, 8       # Pop stack

    mul  x10, x10, x5    # result = current_result * base
    jalr x0, 0(x1)       # Return to caller 

end:
    j end

