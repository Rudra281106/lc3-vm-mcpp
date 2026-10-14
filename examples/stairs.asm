.ORIG x3000


LD R4, height ;loading height into r4, which is also used as a loop
TRAP x29     ; Puts player's position (x,y,z) into registers (0,1,2)


ADD R0, R0, #1 ; increases player position.x by one
ADD R1, R1, #1 ; increases player position.y by one
AND R3, R3, #0 ; clears R3
ADD R3, R3, #1 ; load R3 with one



LOOP    TRAP x2C ; place stone at position in register (0,1,2)
        ADD R0, R0, #1 ; increment to next step
        ADD R1, R1, #1  ; increment to next step
        ADD R4, R4, #-1 ; one fewer block to place
        BRp LOOP


HALT


height  .FILL #4 ; label for stairway height
.END



