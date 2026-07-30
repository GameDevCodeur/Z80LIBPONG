
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

    ; IM1 BLINK TEXTE
    LD	 HL, F_IM1_TEXT_BLINK
    LD   (ARRAY_IM1_MENU), HL
    
RET

F_ETAT_MENU

    LD   A, (KBD_BUFFER_SPACE)
    CP   KBD_KEY_SPACE
    RET  NZ

ETAT_JEU
    LD   B, ID_ETAT_JEU  
    JP   F_CHANGER_ETAT_JEU

;================================================================
;  INSERTION DES DONNEES
;================================================================

TXT_PTR EQU #C30C
TXT_NBL EQU 8
PAL_NBE EQU 8

SCR_MENU_PAL
    INCLUDE "PNG/BIN/SCR_MENU.PAL"
SCR_MENU_PAL_END

SCR_MENU_ZX0
	INCZX0 "PNG/BIN/SCR_MENU.BIN"
SCR_MENU_ZX0_END

INCLUDE "FNT/FNT.INC"
