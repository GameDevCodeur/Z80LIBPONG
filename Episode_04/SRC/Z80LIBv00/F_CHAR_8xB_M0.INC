
;===============================================================
; F_CHAR_8xB_M0
;---------------------------------------------------------------
; Description : Affiche un caractère 8xB pixels (4 octets/ligne)
;               sur écran CPC Mode 0, ligne par ligne.
;
; Entrée      : HL = adresse du caractère source (8xB pixels)
;               DE = adresse destination en VRAM
;               B  = nombre de lignes (0..7) 
;
; Sortie      : Caractère copié en VRAM
;
; Registres modifiés : A, HL, DE, B
;===============================================================

F_CHAR_8xB_M0

	; Copie 4 octets (8pixels) ligne
 	mPLOT (VOID) : INC HL : INC DE
 	mPLOT (VOID) : INC HL : INC DE
 	mPLOT (VOID) : INC HL : INC DE
 	mPLOT (VOID) : INC HL : DEC DE

 	DEC DE
 	DEC DE

 	; Ligne suivante
 	mSET_NEXTLINE_DE (VOID)
 	
 	DJNZ F_CHAR_8xB_M0

 	RET
 	
F_CHAR_8xB_M0_END

