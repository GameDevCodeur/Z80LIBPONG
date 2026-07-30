
INCLUDE "PADDLE/F_PADDLE_AFFICHER.ASM"
INCLUDE "PADDLE/F_PADDLE_MISE_A_JOUR.ASM"

;================================================================
;  INSERTION DES DONNEES
;================================================================

ENT_PADDLE_NBL 	  		EQU 3*8
ENT_PADDLE_LIMITE_BAS   EQU  74
ENT_PADDLE_LIMITE_HAUT 	EQU -74

ENT_PADDLE

.CY DEFB 0 								; COMPTEUR LIMITE

.VRAM_XY
	DEFB #81 							; VRAM X
	DEFB #E2 							; VRAM Y

.OLD_XY
	DEFB #81 							; VRAM X
	DEFB #E2 							; VRAM Y

.IM_PADDLE_FRAME0
	DEFS ENT_PADDLE_NBL, #3C

.IM_PADDLE_ERASE
	DEFS ENT_PADDLE_NBL, #00

.IM_PADDLE_CURRENT
	DEFW ENT_PADDLE.IM_PADDLE_FRAME0

ENT_PADDLE_END
