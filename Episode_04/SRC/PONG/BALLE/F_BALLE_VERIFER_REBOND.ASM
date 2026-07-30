;-----------------------------------------------------------
; F_BALLE_VERIFER_REBOND
;-----------------------------------------------------------
; Description :
;   Verifie si la balle a atteint un bord (gauche ou droit)
;   du terrain, en comparant le compteur de collision CX aux
;   constantes LIMITE_BORD_DROIT et LIMITE_BORD_GAUCHE.
;   Si un bord est atteint, inverse le sens du deplacement
;   en mettant a jour DX en consequence.
;
; Entree :
;   ENT_BALLE.CX      : compteur de detection de collision
;   LIMITE_BORD_DROIT  : valeur seuil du bord droit
;   LIMITE_BORD_GAUCHE : valeur seuil du bord gauche
;
; Sortie :
;   ENT_BALLE.DX : mis a jour uniquement si rebond detecte
;                    - CX = LIMITE_BORD_DROIT  -> DX = -1
;                    - CX = LIMITE_BORD_GAUCHE -> DX = 1
;                  sinon DX n'est pas modifie.
;
; Registres modifies :
;   AF
;
; Remarques :
;   - Sortie anticipee (RET NZ) si aucun bord n'est atteint,
;     sans toucher a DX.
;-----------------------------------------------------------
F_BALLE_VERIFER_REBOND

    LD   A, (ENT_BALLE.CX)

    CP   LIMITE_BORD_DROIT
    JR   Z, .REBOND_DROITE

    CP   LIMITE_BORD_GAUCHE
    RET  NZ                     ; ni bord gauche ni droit -> sortie directe

.REBOND_GAUCHE  
    LD   IX, ENT_SCORE_JOUEUR_2
    CALL F_SCORE_INC_PLAYER     ; AFHL!
    LD   A, 1
    JR   MAJ_DX

.REBOND_DROITE    
    LD   IX, ENT_SCORE_JOUEUR_1
    CALL F_SCORE_INC_PLAYER     ; AFHL!
    LD   A, -1

MAJ_DX
    LD   (ENT_BALLE.DX), A
    RET