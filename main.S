@ Vector table start
.long               0x2000F000                     
.long               _start
@ Vector table end

_start:

loop:
    ADD R0, R0, #1
    ADD R1, R1, #5
b loop
   
.global _start
