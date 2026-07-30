
; --------------------------------------------------------
; ROUTINE : F_PIXEL_RENDU
; Rôle    : Efface le pixel à son ancienne position VRAM, puis
;           le redessine à sa position courante. Ne connaît
;           rien de la logique de déplacement/rebond.
; Entrée  : ENT_PIXEL.OldVramAddr, ENT_PIXEL.VramAddr
; Sortie  : aucune
; Détruit : AF, BC, DE, HL
; Dépend  : EffaceBalle, DessineBalle
; --------------------------------------------------------
F_PIXEL_RENDU
    LD   DE, (ENT_PIXEL.OldVramAddr)
    CALL EffaceBalle
 
    LD   DE, (ENT_PIXEL.VramAddr)
    JP   DessineBalle

    