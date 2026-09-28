.text 
.global main 

# Specifies entry point to the program [exercise 1, question 3]
main:

    # Reset all the registers to start again
    add $2, $0, $0
    add $3, $0, $0
    # add $1, $0, $0 <- Not sure if this is necessary because of readswitches

    # Jumps to a subroutine to read the switches, links back
    jal readswitches # From lib_ex1

# Specifies the
loop:

    # Stores the switch value of $1 into $5 to keep a copy of it
    add $5, $1, $0

    # Stores the '1' bits of $1 in $3 if there are any, and '0' if not
    andi $3, $1, 1

    # Shifts $1 to the right, and stores the new value in the same register
    srli $1, $1, 1

    # Adds the value of $3 to the count of '1' bits into $4
    add $4, $3, $4

    # Branches to "loop" to repeat the count until $1 has shifted to zero
    bnez $1, loop

# Specifies the section where the values will be encrypted
encrypt:

    # Stores the result of the count of $4 AND the original value of $5 in $2
    andi $2, $4, $5

    # Calls the subroutine to write the final result of $2, links back
    jal writessd  # From lib_ex1

    # Jumps to "main" to repeat the program instructions
    j main


# NOTES:
# 8: 81:    5r1 "51" 
# 7: 184:   11r8 "B8"
# 6: 127:   7r15 "7F"     
# 5: 66:    4r2 "42"
# 4: 73:    4r9 "49"
# 3: 13:    0r13 "0D"
# 2: 107:   6r11 "6B"   
# 1: 112:   7r0 "70"  
# 0: 163:   10r3 "A3" 
# 1010 XOR 0011 = 1001
# 0111 XOR 0000 = 0111
# 0110 XOR 1011 = 1101
# 0000 XOR 1101 = 1101
# 0100 XOR 1001 = 1101
# 0100 XOR 0010 = 0110
# 0111 XOR 1111 = 1000
# 1011 XOR 1000 = 0011
# 0101 XOR 0001 = 0100

# I'm not really sure what to do here, 
# I can't see a relation between all counts and all hex outputs
# Implementing a simple method instead





    








