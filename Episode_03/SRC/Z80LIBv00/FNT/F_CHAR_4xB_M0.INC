
;===============================================================
; F_CHAR_4xB_M0
;---------------------------------------------------------------
; Description : Affiche un caractère 4xB pixels (2 octets/ligne)
;               sur écran CPC Mode 0, ligne par ligne.
;
; Entrée      : HL = adresse du caractère source (4xB pixels)
;               DE = adresse destination en VRAM
;               B  = nombre de lignes (0..7) 
;
; Sortie      : Caractère copié en VRAM
;
; Registres modifiés : A, HL, DE, B
;===============================================================

F_CHAR_4xB_M0

	; Copie 2 octets (4pixels) de la ligne
 	mPLOT (VOID) : INC HL : INC DE
 	mPLOT (VOID) : INC HL : DEC DE

 	; Ligne suivante
 	mSET_NEXTLINE_DE (VOID)
 	
 	DJNZ F_CHAR_4xB_M0

 	RET
 	
F_CHAR_4xB_M0_END

