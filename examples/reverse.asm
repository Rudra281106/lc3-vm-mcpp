.ORIG x3000

LD R4, row_length

brNZ DONE
TRAP x29
ADD R1, R1 # -1
ST R0, START_X
LD R6, STACK_BASE


READ    TRAP X28
        STR R3, R6, #0 
        
        

