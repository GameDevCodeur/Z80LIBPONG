
INCLUDE "BALLE/F_BALLE_MISE_A_JOUR.ASM"
INCLUDE "BALLE/F_BALLE_AFFICHER.ASM"
INCLUDE "BALLE/F_BALLE_VERIFER_REBOND.ASM"

;================================================================
;  INSERTION DES DONNEES
;================================================================

ENT_BALLE_NBL       EQU   4
LIMITE_BORD_DROIT   EQU  31
LIMITE_BORD_GAUCHE  EQU -31

ENT_BALLE

.CX DEFB 0          ; CONX
.DX DEFB 1          ; DIRX (-1:G, 1:D) 

.XY 
	DEFB #DF 		; POSX
	DEFB #F2 		; POSY

.OLDXY 
	DEFB #DF 		; POSX
	DEFB #F2 		; POSY

.IM_BALLE_FRAME0

	DEFB #14,#28
	DEFB #14,#28
	DEFB #14,#28
    DEFB #14,#28

.IM_BALLE_ERASE

	DEFB #00,#00 	; NOIR NOIR - NOIR NOIR - NOIR NOIR - NOIR NOIR
	DEFB #00,#00
	DEFB #00,#00
	DEFB #00,#00

.IM_BALLE_CURRENT
    DEFW ENT_BALLE.IM_BALLE_FRAME0

ENT_BALLE_END
