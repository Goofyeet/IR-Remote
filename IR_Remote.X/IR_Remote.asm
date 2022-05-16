#define DEBUG 1
    
    
;global registers    
    
.def	    temp =r16	;general temporary register	  

;signal codes
    
.equ	    PreambleH =0xfe
.equ	    PreambleL =0x01
.equ	    PowerH =0xfc
.equ	    PowerL =0x03
.equ	    SpeedH =0xf8    
.equ	    SpeedL =0x07    
.equ	    RotateH =0xec   
.equ	    RotateL =0x13    
.equ	    TimerH =0xf4    
.equ	    TimerL =0x0b    
.equ	    ModeH =0xf0    
.equ	    ModeL =0x0f  
    
;Pushbutton pins
    
#if DEBUG
.equ	    normal =0x1b 
.equ	    SpeedPB =0x13	;PB3
.equ	    RotatePB =0x0b   	;PB4
.equ	    TimerPB =0x1a	;PB0
.equ	    ModePB =0x19	;PB1 
    
#else
.equ	    normal =0x3b
.equ	    PowerPB =0x1b	;PB5 
.equ	    SpeedPB =0x33	;PB3
.equ	    RotatePB =0x2b	;PB4
.equ	    TimerPB =0x3a	;PB0
.equ	    ModePB =0x39	;PB1   
#endif
    
;delays
.equ	    finemark =61
.equ	    finezerospace =192	
.equ	    fineonespace =79	
.equ	    mediummark =1
.equ	    mediumonespace =7	
.equ	    mediumzerospace =1	   
.equ	    finestart =199
.equ	    mediumstart =5
.equ	    fstartdelay =245  
.equ	    mstartdelay =6
.equ	    fBounceDelay =250
.equ	    mBounceDelay =12
    
;toggle
.equ	    togglebit =0b00000100

;toggle register
.def	    invertedbit =r8

;scan routine registers
.def	    fineBounce =r9
.def	    medBounce =r10
.def	    status =r11
.def	    pinscans =r17
.def	    pinstatus =r18 
    
;output routine
.def	    fencodeloop =r12
.def	    medencodeloop =r13        
.def	    encoderbyte =r14    
.def	    encoderbyteH =r15     
.def	    signalH =r19
.def	    signalL =r20 
    
;delay routine
;.def	    carrierloop =r21
.def	    fine =r22
.def	    medium =r23
.def	    finedelay =r24
.def	    mediumdelay =r25
;r26 used for signal loop counter
;r27 used for toggleoutput macro
    
    
;macros
.macro	    toggleoutput    ;toggles output pin
    in @0,PORTB		    ;@0: invertedbit
    ldi @1,@2		    ;@1: r27
    eor @0,@1		    ;@2: togglebit
    out PORTB,@0    
.endmacro    
    
.org 0    
    rjmp    reset	;reset vector
.org 2
    rjmp    scan	;pin change interrupt vector 
    
    
    
;#######################################################################
;			    MAIN routine
;#######################################################################
    
reset:
    ldi temp,0x20
    out GIMSK,temp	;only enables pin change interrupt
    ldi temp,0x04
    out DDRB,temp	;PB2 is only output    
    ldi temp,0x1b	;stores bit mask for enabling input pull-ups
    out	PORTB,temp	;enables input pull-ups
    sbi ACSR,7		;Disables analog comparator
               
main:
    sei			;enable global interrupts
    ldi temp,0x30
    out MCUCR,temp	;enable sleep mode
    sleep		;Tells Microcontroller to enter sleep mode
    rjmp main		;loop over sleep instruction
    
 
/*
#######################################################################
		    pin change interrupt routine
#######################################################################
*/
    
scan:
    in status,SREG	    ;preserve status register
    ser pinscans	    ;set pinscans to 255
    
scan1:    
    in pinstatus,PINB	    ;store PINB register values in pinstatus
    
#if !DEBUG
    cpi pinstatus,PowerPB   ;if only power pb is pushed
    breq sendPower	    ;branch to sendPower
