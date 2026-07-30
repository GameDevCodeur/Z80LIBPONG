;-----------------------------------------------------------
; BALL_CHECK_EDGE
;-----------------------------------------------------------
; Description :
;   Verifie si la balle a atteint le bord (gauche ou droit)
;   du terrain, en comparant le compteur de collision CX aux
;   constantes BALL_EDGE_RIGHT et LIMITE_BORD_GAUCHE.
;   Si un bord est atteint, inverse le sens du deplacement
;   en mettant a jour DX en consequence.
;
; Entree :
;   ENT_BALLE.CX    : compteur de detection de collision
;   BALL_EDGE_RIGHT : valeur seuil du bord droit
;   BALL_EDGE_LEFT  : valeur seuil du bord gauche
;
; Sortie :
;   ENT_BALLE.DX    : mis a jour uniquement si rebond detecte
;                    - CX = BALL_EDGE_RIGHT  -> DX = -1
;                    - CX = BALL_EDGE_LEFT -> DX = 1
;                   sinon DX n'est pas modifie.
;
; Registres modifies : AFHLIX!
;
; Remarques :
;   - Sortie anticipee (RET NZ) si aucun bord n'est atteint,
;     sans toucher a DX.
;-----------------------------------------------------------
F_BALL_CHECK_EDGE

    LD   A, (ENT_BALLE.CX)
    CP   BALL_EDGE_RIGHT    
    JR   Z, .EDGE_RIGHT
    CP   BALL_EDGE_LEFT
    RET  NZ                     ; ni bord gauche ni droit -> sortie directe

.EDGE_LEFT
    LD   IX, ENT_SCORE_JOUEUR_2
    CALL F_SCORE_INC_PLAYER     ; AFHL!
    LD   A, BALL_MOVE_RIGHT
    JR   MAJ_DX

.EDGE_RIGHT    
    LD   IX, ENT_SCORE_JOUEUR_1
    CALL F_SCORE_INC_PLAYER     ; AFHL!
    LD   A, BALL_MOVE_LEFT

MAJ_DX
    LD   (ENT_BALLE.DX), A
    RET