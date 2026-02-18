addi x1, x0, 5 # n = 5
addi x10, x0, 1 # result = 1

loop:
    ble x1, x0, loop_end
    mul x10, x10, x1 # result = result * n
    addi x1, x1, -1 # n = n - 1
    jal x0, loop

loop_end:

end:
    j end


