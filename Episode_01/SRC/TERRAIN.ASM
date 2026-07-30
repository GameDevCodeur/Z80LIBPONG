
MACRO mAFFICHER_TERRAIN

	; Afficher ligne haut
	LD   DE, #C040 			; Adresse VRAM 
	LD    B, LARGEUR_ECRAN
	LD    A, PATTERN
	mDRAWHLINE (VOID) 		; BDEF!

	; Afficher ligne bas
	LD   DE, #C5C0 			; Adresse VRAM 
	LD   B, LARGEUR_ECRAN
	;LD   A, PATTERN
	mDRAWHLINE (VOID) 		; BDEF!

ENDM

LARGEUR_ECRAN EQU 32*2 		; 32 blocs 2 octets par bloc
PATTERN  	  EQU #14       ; Noir Blanc
