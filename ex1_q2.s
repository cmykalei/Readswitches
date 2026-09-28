.text 
.global main 

# Specifies entry point to the program [exercise 1, question 2]
main:

    # Reset all the registers to start again
    add $2, $0, $0
    add $3, $0, $0
    # add $1, $0, $0 <- Not sure if this is necessary because of readswitches

    # Jumps to a subroutine to read the switches, links back
    jal readswitches # From lib_ex1

loop:

    # Stores the '1' bits of $1 in $3 if there are any, and zero's if not
    andi $3, $1, 1

    # Shifts $1 to the right, and stores the new value in the same register
    srli $1, $1, 1

    # Adds the value of $3 to the count of '1' bits into $2
    add $2, $3, $2

    # Branch to "loop" to repeat the count until $1 has shifted to zero
    bnez $1, loop

    # Call the subroutine to write the final result of $2, links back
    jal writessd  # From lib_ex1

    # Jumps to "main" to repeat the program instructions
    j main

    # NOTES:
    # Call readswitches, that puts the switch values in $1
    # Use logical AND to store the '1' bits of $1 in $3 >>>>
    # If [ 00000001 AND xxxxxxxx == 0001 ] then add 'immediate 1' to count in $2
    # If [ 00000001 AND xxxxxxxx == 0000 ] then don't add to count
    # Shift $3 by '1' and branch to loop until $3 is complete [00000000]
    # Call writessd to display value in $2
    # Jump back to main to again read switches
    # Reset the registers to $0 to start a new count