
; --------------------------------------------------------
; ROUTINE : F_PADDLE_AFFICHER
; Rôle    : Efface la raquette à son ancienne position puis
;           la redessine à sa position courante (24x2 en Mode 0).
; Entrée  : ENT_PADDLE.OLD_XY, ENT_PADDLE.VRAM_XY,
;           ENT_PADDLE.IM_PADDLE_ERASE, ENT_PADDLE.IM_PADDLE_CURRENT
; Sortie  : aucune
; Détruit : AF, DE, HL (via F_COPYTOVRAM_24x2_M0)
; Dépend  : F_COPYTOVRAM_24x2_M0
; --------------------------------------------------------
F_PADDLE_AFFICHER

    ; Effacer PADDLE
    LD   HL, ENT_PADDLE.IM_PADDLE_ERASE
    LD   DE, (ENT_PADDLE.OLD_XY)
    CALL F_COPYTOVRAM_24x2_M0                      ; AFDEHL!

    ; Afficher PADDLE
    LD   HL, (ENT_PADDLE.IM_PADDLE_CURRENT)
    LD   DE, (ENT_PADDLE.VRAM_XY)
    JP   F_COPYTOVRAM_24x2_M0                      ; AFDEHL!
