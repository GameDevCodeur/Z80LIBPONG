
; ===============================================================
;  INSERTION DES FONCTIONS
; ===============================================================

INCLUDE "F_IA_PADDLE_AFFICHER.ASM"

; ===============================================================
;  ENTITÉ IA
; ===============================================================

ENT_IA

.VRAM_XY
	DEFB #BE 							; VRAM X
	DEFB #E2 							; VRAM Y

.OLD_XY
	DEFB #BE 							; VRAM X
	DEFB #E2 							; VRAM Y

.IM_PADDLE_FRAME0
	DEFS PADDLE_HEIGHT, PADDLE_PATTERN

.IM_PADDLE_ERASE
	DEFS PADDLE_HEIGHT, PADDLE_BG_PATTERN

.IM_PADDLE_CURRENT
	DEFW ENT_IA.IM_PADDLE_FRAME0

ENT_IA_END
