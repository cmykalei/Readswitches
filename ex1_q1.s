.text 
.global main 

# Specifies entry point to the program [exercise 1, question 1]
main:

    # Jumps to a subroutine to read the switches
    jal readswitches # From lib_ex1

    # Stores the results of the switches in $2
    add $2, $1, $0   

    # Jumps to a subroutine to display the output, links back
    jal writessd  # From lib_ex1

    # Jumps to "main" to repeat the program instructions
    j main

    # NOTES:
    # [FROM 102] 
    # "Call readswitches, that puts the switch values in $1"
    # "Copy $1’s contents into $2, as writessd uses $2"
    # "Call writessd to display value in $2"
    # "Jump back to main to again read and display switches"