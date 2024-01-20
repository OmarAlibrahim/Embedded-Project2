
_main:

;ATRESSUBMIT.c,27 :: 		void main() {
;ATRESSUBMIT.c,29 :: 		STATUS = STATUS | 0x20;//Bank1
	BSF        STATUS+0, 5
;ATRESSUBMIT.c,30 :: 		TRISB = 0xFF; // Set PORTB as input
	MOVLW      255
	MOVWF      TRISB+0
;ATRESSUBMIT.c,31 :: 		PORTB = 0x00; // Clear PORTB
	CLRF       PORTB+0
;ATRESSUBMIT.c,32 :: 		TRISC = 0x00;//PORTC is output
	CLRF       TRISC+0
;ATRESSUBMIT.c,33 :: 		TRISD = 0X00;//PORTD is output
	CLRF       TRISD+0
;ATRESSUBMIT.c,34 :: 		TRISA = 0x01;//PRA0 is input PRA1-PRA7 is output
	MOVLW      1
	MOVWF      TRISA+0
;ATRESSUBMIT.c,35 :: 		STATUS = STATUS | 0xDF;//Bank0
	MOVLW      223
	IORWF      STATUS+0, 1
;ATRESSUBMIT.c,37 :: 		init_sonar();
	CALL       _init_sonar+0
;ATRESSUBMIT.c,38 :: 		while (1) {
L_main0:
;ATRESSUBMIT.c,39 :: 		Rotation0();
	CALL       _Rotation0+0
;ATRESSUBMIT.c,40 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;ATRESSUBMIT.c,41 :: 		for(i = 0; i < 20;i++)
	CLRF       _i+0
	CLRF       _i+1
L_main3:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main162
	MOVLW      20
	SUBWF      _i+0, 0
L__main162:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;ATRESSUBMIT.c,42 :: 		{DCmotor_forward();}
	CALL       _DCmotor_forward+0
;ATRESSUBMIT.c,41 :: 		for(i = 0; i < 20;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,42 :: 		{DCmotor_forward();}
	GOTO       L_main3
L_main4:
;ATRESSUBMIT.c,43 :: 		read_sonar();
	CALL       _read_sonar+0
;ATRESSUBMIT.c,44 :: 		if (Distance < 10) {
	MOVLW      0
	SUBWF      _Distance+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main163
	MOVLW      0
	SUBWF      _Distance+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main163
	MOVLW      0
	SUBWF      _Distance+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main163
	MOVLW      10
	SUBWF      _Distance+0, 0
L__main163:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;ATRESSUBMIT.c,46 :: 		for (i = 0; i < 65; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main7:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main164
	MOVLW      65
	SUBWF      _i+0, 0
L__main164:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;ATRESSUBMIT.c,47 :: 		stepper_bullet1();
	CALL       _stepper_bullet1+0
;ATRESSUBMIT.c,46 :: 		for (i = 0; i < 65; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,48 :: 		}      for (i = 0; i < 130; i++) {
	GOTO       L_main7
L_main8:
	CLRF       _i+0
	CLRF       _i+1
L_main10:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main165
	MOVLW      130
	SUBWF      _i+0, 0
L__main165:
	BTFSC      STATUS+0, 0
	GOTO       L_main11
;ATRESSUBMIT.c,49 :: 		stepper_bullet2();
	CALL       _stepper_bullet2+0
;ATRESSUBMIT.c,48 :: 		}      for (i = 0; i < 130; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,50 :: 		}
	GOTO       L_main10
L_main11:
;ATRESSUBMIT.c,51 :: 		}
L_main6:
;ATRESSUBMIT.c,52 :: 		for(i = 0; i < 20;i++)
	CLRF       _i+0
	CLRF       _i+1
L_main13:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main166
	MOVLW      20
	SUBWF      _i+0, 0
L__main166:
	BTFSC      STATUS+0, 0
	GOTO       L_main14
;ATRESSUBMIT.c,53 :: 		{DCmotor_forward();}
	CALL       _DCmotor_forward+0
;ATRESSUBMIT.c,52 :: 		for(i = 0; i < 20;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,53 :: 		{DCmotor_forward();}
	GOTO       L_main13
L_main14:
;ATRESSUBMIT.c,54 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	DECFSZ     R11+0, 1
	GOTO       L_main16
	NOP
	NOP
;ATRESSUBMIT.c,55 :: 		Rotation45();
	CALL       _Rotation45+0
;ATRESSUBMIT.c,56 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	DECFSZ     R11+0, 1
	GOTO       L_main17
	NOP
	NOP
;ATRESSUBMIT.c,57 :: 		read_sonar();
	CALL       _read_sonar+0
;ATRESSUBMIT.c,58 :: 		if (Distance <10) {
	MOVLW      0
	SUBWF      _Distance+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main167
	MOVLW      0
	SUBWF      _Distance+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main167
	MOVLW      0
	SUBWF      _Distance+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main167
	MOVLW      10
	SUBWF      _Distance+0, 0
L__main167:
	BTFSC      STATUS+0, 0
	GOTO       L_main18
;ATRESSUBMIT.c,60 :: 		for (i = 0; i < 65; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main19:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main168
	MOVLW      65
	SUBWF      _i+0, 0
L__main168:
	BTFSC      STATUS+0, 0
	GOTO       L_main20
;ATRESSUBMIT.c,61 :: 		stepper_bullet1();
	CALL       _stepper_bullet1+0
;ATRESSUBMIT.c,60 :: 		for (i = 0; i < 65; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,62 :: 		}
	GOTO       L_main19
L_main20:
;ATRESSUBMIT.c,63 :: 		for (i = 0; i < 130; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main22:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main169
	MOVLW      130
	SUBWF      _i+0, 0
L__main169:
	BTFSC      STATUS+0, 0
	GOTO       L_main23
;ATRESSUBMIT.c,64 :: 		stepper_bullet2();
	CALL       _stepper_bullet2+0
;ATRESSUBMIT.c,63 :: 		for (i = 0; i < 130; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,65 :: 		}
	GOTO       L_main22
L_main23:
;ATRESSUBMIT.c,66 :: 		}
L_main18:
;ATRESSUBMIT.c,67 :: 		for(i = 0; i < 20;i++)
	CLRF       _i+0
	CLRF       _i+1
L_main25:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main170
	MOVLW      20
	SUBWF      _i+0, 0
L__main170:
	BTFSC      STATUS+0, 0
	GOTO       L_main26
;ATRESSUBMIT.c,68 :: 		{DCmotor_forward();}
	CALL       _DCmotor_forward+0
;ATRESSUBMIT.c,67 :: 		for(i = 0; i < 20;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,68 :: 		{DCmotor_forward();}
	GOTO       L_main25
L_main26:
;ATRESSUBMIT.c,69 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main28:
	DECFSZ     R13+0, 1
	GOTO       L_main28
	DECFSZ     R12+0, 1
	GOTO       L_main28
	DECFSZ     R11+0, 1
	GOTO       L_main28
	NOP
	NOP
;ATRESSUBMIT.c,70 :: 		Rotation90();
	CALL       _Rotation90+0
;ATRESSUBMIT.c,71 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main29:
	DECFSZ     R13+0, 1
	GOTO       L_main29
	DECFSZ     R12+0, 1
	GOTO       L_main29
	DECFSZ     R11+0, 1
	GOTO       L_main29
	NOP
	NOP
;ATRESSUBMIT.c,72 :: 		read_sonar();
	CALL       _read_sonar+0
;ATRESSUBMIT.c,73 :: 		if (Distance < 10) {
	MOVLW      0
	SUBWF      _Distance+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main171
	MOVLW      0
	SUBWF      _Distance+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main171
	MOVLW      0
	SUBWF      _Distance+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main171
	MOVLW      10
	SUBWF      _Distance+0, 0
L__main171:
	BTFSC      STATUS+0, 0
	GOTO       L_main30
;ATRESSUBMIT.c,75 :: 		for (i = 0; i < 65; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main31:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main172
	MOVLW      65
	SUBWF      _i+0, 0
L__main172:
	BTFSC      STATUS+0, 0
	GOTO       L_main32
;ATRESSUBMIT.c,76 :: 		stepper_bullet1();
	CALL       _stepper_bullet1+0
;ATRESSUBMIT.c,75 :: 		for (i = 0; i < 65; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,77 :: 		}
	GOTO       L_main31
L_main32:
;ATRESSUBMIT.c,78 :: 		for (i = 0; i < 130; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main34:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main173
	MOVLW      130
	SUBWF      _i+0, 0
L__main173:
	BTFSC      STATUS+0, 0
	GOTO       L_main35
;ATRESSUBMIT.c,79 :: 		stepper_bullet2();
	CALL       _stepper_bullet2+0
;ATRESSUBMIT.c,78 :: 		for (i = 0; i < 130; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,80 :: 		}
	GOTO       L_main34
L_main35:
;ATRESSUBMIT.c,81 :: 		}
L_main30:
;ATRESSUBMIT.c,82 :: 		for(i = 0; i < 20;i++)
	CLRF       _i+0
	CLRF       _i+1
L_main37:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main174
	MOVLW      20
	SUBWF      _i+0, 0
L__main174:
	BTFSC      STATUS+0, 0
	GOTO       L_main38
;ATRESSUBMIT.c,83 :: 		{DCmotor_forward();}
	CALL       _DCmotor_forward+0
;ATRESSUBMIT.c,82 :: 		for(i = 0; i < 20;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,83 :: 		{DCmotor_forward();}
	GOTO       L_main37
L_main38:
;ATRESSUBMIT.c,84 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main40:
	DECFSZ     R13+0, 1
	GOTO       L_main40
	DECFSZ     R12+0, 1
	GOTO       L_main40
	DECFSZ     R11+0, 1
	GOTO       L_main40
	NOP
	NOP
;ATRESSUBMIT.c,85 :: 		Rotation135();
	CALL       _Rotation135+0
;ATRESSUBMIT.c,86 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main41:
	DECFSZ     R13+0, 1
	GOTO       L_main41
	DECFSZ     R12+0, 1
	GOTO       L_main41
	DECFSZ     R11+0, 1
	GOTO       L_main41
	NOP
	NOP
;ATRESSUBMIT.c,87 :: 		read_sonar();
	CALL       _read_sonar+0
;ATRESSUBMIT.c,88 :: 		if (Distance < 10) {
	MOVLW      0
	SUBWF      _Distance+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main175
	MOVLW      0
	SUBWF      _Distance+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main175
	MOVLW      0
	SUBWF      _Distance+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main175
	MOVLW      10
	SUBWF      _Distance+0, 0
L__main175:
	BTFSC      STATUS+0, 0
	GOTO       L_main42
;ATRESSUBMIT.c,90 :: 		for (i = 0; i < 65; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main43:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main176
	MOVLW      65
	SUBWF      _i+0, 0
L__main176:
	BTFSC      STATUS+0, 0
	GOTO       L_main44
;ATRESSUBMIT.c,91 :: 		stepper_bullet1();
	CALL       _stepper_bullet1+0
;ATRESSUBMIT.c,90 :: 		for (i = 0; i < 65; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,92 :: 		}
	GOTO       L_main43
L_main44:
;ATRESSUBMIT.c,93 :: 		for (i = 0; i < 130; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main46:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main177
	MOVLW      130
	SUBWF      _i+0, 0
L__main177:
	BTFSC      STATUS+0, 0
	GOTO       L_main47
;ATRESSUBMIT.c,94 :: 		stepper_bullet2();
	CALL       _stepper_bullet2+0
;ATRESSUBMIT.c,93 :: 		for (i = 0; i < 130; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,95 :: 		}
	GOTO       L_main46
L_main47:
;ATRESSUBMIT.c,96 :: 		}
L_main42:
;ATRESSUBMIT.c,97 :: 		for(i = 0; i < 20;i++)
	CLRF       _i+0
	CLRF       _i+1
L_main49:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main178
	MOVLW      20
	SUBWF      _i+0, 0
L__main178:
	BTFSC      STATUS+0, 0
	GOTO       L_main50
;ATRESSUBMIT.c,98 :: 		{DCmotor_forward();}
	CALL       _DCmotor_forward+0
;ATRESSUBMIT.c,97 :: 		for(i = 0; i < 20;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,98 :: 		{DCmotor_forward();}
	GOTO       L_main49
L_main50:
;ATRESSUBMIT.c,99 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main52:
	DECFSZ     R13+0, 1
	GOTO       L_main52
	DECFSZ     R12+0, 1
	GOTO       L_main52
	DECFSZ     R11+0, 1
	GOTO       L_main52
	NOP
	NOP
;ATRESSUBMIT.c,100 :: 		Rotation180();
	CALL       _Rotation180+0
;ATRESSUBMIT.c,101 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main53:
	DECFSZ     R13+0, 1
	GOTO       L_main53
	DECFSZ     R12+0, 1
	GOTO       L_main53
	DECFSZ     R11+0, 1
	GOTO       L_main53
	NOP
	NOP
;ATRESSUBMIT.c,102 :: 		read_sonar();
	CALL       _read_sonar+0
;ATRESSUBMIT.c,103 :: 		if (Distance < 10) {
	MOVLW      0
	SUBWF      _Distance+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main179
	MOVLW      0
	SUBWF      _Distance+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main179
	MOVLW      0
	SUBWF      _Distance+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main179
	MOVLW      10
	SUBWF      _Distance+0, 0
L__main179:
	BTFSC      STATUS+0, 0
	GOTO       L_main54
;ATRESSUBMIT.c,105 :: 		for (i = 0; i < 65; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main55:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main180
	MOVLW      65
	SUBWF      _i+0, 0
L__main180:
	BTFSC      STATUS+0, 0
	GOTO       L_main56
;ATRESSUBMIT.c,106 :: 		stepper_bullet1();
	CALL       _stepper_bullet1+0
;ATRESSUBMIT.c,105 :: 		for (i = 0; i < 65; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,107 :: 		}
	GOTO       L_main55
L_main56:
;ATRESSUBMIT.c,108 :: 		for (i = 0; i < 130; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main58:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main181
	MOVLW      130
	SUBWF      _i+0, 0
L__main181:
	BTFSC      STATUS+0, 0
	GOTO       L_main59
;ATRESSUBMIT.c,109 :: 		stepper_bullet2();
	CALL       _stepper_bullet2+0
;ATRESSUBMIT.c,108 :: 		for (i = 0; i < 130; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,110 :: 		}
	GOTO       L_main58
L_main59:
;ATRESSUBMIT.c,111 :: 		}
L_main54:
;ATRESSUBMIT.c,112 :: 		for(i = 0; i < 20;i++)
	CLRF       _i+0
	CLRF       _i+1
L_main61:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main182
	MOVLW      20
	SUBWF      _i+0, 0
L__main182:
	BTFSC      STATUS+0, 0
	GOTO       L_main62
;ATRESSUBMIT.c,113 :: 		{DCmotor_forward();}
	CALL       _DCmotor_forward+0
;ATRESSUBMIT.c,112 :: 		for(i = 0; i < 20;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,113 :: 		{DCmotor_forward();}
	GOTO       L_main61
L_main62:
;ATRESSUBMIT.c,114 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main64:
	DECFSZ     R13+0, 1
	GOTO       L_main64
	DECFSZ     R12+0, 1
	GOTO       L_main64
	DECFSZ     R11+0, 1
	GOTO       L_main64
	NOP
	NOP
;ATRESSUBMIT.c,115 :: 		Rotation135();
	CALL       _Rotation135+0
;ATRESSUBMIT.c,116 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main65:
	DECFSZ     R13+0, 1
	GOTO       L_main65
	DECFSZ     R12+0, 1
	GOTO       L_main65
	DECFSZ     R11+0, 1
	GOTO       L_main65
	NOP
	NOP
;ATRESSUBMIT.c,117 :: 		read_sonar();
	CALL       _read_sonar+0
;ATRESSUBMIT.c,118 :: 		if (Distance < 10) {
	MOVLW      0
	SUBWF      _Distance+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main183
	MOVLW      0
	SUBWF      _Distance+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main183
	MOVLW      0
	SUBWF      _Distance+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main183
	MOVLW      10
	SUBWF      _Distance+0, 0
L__main183:
	BTFSC      STATUS+0, 0
	GOTO       L_main66
;ATRESSUBMIT.c,120 :: 		for (i = 0; i < 65; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main67:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main184
	MOVLW      65
	SUBWF      _i+0, 0
L__main184:
	BTFSC      STATUS+0, 0
	GOTO       L_main68
;ATRESSUBMIT.c,121 :: 		stepper_bullet1();
	CALL       _stepper_bullet1+0
;ATRESSUBMIT.c,120 :: 		for (i = 0; i < 65; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,122 :: 		}   for (i = 0; i < 130; i++) {
	GOTO       L_main67
L_main68:
	CLRF       _i+0
	CLRF       _i+1
L_main70:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main185
	MOVLW      130
	SUBWF      _i+0, 0
L__main185:
	BTFSC      STATUS+0, 0
	GOTO       L_main71
;ATRESSUBMIT.c,123 :: 		stepper_bullet2();
	CALL       _stepper_bullet2+0
;ATRESSUBMIT.c,122 :: 		}   for (i = 0; i < 130; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,124 :: 		}
	GOTO       L_main70
L_main71:
;ATRESSUBMIT.c,125 :: 		}
L_main66:
;ATRESSUBMIT.c,126 :: 		for(i = 0; i < 20;i++)
	CLRF       _i+0
	CLRF       _i+1
L_main73:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main186
	MOVLW      20
	SUBWF      _i+0, 0
L__main186:
	BTFSC      STATUS+0, 0
	GOTO       L_main74
;ATRESSUBMIT.c,127 :: 		{DCmotor_forward();}
	CALL       _DCmotor_forward+0
;ATRESSUBMIT.c,126 :: 		for(i = 0; i < 20;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,127 :: 		{DCmotor_forward();}
	GOTO       L_main73
L_main74:
;ATRESSUBMIT.c,128 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main76:
	DECFSZ     R13+0, 1
	GOTO       L_main76
	DECFSZ     R12+0, 1
	GOTO       L_main76
	DECFSZ     R11+0, 1
	GOTO       L_main76
	NOP
	NOP
;ATRESSUBMIT.c,129 :: 		Rotation90();
	CALL       _Rotation90+0
;ATRESSUBMIT.c,130 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main77:
	DECFSZ     R13+0, 1
	GOTO       L_main77
	DECFSZ     R12+0, 1
	GOTO       L_main77
	DECFSZ     R11+0, 1
	GOTO       L_main77
	NOP
	NOP
;ATRESSUBMIT.c,131 :: 		read_sonar();
	CALL       _read_sonar+0
;ATRESSUBMIT.c,132 :: 		if (Distance < 10) {
	MOVLW      0
	SUBWF      _Distance+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main187
	MOVLW      0
	SUBWF      _Distance+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main187
	MOVLW      0
	SUBWF      _Distance+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main187
	MOVLW      10
	SUBWF      _Distance+0, 0
L__main187:
	BTFSC      STATUS+0, 0
	GOTO       L_main78
;ATRESSUBMIT.c,134 :: 		for (i = 0; i < 65; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main79:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main188
	MOVLW      65
	SUBWF      _i+0, 0
L__main188:
	BTFSC      STATUS+0, 0
	GOTO       L_main80
;ATRESSUBMIT.c,135 :: 		stepper_bullet1();
	CALL       _stepper_bullet1+0
;ATRESSUBMIT.c,134 :: 		for (i = 0; i < 65; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,136 :: 		}    for (i = 0; i < 130; i++) {
	GOTO       L_main79
L_main80:
	CLRF       _i+0
	CLRF       _i+1
L_main82:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main189
	MOVLW      130
	SUBWF      _i+0, 0
L__main189:
	BTFSC      STATUS+0, 0
	GOTO       L_main83
;ATRESSUBMIT.c,137 :: 		stepper_bullet2();
	CALL       _stepper_bullet2+0
;ATRESSUBMIT.c,136 :: 		}    for (i = 0; i < 130; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,138 :: 		}
	GOTO       L_main82
L_main83:
;ATRESSUBMIT.c,139 :: 		}
L_main78:
;ATRESSUBMIT.c,140 :: 		for(i = 0; i < 20;i++)
	CLRF       _i+0
	CLRF       _i+1
L_main85:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main190
	MOVLW      20
	SUBWF      _i+0, 0
L__main190:
	BTFSC      STATUS+0, 0
	GOTO       L_main86
;ATRESSUBMIT.c,141 :: 		{DCmotor_forward();}
	CALL       _DCmotor_forward+0
;ATRESSUBMIT.c,140 :: 		for(i = 0; i < 20;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,141 :: 		{DCmotor_forward();}
	GOTO       L_main85
L_main86:
;ATRESSUBMIT.c,142 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main88:
	DECFSZ     R13+0, 1
	GOTO       L_main88
	DECFSZ     R12+0, 1
	GOTO       L_main88
	DECFSZ     R11+0, 1
	GOTO       L_main88
	NOP
	NOP
;ATRESSUBMIT.c,143 :: 		Rotation45();
	CALL       _Rotation45+0
;ATRESSUBMIT.c,144 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main89:
	DECFSZ     R13+0, 1
	GOTO       L_main89
	DECFSZ     R12+0, 1
	GOTO       L_main89
	DECFSZ     R11+0, 1
	GOTO       L_main89
	NOP
	NOP
;ATRESSUBMIT.c,145 :: 		read_sonar();
	CALL       _read_sonar+0
;ATRESSUBMIT.c,146 :: 		if (Distance < 10) {
	MOVLW      0
	SUBWF      _Distance+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main191
	MOVLW      0
	SUBWF      _Distance+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main191
	MOVLW      0
	SUBWF      _Distance+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main191
	MOVLW      10
	SUBWF      _Distance+0, 0
L__main191:
	BTFSC      STATUS+0, 0
	GOTO       L_main90
;ATRESSUBMIT.c,148 :: 		for (i = 0; i < 65; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main91:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main192
	MOVLW      65
	SUBWF      _i+0, 0
L__main192:
	BTFSC      STATUS+0, 0
	GOTO       L_main92
;ATRESSUBMIT.c,149 :: 		stepper_bullet1();
	CALL       _stepper_bullet1+0
;ATRESSUBMIT.c,148 :: 		for (i = 0; i < 65; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,150 :: 		}   for (i = 0; i < 130; i++) {
	GOTO       L_main91
L_main92:
	CLRF       _i+0
	CLRF       _i+1
L_main94:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main193
	MOVLW      130
	SUBWF      _i+0, 0
L__main193:
	BTFSC      STATUS+0, 0
	GOTO       L_main95
;ATRESSUBMIT.c,151 :: 		stepper_bullet2();
	CALL       _stepper_bullet2+0
;ATRESSUBMIT.c,150 :: 		}   for (i = 0; i < 130; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,152 :: 		}
	GOTO       L_main94
L_main95:
;ATRESSUBMIT.c,153 :: 		}
L_main90:
;ATRESSUBMIT.c,154 :: 		for(i = 0; i < 20;i++)
	CLRF       _i+0
	CLRF       _i+1
L_main97:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main194
	MOVLW      20
	SUBWF      _i+0, 0
L__main194:
	BTFSC      STATUS+0, 0
	GOTO       L_main98
;ATRESSUBMIT.c,155 :: 		{DCmotor_forward();}
	CALL       _DCmotor_forward+0
;ATRESSUBMIT.c,154 :: 		for(i = 0; i < 20;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,155 :: 		{DCmotor_forward();}
	GOTO       L_main97
L_main98:
;ATRESSUBMIT.c,156 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main100:
	DECFSZ     R13+0, 1
	GOTO       L_main100
	DECFSZ     R12+0, 1
	GOTO       L_main100
	DECFSZ     R11+0, 1
	GOTO       L_main100
	NOP
	NOP
;ATRESSUBMIT.c,157 :: 		Rotation0();
	CALL       _Rotation0+0
;ATRESSUBMIT.c,158 :: 		Delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main101:
	DECFSZ     R13+0, 1
	GOTO       L_main101
	DECFSZ     R12+0, 1
	GOTO       L_main101
	DECFSZ     R11+0, 1
	GOTO       L_main101
	NOP
	NOP
;ATRESSUBMIT.c,159 :: 		read_sonar();
	CALL       _read_sonar+0
;ATRESSUBMIT.c,160 :: 		if (Distance < 10) {
	MOVLW      0
	SUBWF      _Distance+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main195
	MOVLW      0
	SUBWF      _Distance+2, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main195
	MOVLW      0
	SUBWF      _Distance+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main195
	MOVLW      10
	SUBWF      _Distance+0, 0
L__main195:
	BTFSC      STATUS+0, 0
	GOTO       L_main102
;ATRESSUBMIT.c,162 :: 		for (i = 0; i < 65; i++) {
	CLRF       _i+0
	CLRF       _i+1
L_main103:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main196
	MOVLW      65
	SUBWF      _i+0, 0
L__main196:
	BTFSC      STATUS+0, 0
	GOTO       L_main104
;ATRESSUBMIT.c,163 :: 		stepper_bullet1();
	CALL       _stepper_bullet1+0
;ATRESSUBMIT.c,162 :: 		for (i = 0; i < 65; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,164 :: 		}  for (i = 0; i < 130; i++) {
	GOTO       L_main103
L_main104:
	CLRF       _i+0
	CLRF       _i+1
L_main106:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main197
	MOVLW      130
	SUBWF      _i+0, 0
L__main197:
	BTFSC      STATUS+0, 0
	GOTO       L_main107
;ATRESSUBMIT.c,165 :: 		stepper_bullet2();
	CALL       _stepper_bullet2+0
;ATRESSUBMIT.c,164 :: 		}  for (i = 0; i < 130; i++) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,166 :: 		}
	GOTO       L_main106
L_main107:
;ATRESSUBMIT.c,167 :: 		}
L_main102:
;ATRESSUBMIT.c,170 :: 		}
	GOTO       L_main0
;ATRESSUBMIT.c,172 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_Delay_us:

;ATRESSUBMIT.c,174 :: 		void Delay_us(unsigned int microseconds) {
;ATRESSUBMIT.c,177 :: 		while (microseconds--) {
L_Delay_us109:
	MOVF       FARG_Delay_us_microseconds+0, 0
	MOVWF      R0+0
	MOVF       FARG_Delay_us_microseconds+1, 0
	MOVWF      R0+1
	MOVLW      1
	SUBWF      FARG_Delay_us_microseconds+0, 1
	BTFSS      STATUS+0, 0
	DECF       FARG_Delay_us_microseconds+1, 1
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Delay_us110
;ATRESSUBMIT.c,178 :: 		for (i = 0; i < 12; i++) {
	CLRF       R2+0
	CLRF       R2+1
L_Delay_us111:
	MOVLW      0
	SUBWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Delay_us199
	MOVLW      12
	SUBWF      R2+0, 0
L__Delay_us199:
	BTFSC      STATUS+0, 0
	GOTO       L_Delay_us112
;ATRESSUBMIT.c,179 :: 		asm nop;
	NOP
;ATRESSUBMIT.c,178 :: 		for (i = 0; i < 12; i++) {
	INCF       R2+0, 1
	BTFSC      STATUS+0, 2
	INCF       R2+1, 1
;ATRESSUBMIT.c,180 :: 		}
	GOTO       L_Delay_us111
L_Delay_us112:
;ATRESSUBMIT.c,181 :: 		}
	GOTO       L_Delay_us109
L_Delay_us110:
;ATRESSUBMIT.c,182 :: 		}
L_end_Delay_us:
	RETURN
; end of _Delay_us

_Delay_ms:

;ATRESSUBMIT.c,184 :: 		void Delay_ms(unsigned int milliseconds) {
;ATRESSUBMIT.c,187 :: 		while (milliseconds--) {
L_Delay_ms114:
	MOVF       FARG_Delay_ms_milliseconds+0, 0
	MOVWF      R0+0
	MOVF       FARG_Delay_ms_milliseconds+1, 0
	MOVWF      R0+1
	MOVLW      1
	SUBWF      FARG_Delay_ms_milliseconds+0, 1
	BTFSS      STATUS+0, 0
	DECF       FARG_Delay_ms_milliseconds+1, 1
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Delay_ms115
;ATRESSUBMIT.c,188 :: 		for (i = 0; i < 238; i++) {
	CLRF       R2+0
	CLRF       R2+1
L_Delay_ms116:
	MOVLW      0
	SUBWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Delay_ms201
	MOVLW      238
	SUBWF      R2+0, 0
L__Delay_ms201:
	BTFSC      STATUS+0, 0
	GOTO       L_Delay_ms117
;ATRESSUBMIT.c,189 :: 		Delay_us(1000);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Delay_ms119:
	DECFSZ     R13+0, 1
	GOTO       L_Delay_ms119
	DECFSZ     R12+0, 1
	GOTO       L_Delay_ms119
	NOP
	NOP
;ATRESSUBMIT.c,188 :: 		for (i = 0; i < 238; i++) {
	INCF       R2+0, 1
	BTFSC      STATUS+0, 2
	INCF       R2+1, 1
;ATRESSUBMIT.c,190 :: 		}
	GOTO       L_Delay_ms116
L_Delay_ms117:
;ATRESSUBMIT.c,191 :: 		}
	GOTO       L_Delay_ms114
L_Delay_ms115:
;ATRESSUBMIT.c,192 :: 		}
L_end_Delay_ms:
	RETURN
; end of _Delay_ms

_ATD_init:

;ATRESSUBMIT.c,194 :: 		void ATD_init(){
;ATRESSUBMIT.c,195 :: 		ADCON1 = 0xC0; // right justified, all channels are analog
	MOVLW      192
	MOVWF      ADCON1+0
;ATRESSUBMIT.c,197 :: 		}
L_end_ATD_init:
	RETURN
; end of _ATD_init

_ATD_read:

;ATRESSUBMIT.c,199 :: 		unsigned int ATD_read(){
;ATRESSUBMIT.c,201 :: 		unsigned int new_temp = 0;
	CLRF       ATD_read_new_temp_L0+0
	CLRF       ATD_read_new_temp_L0+1
;ATRESSUBMIT.c,203 :: 		ADCON0= 0x41;
	MOVLW      65
	MOVWF      ADCON0+0
;ATRESSUBMIT.c,204 :: 		ADCON0 = ADCON0 | 0x04; // GO ;
	BSF        ADCON0+0, 2
;ATRESSUBMIT.c,205 :: 		while(ADCON0 & 0x04);//until finish reading
L_ATD_read120:
	BTFSS      ADCON0+0, 2
	GOTO       L_ATD_read121
	GOTO       L_ATD_read120
L_ATD_read121:
;ATRESSUBMIT.c,207 :: 		read = (ADRESH<<8)|ADRESL  ;
	MOVF       ADRESH+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       ADRESL+0, 0
	IORWF      R0+0, 1
	MOVLW      0
	IORWF      R0+1, 1
;ATRESSUBMIT.c,208 :: 		read = (read * 500) / 1023;
	MOVLW      244
	MOVWF      R4+0
	MOVLW      1
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
;ATRESSUBMIT.c,210 :: 		new_temp = (new_temp + read)/2;
	MOVF       R0+0, 0
	ADDWF      ATD_read_new_temp_L0+0, 0
	MOVWF      R3+0
	MOVF       ATD_read_new_temp_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 0
	MOVWF      R3+1
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	MOVF       R0+0, 0
	MOVWF      ATD_read_new_temp_L0+0
	MOVF       R0+1, 0
	MOVWF      ATD_read_new_temp_L0+1
;ATRESSUBMIT.c,212 :: 		IntToStr(new_temp,t_temp);
	MOVF       R0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _t_temp+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;ATRESSUBMIT.c,213 :: 		ltrim(t_temp);
	MOVLW      _t_temp+0
	MOVWF      FARG_Ltrim_string+0
	CALL       _Ltrim+0
;ATRESSUBMIT.c,214 :: 		return t_temp;
	MOVLW      _t_temp+0
	MOVWF      R0+0
	MOVLW      hi_addr(_t_temp+0)
	MOVWF      R0+1
;ATRESSUBMIT.c,216 :: 		}
L_end_ATD_read:
	RETURN
; end of _ATD_read

_read_sonar:

;ATRESSUBMIT.c,218 :: 		void read_sonar(void){
;ATRESSUBMIT.c,220 :: 		T1overflow=0;
	CLRF       _T1overflow+0
	CLRF       _T1overflow+1
;ATRESSUBMIT.c,221 :: 		TMR1H=0;
	CLRF       TMR1H+0
;ATRESSUBMIT.c,222 :: 		TMR1L=0;
	CLRF       TMR1L+0
;ATRESSUBMIT.c,224 :: 		PORTB=0x04;//Trigger the ultrasonic sensor (RB2 connected to trigger)
	MOVLW      4
	MOVWF      PORTB+0
;ATRESSUBMIT.c,225 :: 		Delay_us(10);//keep trigger for 10uS
	MOVLW      6
	MOVWF      R13+0
L_read_sonar122:
	DECFSZ     R13+0, 1
	GOTO       L_read_sonar122
	NOP
;ATRESSUBMIT.c,226 :: 		PORTB=0x00;//Remove trigger
	CLRF       PORTB+0
;ATRESSUBMIT.c,227 :: 		while(!(PORTB&0x02));
L_read_sonar123:
	BTFSC      PORTB+0, 1
	GOTO       L_read_sonar124
	GOTO       L_read_sonar123
L_read_sonar124:
;ATRESSUBMIT.c,228 :: 		T1CON=0x19;
	MOVLW      25
	MOVWF      T1CON+0
;ATRESSUBMIT.c,229 :: 		while(PORTB&0x02);
L_read_sonar125:
	BTFSS      PORTB+0, 1
	GOTO       L_read_sonar126
	GOTO       L_read_sonar125
L_read_sonar126:
;ATRESSUBMIT.c,230 :: 		T1CON=0x18;
	MOVLW      24
	MOVWF      T1CON+0
;ATRESSUBMIT.c,231 :: 		T1counts=((TMR1H<<8)|TMR1L)+(T1overflow*65536);
	MOVF       TMR1H+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       TMR1L+0, 0
	IORWF      R0+0, 0
	MOVWF      R5+0
	MOVF       R0+1, 0
	MOVWF      R5+1
	MOVLW      0
	IORWF      R5+1, 1
	MOVF       _T1overflow+1, 0
	MOVWF      R0+3
	MOVF       _T1overflow+0, 0
	MOVWF      R0+2
	CLRF       R0+0
	CLRF       R0+1
	MOVF       R5+0, 0
	MOVWF      _T1counts+0
	MOVF       R5+1, 0
	MOVWF      _T1counts+1
	CLRF       _T1counts+2
	CLRF       _T1counts+3
	MOVF       R0+0, 0
	ADDWF      _T1counts+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	INCFSZ     R0+1, 0
	ADDWF      _T1counts+1, 1
	MOVF       R0+2, 0
	BTFSC      STATUS+0, 0
	INCFSZ     R0+2, 0
	ADDWF      _T1counts+2, 1
	MOVF       R0+3, 0
	BTFSC      STATUS+0, 0
	INCFSZ     R0+3, 0
	ADDWF      _T1counts+3, 1
;ATRESSUBMIT.c,232 :: 		if(TMR1L>100) PORTC=0xFF;
	MOVF       TMR1L+0, 0
	SUBLW      100
	BTFSC      STATUS+0, 0
	GOTO       L_read_sonar127
	MOVLW      255
	MOVWF      PORTC+0
L_read_sonar127:
;ATRESSUBMIT.c,233 :: 		T1time=T1counts;//in microseconds
	MOVF       _T1counts+0, 0
	MOVWF      _T1time+0
	MOVF       _T1counts+1, 0
	MOVWF      _T1time+1
	MOVF       _T1counts+2, 0
	MOVWF      _T1time+2
	MOVF       _T1counts+3, 0
	MOVWF      _T1time+3
;ATRESSUBMIT.c,234 :: 		Distance=((T1time*34)/(1000))/2;
	MOVF       _T1counts+0, 0
	MOVWF      R0+0
	MOVF       _T1counts+1, 0
	MOVWF      R0+1
	MOVF       _T1counts+2, 0
	MOVWF      R0+2
	MOVF       _T1counts+3, 0
	MOVWF      R0+3
	MOVLW      34
	MOVWF      R4+0
	CLRF       R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CLRF       R4+2
	CLRF       R4+3
	CALL       _Div_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      _Distance+0
	MOVF       R0+1, 0
	MOVWF      _Distance+1
	MOVF       R0+2, 0
	MOVWF      _Distance+2
	MOVF       R0+3, 0
	MOVWF      _Distance+3
	RRF        _Distance+3, 1
	RRF        _Distance+2, 1
	RRF        _Distance+1, 1
	RRF        _Distance+0, 1
	BCF        _Distance+3, 7
;ATRESSUBMIT.c,235 :: 		}
L_end_read_sonar:
	RETURN
; end of _read_sonar

_init_sonar:

;ATRESSUBMIT.c,237 :: 		void init_sonar(void){
;ATRESSUBMIT.c,238 :: 		T1overflow=0;
	CLRF       _T1overflow+0
	CLRF       _T1overflow+1
;ATRESSUBMIT.c,239 :: 		T1counts=0;
	CLRF       _T1counts+0
	CLRF       _T1counts+1
	CLRF       _T1counts+2
	CLRF       _T1counts+3
;ATRESSUBMIT.c,240 :: 		T1time=0;
	CLRF       _T1time+0
	CLRF       _T1time+1
	CLRF       _T1time+2
	CLRF       _T1time+3
;ATRESSUBMIT.c,241 :: 		Distance=0;
	CLRF       _Distance+0
	CLRF       _Distance+1
	CLRF       _Distance+2
	CLRF       _Distance+3
;ATRESSUBMIT.c,242 :: 		TMR1H=0;
	CLRF       TMR1H+0
;ATRESSUBMIT.c,243 :: 		TMR1L=0;
	CLRF       TMR1L+0
;ATRESSUBMIT.c,244 :: 		TRISB=0x02; //RB2 for trigger, RB1 for echo
	MOVLW      2
	MOVWF      TRISB+0
;ATRESSUBMIT.c,245 :: 		PORTB=0x00;
	CLRF       PORTB+0
;ATRESSUBMIT.c,246 :: 		INTCON=INTCON|0xC0;//GIE and PIE
	MOVLW      192
	IORWF      INTCON+0, 1
;ATRESSUBMIT.c,247 :: 		PIE1=PIE1|0x01;// Enable TMR1 Overflow interrupt
	BSF        PIE1+0, 0
;ATRESSUBMIT.c,249 :: 		T1CON=0x18;
	MOVLW      24
	MOVWF      T1CON+0
;ATRESSUBMIT.c,250 :: 		}
L_end_init_sonar:
	RETURN
; end of _init_sonar

_DCmotor_forward:

;ATRESSUBMIT.c,252 :: 		void DCmotor_forward() {
;ATRESSUBMIT.c,253 :: 		PORTA = PORTA | 0x02;//PORTA1 is 1
	BSF        PORTA+0, 1
;ATRESSUBMIT.c,254 :: 		PORTA = PORTA & 0xFB;//PORTA2 is 0
	MOVLW      251
	ANDWF      PORTA+0, 1
;ATRESSUBMIT.c,255 :: 		PORTA = PORTA | 0x08;//PORTA3 is 1
	BSF        PORTA+0, 3
;ATRESSUBMIT.c,256 :: 		PORTA = PORTA & 0xEF;//PORTA4 is 0
	MOVLW      239
	ANDWF      PORTA+0, 1
;ATRESSUBMIT.c,257 :: 		PORTA = PORTA | 0x20;//PORTA5 is 1
	BSF        PORTA+0, 5
;ATRESSUBMIT.c,258 :: 		PORTD = PORTD & 0xDF;//PORTD5 is 0
	MOVLW      223
	ANDWF      PORTD+0, 1
;ATRESSUBMIT.c,259 :: 		PORTD = PORTD | 0x40;//PORTD6 is 1
	BSF        PORTD+0, 6
;ATRESSUBMIT.c,260 :: 		PORTD = PORTD & 0x7F;//PORTD7 is 0
	MOVLW      127
	ANDWF      PORTD+0, 1
;ATRESSUBMIT.c,261 :: 		}
L_end_DCmotor_forward:
	RETURN
; end of _DCmotor_forward

_DCmotor_backward:

;ATRESSUBMIT.c,263 :: 		void DCmotor_backward(){
;ATRESSUBMIT.c,264 :: 		PORTA = PORTA & 0xFD;//PORTA1 is 0
	MOVLW      253
	ANDWF      PORTA+0, 1
;ATRESSUBMIT.c,265 :: 		PORTA = PORTA | 0x04;//PORTA2 is 1
	BSF        PORTA+0, 2
;ATRESSUBMIT.c,266 :: 		PORTA = PORTA & 0xF7;//PORTA3 is 0
	MOVLW      247
	ANDWF      PORTA+0, 1
;ATRESSUBMIT.c,267 :: 		PORTA = PORTA | 0x01;//PORTA4 is 1
	BSF        PORTA+0, 0
;ATRESSUBMIT.c,268 :: 		PORTA = PORTA & 0xDF;//PORTA5 is 0
	MOVLW      223
	ANDWF      PORTA+0, 1
;ATRESSUBMIT.c,269 :: 		PORTD = PORTD | 0x20;//PORTD5 is 1
	BSF        PORTD+0, 5
;ATRESSUBMIT.c,270 :: 		PORTD = PORTD & 0xBF;//PORTD6 is 0
	MOVLW      191
	ANDWF      PORTD+0, 1
;ATRESSUBMIT.c,271 :: 		PORTD = PORTD | 0x80;//PORTD7 is 1
	BSF        PORTD+0, 7
;ATRESSUBMIT.c,272 :: 		}
L_end_DCmotor_backward:
	RETURN
; end of _DCmotor_backward

_DCmotor_stop:

;ATRESSUBMIT.c,274 :: 		void DCmotor_stop() {
;ATRESSUBMIT.c,275 :: 		PORTA = PORTA & 0xC1; // PORTA(1-5) is 0
	MOVLW      193
	ANDWF      PORTA+0, 1
;ATRESSUBMIT.c,276 :: 		PORTD = PORTD & 0x1F; // PORTD(5-7) is 0
	MOVLW      31
	ANDWF      PORTD+0, 1
;ATRESSUBMIT.c,277 :: 		}
L_end_DCmotor_stop:
	RETURN
; end of _DCmotor_stop

_Rotation0:

;ATRESSUBMIT.c,279 :: 		void Rotation0(){//0 degrees
;ATRESSUBMIT.c,280 :: 		for(i=0;i<50 ;i++)
	CLRF       _i+0
	CLRF       _i+1
L_Rotation0128:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Rotation0210
	MOVLW      50
	SUBWF      _i+0, 0
L__Rotation0210:
	BTFSC      STATUS+0, 0
	GOTO       L_Rotation0129
;ATRESSUBMIT.c,282 :: 		PORTD = PORTD | 0x10;
	BSF        PORTD+0, 4
;ATRESSUBMIT.c,283 :: 		Delay_us(200);
	MOVLW      133
	MOVWF      R13+0
L_Rotation0131:
	DECFSZ     R13+0, 1
	GOTO       L_Rotation0131
;ATRESSUBMIT.c,284 :: 		PORTD = PORTD & 0xEF;
	MOVLW      239
	ANDWF      PORTD+0, 1
;ATRESSUBMIT.c,285 :: 		Delay_us(19200);
	MOVLW      50
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_Rotation0132:
	DECFSZ     R13+0, 1
	GOTO       L_Rotation0132
	DECFSZ     R12+0, 1
	GOTO       L_Rotation0132
	NOP
	NOP
;ATRESSUBMIT.c,280 :: 		for(i=0;i<50 ;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,286 :: 		}
	GOTO       L_Rotation0128
L_Rotation0129:
;ATRESSUBMIT.c,287 :: 		}
L_end_Rotation0:
	RETURN
; end of _Rotation0

_Rotation45:

;ATRESSUBMIT.c,288 :: 		void Rotation45(){
;ATRESSUBMIT.c,289 :: 		for(i=0;i<50;i++)
	CLRF       _i+0
	CLRF       _i+1
L_Rotation45133:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Rotation45212
	MOVLW      50
	SUBWF      _i+0, 0
L__Rotation45212:
	BTFSC      STATUS+0, 0
	GOTO       L_Rotation45134
;ATRESSUBMIT.c,291 :: 		PORTD = PORTD | 0x10;
	BSF        PORTD+0, 4
;ATRESSUBMIT.c,292 :: 		Delay_us(1000);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_Rotation45136:
	DECFSZ     R13+0, 1
	GOTO       L_Rotation45136
	DECFSZ     R12+0, 1
	GOTO       L_Rotation45136
	NOP
	NOP
;ATRESSUBMIT.c,293 :: 		PORTD = PORTD & 0xEF;
	MOVLW      239
	ANDWF      PORTD+0, 1
;ATRESSUBMIT.c,294 :: 		Delay_us(19000);
	MOVLW      50
	MOVWF      R12+0
	MOVLW      88
	MOVWF      R13+0
L_Rotation45137:
	DECFSZ     R13+0, 1
	GOTO       L_Rotation45137
	DECFSZ     R12+0, 1
	GOTO       L_Rotation45137
	NOP
;ATRESSUBMIT.c,289 :: 		for(i=0;i<50;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,295 :: 		}
	GOTO       L_Rotation45133
L_Rotation45134:
;ATRESSUBMIT.c,296 :: 		}
L_end_Rotation45:
	RETURN
; end of _Rotation45

_Rotation90:

;ATRESSUBMIT.c,297 :: 		void Rotation90()//90 Degree
;ATRESSUBMIT.c,299 :: 		for(i=0;i<50;i++)
	CLRF       _i+0
	CLRF       _i+1
L_Rotation90138:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Rotation90214
	MOVLW      50
	SUBWF      _i+0, 0
L__Rotation90214:
	BTFSC      STATUS+0, 0
	GOTO       L_Rotation90139
;ATRESSUBMIT.c,301 :: 		PORTD = PORTD | 0x10;
	BSF        PORTD+0, 4
;ATRESSUBMIT.c,302 :: 		Delay_us(1400);
	MOVLW      4
	MOVWF      R12+0
	MOVLW      161
	MOVWF      R13+0
L_Rotation90141:
	DECFSZ     R13+0, 1
	GOTO       L_Rotation90141
	DECFSZ     R12+0, 1
	GOTO       L_Rotation90141
	NOP
	NOP
;ATRESSUBMIT.c,303 :: 		PORTD = PORTD & 0xEF;
	MOVLW      239
	ANDWF      PORTD+0, 1
;ATRESSUBMIT.c,304 :: 		Delay_us(18500);
	MOVLW      49
	MOVWF      R12+0
	MOVLW      11
	MOVWF      R13+0
L_Rotation90142:
	DECFSZ     R13+0, 1
	GOTO       L_Rotation90142
	DECFSZ     R12+0, 1
	GOTO       L_Rotation90142
	NOP
	NOP
;ATRESSUBMIT.c,299 :: 		for(i=0;i<50;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,305 :: 		}
	GOTO       L_Rotation90138
L_Rotation90139:
;ATRESSUBMIT.c,306 :: 		}
L_end_Rotation90:
	RETURN
; end of _Rotation90

_Rotation135:

;ATRESSUBMIT.c,307 :: 		void Rotation135()//135 Degree
;ATRESSUBMIT.c,309 :: 		for(i=0;i<50;i++)
	CLRF       _i+0
	CLRF       _i+1
L_Rotation135143:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Rotation135216
	MOVLW      50
	SUBWF      _i+0, 0
L__Rotation135216:
	BTFSC      STATUS+0, 0
	GOTO       L_Rotation135144
;ATRESSUBMIT.c,311 :: 		PORTD = PORTD | 0x10;
	BSF        PORTD+0, 4
;ATRESSUBMIT.c,312 :: 		Delay_us(1750);
	MOVLW      5
	MOVWF      R12+0
	MOVLW      138
	MOVWF      R13+0
L_Rotation135146:
	DECFSZ     R13+0, 1
	GOTO       L_Rotation135146
	DECFSZ     R12+0, 1
	GOTO       L_Rotation135146
	NOP
;ATRESSUBMIT.c,313 :: 		PORTD = PORTD & 0xEF;
	MOVLW      239
	ANDWF      PORTD+0, 1
;ATRESSUBMIT.c,314 :: 		Delay_us(18500);
	MOVLW      49
	MOVWF      R12+0
	MOVLW      11
	MOVWF      R13+0
L_Rotation135147:
	DECFSZ     R13+0, 1
	GOTO       L_Rotation135147
	DECFSZ     R12+0, 1
	GOTO       L_Rotation135147
	NOP
	NOP
;ATRESSUBMIT.c,309 :: 		for(i=0;i<50;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,315 :: 		}
	GOTO       L_Rotation135143
L_Rotation135144:
;ATRESSUBMIT.c,316 :: 		}
L_end_Rotation135:
	RETURN
; end of _Rotation135

_Rotation180:

;ATRESSUBMIT.c,317 :: 		void Rotation180(){//180 degrees
;ATRESSUBMIT.c,318 :: 		for(i=0;i<50 ;i++)
	CLRF       _i+0
	CLRF       _i+1
L_Rotation180148:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Rotation180218
	MOVLW      50
	SUBWF      _i+0, 0
L__Rotation180218:
	BTFSC      STATUS+0, 0
	GOTO       L_Rotation180149
;ATRESSUBMIT.c,320 :: 		PORTD = PORTD | 0x10;
	BSF        PORTD+0, 4
;ATRESSUBMIT.c,321 :: 		Delay_us(2200);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      181
	MOVWF      R13+0
L_Rotation180151:
	DECFSZ     R13+0, 1
	GOTO       L_Rotation180151
	DECFSZ     R12+0, 1
	GOTO       L_Rotation180151
	NOP
	NOP
;ATRESSUBMIT.c,322 :: 		PORTD = PORTD & 0xEF;
	MOVLW      239
	ANDWF      PORTD+0, 1
;ATRESSUBMIT.c,323 :: 		Delay_us(17800);
	MOVLW      47
	MOVWF      R12+0
	MOVLW      58
	MOVWF      R13+0
L_Rotation180152:
	DECFSZ     R13+0, 1
	GOTO       L_Rotation180152
	DECFSZ     R12+0, 1
	GOTO       L_Rotation180152
	NOP
;ATRESSUBMIT.c,318 :: 		for(i=0;i<50 ;i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;ATRESSUBMIT.c,324 :: 		}
	GOTO       L_Rotation180148
L_Rotation180149:
;ATRESSUBMIT.c,325 :: 		}
L_end_Rotation180:
	RETURN
; end of _Rotation180

_stepper_bullet1:

;ATRESSUBMIT.c,327 :: 		void stepper_bullet1(){
;ATRESSUBMIT.c,328 :: 		PORTD = PORTD | 0x03;
	MOVLW      3
	IORWF      PORTD+0, 1
;ATRESSUBMIT.c,329 :: 		PORTD = PORTD & 0xF3;
	MOVLW      243
	ANDWF      PORTD+0, 1
;ATRESSUBMIT.c,330 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_stepper_bullet1153:
	DECFSZ     R13+0, 1
	GOTO       L_stepper_bullet1153
	DECFSZ     R12+0, 1
	GOTO       L_stepper_bullet1153
	NOP
	NOP
;ATRESSUBMIT.c,331 :: 		PORTD = PORTD & 0xF6;
	MOVLW      246
	ANDWF      PORTD+0, 1
;ATRESSUBMIT.c,332 :: 		PORTD = PORTD | 0x06;
	MOVLW      6
	IORWF      PORTD+0, 1
;ATRESSUBMIT.c,333 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_stepper_bullet1154:
	DECFSZ     R13+0, 1
	GOTO       L_stepper_bullet1154
	DECFSZ     R12+0, 1
	GOTO       L_stepper_bullet1154
	NOP
	NOP
;ATRESSUBMIT.c,334 :: 		PORTD = PORTD & 0xFC;
	MOVLW      252
	ANDWF      PORTD+0, 1
;ATRESSUBMIT.c,335 :: 		PORTD = PORTD | 0x0C;
	MOVLW      12
	IORWF      PORTD+0, 1
;ATRESSUBMIT.c,336 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_stepper_bullet1155:
	DECFSZ     R13+0, 1
	GOTO       L_stepper_bullet1155
	DECFSZ     R12+0, 1
	GOTO       L_stepper_bullet1155
	NOP
	NOP
;ATRESSUBMIT.c,337 :: 		PORTD = PORTD & 0xF9;
	MOVLW      249
	ANDWF      PORTD+0, 1
;ATRESSUBMIT.c,338 :: 		PORTD = PORTD | 0x09;
	MOVLW      9
	IORWF      PORTD+0, 1
;ATRESSUBMIT.c,339 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_stepper_bullet1156:
	DECFSZ     R13+0, 1
	GOTO       L_stepper_bullet1156
	DECFSZ     R12+0, 1
	GOTO       L_stepper_bullet1156
	NOP
	NOP
;ATRESSUBMIT.c,340 :: 		PORTD = PORTD & 0xF0;
	MOVLW      240
	ANDWF      PORTD+0, 1
;ATRESSUBMIT.c,341 :: 		}
L_end_stepper_bullet1:
	RETURN
; end of _stepper_bullet1

_stepper_bullet2:

;ATRESSUBMIT.c,343 :: 		void stepper_bullet2(){
;ATRESSUBMIT.c,344 :: 		PORTD = PORTD & 0xF9;
	MOVLW      249
	ANDWF      PORTD+0, 1
;ATRESSUBMIT.c,345 :: 		PORTD = PORTD | 0x09;
	MOVLW      9
	IORWF      PORTD+0, 1
;ATRESSUBMIT.c,346 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_stepper_bullet2157:
	DECFSZ     R13+0, 1
	GOTO       L_stepper_bullet2157
	DECFSZ     R12+0, 1
	GOTO       L_stepper_bullet2157
	NOP
	NOP
;ATRESSUBMIT.c,347 :: 		PORTD = PORTD & 0xFC;
	MOVLW      252
	ANDWF      PORTD+0, 1
;ATRESSUBMIT.c,348 :: 		PORTD = PORTD | 0x0C;
	MOVLW      12
	IORWF      PORTD+0, 1
;ATRESSUBMIT.c,349 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_stepper_bullet2158:
	DECFSZ     R13+0, 1
	GOTO       L_stepper_bullet2158
	DECFSZ     R12+0, 1
	GOTO       L_stepper_bullet2158
	NOP
	NOP
;ATRESSUBMIT.c,350 :: 		PORTD = PORTD & 0xF6;
	MOVLW      246
	ANDWF      PORTD+0, 1
;ATRESSUBMIT.c,351 :: 		PORTD = PORTD | 0x06;
	MOVLW      6
	IORWF      PORTD+0, 1
;ATRESSUBMIT.c,352 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_stepper_bullet2159:
	DECFSZ     R13+0, 1
	GOTO       L_stepper_bullet2159
	DECFSZ     R12+0, 1
	GOTO       L_stepper_bullet2159
	NOP
	NOP
;ATRESSUBMIT.c,353 :: 		PORTD = PORTD & 0xF3;
	MOVLW      243
	ANDWF      PORTD+0, 1
;ATRESSUBMIT.c,354 :: 		PORTD = PORTD | 0x03;
	MOVLW      3
	IORWF      PORTD+0, 1
;ATRESSUBMIT.c,355 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_stepper_bullet2160:
	DECFSZ     R13+0, 1
	GOTO       L_stepper_bullet2160
	DECFSZ     R12+0, 1
	GOTO       L_stepper_bullet2160
	NOP
	NOP
;ATRESSUBMIT.c,356 :: 		PORTD = PORTD & 0xF0;
	MOVLW      240
	ANDWF      PORTD+0, 1
;ATRESSUBMIT.c,357 :: 		}
L_end_stepper_bullet2:
	RETURN
; end of _stepper_bullet2
