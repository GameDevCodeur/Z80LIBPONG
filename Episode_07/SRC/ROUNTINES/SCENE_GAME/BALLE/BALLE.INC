
;================================================================
;  INSERTION DES FONCTIONS
;================================================================

	INCLUDE "F_BALLE_INITIALISER.ASM"
	INCLUDE "F_BALLE_AFFICHER.ASM"
	INCLUDE "F_BALLE_MISE_A_JOUR.ASM"

	INCLUDE "F_BALL_COLLISION.ASM"
	INCLUDE "COLLISION/F_BALL_PX_HDBD_COLLISION_PADDLE.ASM"	
	INCLUDE "COLLISION/F_BALL_PX_HGBG_COLLISION_PADDLE.ASM"
	INCLUDE "COLLISION/F_BALL_CHECK_EDGE.ASM"

	INCLUDE "F_BALL_ACCELERATION.ASM"

; ===============================================================
;  ENTITÉ BALLE
; ===============================================================

ENT_BALLE

.CX DEFB 0          			; Compteur de collision
.CR DEFB 0 						; Compteur de rebond pour l'accélération

.DX DEFB BALL_MOVE_RIGHT        ; Direction X (-1: Gauche, 1:Droite)
.SP DEFB 4 						; MAX 4 

.XY 
	DEFB #DF 					; Position Vram X
	DEFB #F2 					; Position Vram Y

.OLDXY 
	DEFB #DF 					; Position Vram X prècédente
	DEFB #F2 					; Position Vram Y prècédente

.IM_BALLE_FRAME0

	DEFB #14,#28
	DEFB #14,#28
	DEFB #14,#28
    DEFB #14,#28

.IM_BALLE_ERASE

	DEFB #00,#00 				; NOIR NOIR - NOIR NOIR - NOIR NOIR - NOIR NOIR
	DEFB #00,#00
	DEFB #00,#00
	DEFB #00,#00

.IM_BALLE_CURRENT
    DEFW ENT_BALLE.IM_BALLE_FRAME0

ENT_BALLE_END