#endif  
 
    cpi pinstatus,SpeedPB   ;if only speed pb is pushed
    breq sendSpeed	    ;branch to sendSpeed
    
    cpi pinstatus,RotatePB   ;if only rotate pb is pushed
    breq sendRotate	     ;branch to sendRotate
    
    cpi pinstatus,TimerPB   ;if only timer pb is pushed
    breq sendTimer	    ;branch to sendTimer
    
    cpi pinstatus,ModePB    ;if only mode pb is pushed
    breq sendMode	    ;branch to sendMode
    
    dec pinscans
    brne scan1
    
    rjmp exit		    ;jump to exit interrupt
    
sendPower:
    ldi signalH,PowerH
    ldi signalL,PowerL
    rcall output
    rjmp exit
     
sendSpeed:
    ldi signalH,SpeedH
    ldi signalL,SpeedL
    rcall output
    rjmp exit
    
sendRotate:
    ldi signalH,RotateH
    ldi signalL,RotateL   
    rcall output
    rjmp exit
    
sendTimer:
    ldi signalH,TimerH
    ldi signalL,TimerL
    rcall output
    rjmp exit
    
sendMode:
    ldi signalH,ModeH
    ldi signalL,ModeL   
    rcall output
    
exit:
    in pinstatus,PINB
    cpi pinstatus,normal
    breq returnInterrupt    
    rjmp exit
    
returnInterrupt:
    out SREG,status	;restore status register 
    reti
    
;*****end of pin scan********************************
    

;********************************************    
;	Output, creates output signal    
;********************************************    
Output:

start:
;9ms high pulse followed by a 4.5ms low pulse
    ldi fine,finestart
    ldi medium,mediumstart
    rcall modulator
    ldi finedelay,fstartdelay
    ldi mediumdelay,mstartdelay
    rcall delay
    
preamble:
;send Preamble: 0xfe01  
    ldi temp,preambleH
    mov encoderbyteH,temp
    ldi temp,preambleL
    mov encoderbyte,temp
    rcall encoder_init
      
;loop 2 times 
    ldi r26,2
code:    
    mov encoderbyteH,signalH
    mov encoderbyte,signalL
    rcall encoder_init
    dec r26
    brne code
    
;send stop bit
stop:
    ldi fine,finemark
    ldi medium,mediummark
    rcall modulator
    ret
    

;start with MSB
;******encoder, encodes each bit of signal*************    
mediumencode:
    ldi temp,8
    mov fencodeloop,temp
    mov encoderbyte,encoderbyteH
    rjmp encoder
    
encoder_init:
    ldi temp,8
    mov fencodeloop,temp
    ldi temp,2
    mov medencodeloop,temp    
    
encoder:
    ror encoderbyte    ;shifts right bit into carry
    
    ldi medium,mediummark
    ldi fine,finemark
    rcall modulator
   
    brcs highbit
    
lowBit:
//if carry is 0
    ldi finedelay,finezerospace
    ldi mediumdelay,mediumzerospace
    rcall delay
    rjmp handleloop
     
highBit:
    ldi finedelay,fineonespace
    ldi mediumdelay,mediumonespace
    rcall delay

    
handleloop:
    dec fencodeloop
    brne encoder
    dec medencodeloop
    brne mediumencode
    ret
      
;delay for low pulse
delay:
    mov temp,finedelay
    mediumloop:
    mov finedelay,temp
    fineloop:
    dec finedelay
    brne fineloop
    dec mediumdelay
    brne mediumloop
    ret
    
;************************************************
;	Modulator, modulates high bits/pulses   
;************************************************
modulator:
    mov temp,fine				;store fine value
    
magain:	  mov fine,temp
    
fagain:   
    toggleoutput invertedbit,r27,togglebit	;toggle output macro
    nop
    nop 
    dec fine
    brne fagain
    dec medium
    brne magain
    ldi temp,0b00011011				;turn off output
    out PORTB,temp
    ret
    
;******end of modulator********************************