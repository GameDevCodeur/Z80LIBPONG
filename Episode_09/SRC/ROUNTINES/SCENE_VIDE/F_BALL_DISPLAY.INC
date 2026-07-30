
; --------------------------------------------------------
; ROUTINE : F_BALL_DISPLAY
; Rôle    : Efface la balle à son ancienne position VRAM
;           puis la redessine à sa position courante.
; Entrée  : ENT_PIXEL.OldVramAddr, ENT_PIXEL.VramAddr
; Sortie  : aucune
; Détruit : AF, BC, DE, HL
; Dépend  : F_BALL_ERASE, F_BALL_DRAW
; --------------------------------------------------------
F_BALL_DISPLAY

    LD   DE, (ENT_PIXEL.OldVramAddr)
    CALL F_BALL_ERASE
 
    LD   DE, (ENT_PIXEL.VramAddr)
    JP   F_BALL_DRAW
    