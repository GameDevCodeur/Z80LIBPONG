
; ===============================================================
;  INSERTION DES FONCTIONS
; ===============================================================
 
INCLUDE "F_PADDLE_INITIALISER.ASM"
INCLUDE "F_PADDLE_AFFICHER.ASM"
INCLUDE "F_PADDLE_MISE_A_JOUR.ASM"

; ===============================================================
;  ENTITÉ PADDLE
; ===============================================================

ENT_PADDLE

.CY DEFB 0 								; COMPTEUR LIMITE

.VRAM_XY
	DEFB #81 							; VRAM X
	DEFB #E2 							; VRAM Y

.OLD_XY
	DEFB #81 							; VRAM X
	DEFB #E2 							; VRAM Y

.IM_PADDLE_FRAME0
	DEFS PADDLE_HEIGHT, PADDLE_PATTERN

.IM_PADDLE_ERASE
	DEFS PADDLE_HEIGHT, PADDLE_BG_PATTERN

.IM_PADDLE_CURRENT
	DEFW ENT_PADDLE.IM_PADDLE_FRAME0

ENT_PADDLE_END
