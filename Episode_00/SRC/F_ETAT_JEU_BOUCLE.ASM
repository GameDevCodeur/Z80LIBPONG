
F_ETAT_JEU_INITIALISATION

	; Eteindre ecran
	CALL F_ETEINDRE_ENCRES

	; Nettoyer ecran
	LD   HL, #C000
	mCLEAR_BUFFER (VOID)

	; Afficher ball
 	LD   HL, ENT_BALL.IMAGE
 	LD 	 DE, ENT_BALL_PTR 	
 	LD   B, ENT_BALL_NBL
	CALL F_CHAR_4xB_M0

	; Allumer ecran
	LD   B, HI(GA_PORT)

	LD   A, GA_PEN_6   
    LD   D, HW_BRIGHT_WHITE
    mGA_SET_PEN_INK

    ;LD   A, GA_PEN_7
    ;LD   D, HW_WHITE
    ;mGA_SET_PEN_INK

RET

F_ETAT_JEU
RET

;================================================================
;  INSERTION DES DONNEES
;================================================================

ENT_BALL_PTR EQU #D2DE
ENT_BALL_NBL EQU 4

ENT_BALL

.VX
	DEFB #01

.IMAGE
	DEFB #14,#28
	DEFB #14,#28
	DEFB #14,#28
	DEFB #14,#28

ENT_BALL_END

