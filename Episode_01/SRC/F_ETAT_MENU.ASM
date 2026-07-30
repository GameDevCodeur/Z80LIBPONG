
; ============================================================
; PROGRAMME : JEU - GESTION DES ETATS
; ============================================================
; FICHIER : ETAT_MENU.ASM
; DESCRIPTION : Gestion de l'état d'écran menu
; ============================================================

F_ETAT_MENU_INITIALISATION

	; Eteindre ecran
	CALL F_ETEINDRE_ENCRES 

	; Nettoyer ecran
	LD   HL, #C000
	mCLEAR_BUFFER (VOID)

	; Afficher titre PONG
 	LD   HL, SCR_MENU_ZX0
 	LD   DE, #C000
 	CALL ZX0_DECOMPRESS

 	; Afficher 'PRESS SPACE TO START'
 	LD   HL, FNT_P
 	LD 	 DE, TXT_PTR 	
 	LD   B, TXT_NBL
	CALL F_CHAR_4xB_M0

	LD   HL, FNT_R
 	LD 	 DE, TXT_PTR+2 	
 	LD   B, TXT_NBL
	CALL F_CHAR_4xB_M0

	LD   HL, FNT_E
 	LD 	 DE, TXT_PTR+4 	
 	LD   B, TXT_NBL
	CALL F_CHAR_4xB_M0

	LD   HL, FNT_S
 	LD 	 DE, TXT_PTR+6 	
 	LD   B, TXT_NBL
	CALL F_CHAR_4xB_M0

	LD   HL, FNT_S
 	LD 	 DE, TXT_PTR+8 	
 	LD   B, TXT_NBL
	CALL F_CHAR_4xB_M0

	LD   HL, FNT_S
 	LD 	 DE, TXT_PTR+12 	
 	LD   B, TXT_NBL
	CALL F_CHAR_4xB_M0

	LD   HL, FNT_P
 	LD 	 DE, TXT_PTR+14
 	LD   B, TXT_NBL
	CALL F_CHAR_4xB_M0

	LD   HL, FNT_A
 	LD 	 DE, TXT_PTR+16 	
 	LD   B, TXT_NBL
	CALL F_CHAR_4xB_M0

	LD   HL, FNT_C
 	LD 	 DE, TXT_PTR+18 	
 	LD   B, TXT_NBL
	CALL F_CHAR_4xB_M0

	LD   HL, FNT_E
 	LD 	 DE, TXT_PTR+20 	
 	LD   B, TXT_NBL
	CALL F_CHAR_4xB_M0

	LD   HL, FNT_T
 	LD 	 DE, TXT_PTR+24 	
 	LD   B, TXT_NBL
	CALL F_CHAR_4xB_M0

	LD   HL, FNT_O
 	LD 	 DE, TXT_PTR+26 	
 	LD   B, TXT_NBL
	CALL F_CHAR_4xB_M0

	LD   HL, FNT_S
 	LD 	 DE, TXT_PTR+30 	
 	LD   B, TXT_NBL
	CALL F_CHAR_4xB_M0

	LD   HL, FNT_T
 	LD 	 DE, TXT_PTR+32 	
 	LD   B, TXT_NBL
	CALL F_CHAR_4xB_M0

	LD   HL, FNT_A
 	LD 	 DE, TXT_PTR+34 	
 	LD   B, TXT_NBL
	CALL F_CHAR_4xB_M0

	LD   HL, FNT_R
 	LD 	 DE, TXT_PTR+36 	
 	LD   B, TXT_NBL
	CALL F_CHAR_4xB_M0

	LD   HL, FNT_T
 	LD 	 DE, TXT_PTR+38 	
 	LD   B, TXT_NBL
	CALL F_CHAR_4xB_M0

	; Allumer ecran
 	LD   HL, SCR_MENU_PAL
    LD   BC, GA_PORT
    LD   A, PAL_NBE
    mGA_SET_PALETTE (VOID)

	; Initialse le compteur de frames   
    XOR A
    LD (TICK_FRAME), A
    LD (TICK_FRAME+1), A
        
RET

F_TEXT_BLINKED

	LD   B, HI(GA_PORT)

	LD   A, (TICK_FRAME)	
	
	CP   TXT_BLINK_BLANC
	JR   Z, F_TEXT_NOIR
	
	CP   TXT_BLINK_NOIR
	JR   Z, F_TEXT_BLANC

	RET
	
F_TEXT_BLANC

	LD   A, GA_PEN_6   
    LD   D, HW_BRIGHT_WHITE
    mGA_SET_PEN_INK (VOID)

    LD   A, GA_PEN_7   
    LD   D, HW_WHITE
    mGA_SET_PEN_INK (VOID)

    XOR A
    LD (TICK_FRAME), A

	RET

F_TEXT_NOIR

	LD   A, GA_PEN_6   
    LD   D, HW_BLACK
    mGA_SET_PEN_INK

    LD   A, GA_PEN_7   
    mGA_SET_PEN_INK
    
	RET

F_ETAT_MENU

	CALL F_TEXT_BLINKED	
    mKEY_SPACE_REQUESTED (VOID) : RET  NZ

ETAT_JEU
    LD   B, ID_ETAT_JEU  
    JP   F_CHANGER_ETAT_JEU


;================================================================
;  INSERTION DES DONNEES
;================================================================

TXT_PTR EQU #C30C
TXT_NBL EQU 8
PAL_NBE EQU 8

TXT_BLINK_BLANC EQU 30 
TXT_BLINK_NOIR  EQU 60

SCR_MENU_PAL
    INCLUDE "PNG/BIN/SCR_MENU.PAL"
SCR_MENU_PAL_END

SCR_MENU_ZX0
	INCZX0 "PNG/BIN/SCR_MENU.BIN"
SCR_MENU_ZX0_END

