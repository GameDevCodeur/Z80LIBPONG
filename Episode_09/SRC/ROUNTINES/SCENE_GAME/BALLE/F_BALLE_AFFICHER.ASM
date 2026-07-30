
; --------------------------------------------------------
; ROUTINE : F_BALLE_AFFICHER
; Rôle    : Efface la balle à son ancienne position puis la
;           redessine à sa position courante (4x4 en Mode 0).
; Entrée  : ENT_BALLE.OLDXY, ENT_BALLE.XY,
;           ENT_BALLE.IM_BALLE_ERASE, ENT_BALLE.IM_BALLE_CURRENT
; Sortie  : aucune
; Détruit : AF, DE, HL (via F_COPYTOVRAM_4x4_M0)
; Dépend  : F_COPYTOVRAM_4x4_M0
; --------------------------------------------------------
F_BALLE_AFFICHER

    ; Effacer BALLE
    LD   HL, ENT_BALLE.IM_BALLE_ERASE
    LD   DE, (ENT_BALLE.OLDXY)
    CALL F_COPYTOVRAM_4x4_M0

    ; Afficher BALLE
    LD   HL, (ENT_BALLE.IM_BALLE_CURRENT)
    LD   DE, (ENT_BALLE.XY)
    JP   F_COPYTOVRAM_4x4_M0
    