
MISE_A_JOUR_BALLE

    LD   HL, ENT_BALLE.DX     ; HL pointe sur DX

    LD   A, (ENT_BALLE.XY)
    LD   (ENT_BALLE.OLDXY), A
    ADD  A, (HL)              ; A = XY + DX    
    LD   (ENT_BALLE.XY), A

    LD   A, (ENT_BALLE.CX)
    ADD  A, (HL)              ; A = CX + DX    
    LD   (ENT_BALLE.CX), A

    RET

AFFICHER_BALLE

    ; Effacer BALLE
 	LD   HL, ENT_BALLE.IM_BALLE_ERASE
 	LD 	 DE, (ENT_BALLE.OLDXY)
 	LD   B, ENT_BALLE_NBL
	CALL F_CHAR_4xB_M0

	; Afficher BALLE
 	LD   HL, ENT_BALLE.IM_BALLE_FRAME0
 	LD 	 DE, (ENT_BALLE.XY)
 	LD   B, ENT_BALLE_NBL
	JP F_CHAR_4xB_M0

; ============================================
; VÉRIFICATION DES BORDS
; ============================================
VERIFER_REBOND_BALLE
    
    LD   A, (ENT_BALLE.CX)
    
    CP   32
    JR   Z, REBOND_DROITE
    
    CP   -30
    RET  NZ                   ; ni bord gauche ni droit -> sortie directe

REBOND_GAUCHE
    LD   A, 1
    JR   MAJ_DX

REBOND_DROITE
    LD   A, -1

MAJ_DX
    LD   (ENT_BALLE.DX), A
    RET

;================================================================
;  INSERTION DES DONNEES
;================================================================

ENT_BALLE_NBL EQU 4

ENT_BALLE

.CX DEFB 0          ; CONX
.DX DEFB 1          ; DIRX (-1:G, 1:D) 

.XY 
	DEFB #DE 		; POSX
	DEFB #F2 		; POSY

.OLDXY 
	DEFB #DE 		; POSX
	DEFB #F2 		; POSY

.IM_BALLE_FRAME0

	DEFB #14,#28    ; NOIR BLANC - BLANC NOIR
	DEFB #14,#28
	DEFB #14,#28
	DEFB #14,#28

.IM_BALLE_ERASE

	DEFB #00,#00 	; NOIR NOIR - NOIR NOIR
	DEFB #00,#00
	DEFB #00,#00
	DEFB #00,#00

ENT_BALLE_END
