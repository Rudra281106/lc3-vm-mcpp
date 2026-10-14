.ORIG x3000

LD R4, row_length ; number of blocks

BRnz DONE  ; stops if row length turns out to be zero or below
TRAP x29  ; gets position (x,y,z) of player and loads contents into register (0,1,2)
ADD R1, R1, #-1  ; y = block under the player's feet
ST R0, start_x  ; remember to start x for the write pass
LD R6, stack_base  ; R6 is the stack pointer


READ    TRAP X2B  ; R3 = to the block id at (x,y,z)
        STR R3, R6, #0  ; push block id
        ADD R6, R6, #1 
        ADD R0, R0, #1  ; increment
        ADD R4, R4, #-1
        BRp READ

        LD R0, start_x  ; restart from the first block
        LD R4, row_length  ; reset the counter



WRITE   ADD R6, R6, #-1  ; pop from stack (last block that was read comes out)
        LDR R3, R6, #0
        TRAP x2C 
        ADD R0, R0, #1
        ADD R4, R4, #-1
        BRp WRITE


DONE    HALT


row_length .FILL #0 ;number of blocks
start_x .FILL #0
stack_base .FILL x4000

.END
        
        

        

