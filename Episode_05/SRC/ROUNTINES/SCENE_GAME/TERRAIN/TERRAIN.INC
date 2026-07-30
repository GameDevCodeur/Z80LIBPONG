
; --------------------------------------------------------
; MACRO : mAFFICHER_TERRAIN
; Rôle  : Dessine les deux bordures horizontales du terrain
;         (ligne haut et ligne bas) en Mode 0.
; Entrée  : aucune 
; Sortie  : aucune
; Détruit : AFBDE!
; Dépend  : mDRAWHLINE (macro externe, cf. Z80LIB)
; --------------------------------------------------------

MACRO mAFFICHER_TERRAIN

	; Afficher ligne haut
	LD   DE, TERRAIN_VRAM_HIGH_WALL
	LD    B, SCR_WIDTH
	LD    A, TERRAIN_WALL_PATTERN
	mDRAWHLINE (VOID) 		; BDEF!

	; Afficher ligne bas
	LD   DE, TERRAIN_VRAM_BOTTON_WALL
	LD   B, SCR_WIDTH
	;LD   A, TERRAIN_WALL_PATTERN
	mDRAWHLINE (VOID) 		; BDEF!

ENDM
