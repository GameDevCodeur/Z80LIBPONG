
;===============================================================
; F_CHAR_2xB_M0
;---------------------------------------------------------------
; Description : Affiche un caractère 2xB pixels (1 octets/ligne)
;               sur écran CPC Mode 0, ligne par ligne.
;
; Entrée      : HL = adresse du caractère source (2xB pixels)
;               DE = adresse destination en VRAM
;               B  = nombre de lignes (0..7) 
;
; Sortie      : Caractère copié en VRAM
;
; Registres modifiés : A, HL, DE, B
;===============================================================

F_CHAR_2xB_M0

	mPLOT (VOID) : INC HL
 	mSET_NEXTLINE_DE (VOID)
 	DJNZ F_CHAR_2xB_M0
 	RET
 	
F_CHAR_2xB_M0_END

