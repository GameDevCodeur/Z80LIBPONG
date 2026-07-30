
;================================================================
;  INSERTION DES FONCTIONS
;================================================================

INCLUDE "F_SCORE_INITIALISER.ASM"
INCLUDE "F_SCORE_AFFICHER.ASM"
INCLUDE "F_SCORE_INC_PLAYER.ASM"

;================================================================
;  INSERTION DES DONNEES
;================================================================

ENT_SCORE_JOUEUR_1
	.FNT_RAM
		DEFW FNT.CHAR_0			; 2o
	.VRAM
		DEFW #C09A 				; 2o
	.SCORE
		DEFB 0            		; 1o
ENT_SCORE_JOUEUR_1_END

ENT_SCORE_JOUEUR_2
	.FNT_RAM
		DEFW FNT.CHAR_0
	.VRAM
		DEFW #C0A2
	.SCORE
		DEFB 0
ENT_SCORE_JOUEUR_2_END
