;Hand Assembled Blink by KC7MMI

.dw 0b1110111100001111	;ldi r16, $ff     ;load all 1's into r16
.dw 0b1011100100000100	;out $04, r16     ;DDRB to output
.dw 0b1110001000010000	;ldi r17, $20     ;load 1 into 5th bit of r17
.dw 0b0010111100000001	;mov r16, r17     ;copy r17 to r16
.dw 0b1011100100000101	;out $05, r16     ;PORTB5 high (LED on)
.dw 0b1110000100101111	;ldi r18, $1f     ;initialize counter to 31
.dw 0b1110111110011111	;ldi r25, $ff     ;initialize 16-bit prescaler to 65535
.dw 0b1110111110001111	;ldi r24, $ff     ;''
.dw 0b1001011100000001	;sbiw r25:r24, 1  ;decrement prescaler by 1
.dw 0b1111011111110001	;brne PC-1        ;loop until prescaler 0
.dw 0b1001010100101010	;dec cntr         ;decrement counter by 1
.dw 0b1111011111010001	;brne PC-5        ;loop until counter 0
.dw 0b0010011100000001	;eor r16, r17     ;xor compare between r16 & r17, output to r16
.dw 0b1100111111110110	;rjmp PC-9        ;loop to step 5 where r16 is loaded to output register
