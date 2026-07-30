
; --------------------------------------------------------
; ROUTINE : F_PIXEL_LOGIQUE
; Rôle    : Met à jour l'état complet du pixel pour une frame
;           (position, vitesse, parité, adresse VRAM), sans
;           toucher à l'écran. Sauvegarde l'ancienne adresse
;           VRAM dans OldVramAddr avant modification, pour que
;           la phase d'affichage sache quoi effacer.
; Entrée  : ENT_PIXEL.PosX, ENT_PIXEL.VelX, ENT_PIXEL.VramAddr
; Sortie  : ENT_PIXEL.OldVramAddr = ancienne VramAddr
;           ENT_PIXEL.PosX/VelX/Parite/VramAddr mis à jour
; Détruit : AF, BC, HL
; Dépend  : F_PIXEL_CALCULER_REBOND, F_PIXEL_APPLIQUER_DEPLACEMENT
; --------------------------------------------------------
F_PIXEL_LOGIQUE
    LD   HL, (ENT_PIXEL.VramAddr)
    LD   (ENT_PIXEL.OldVramAddr), HL
 
    CALL F_PIXEL_CALCULER_REBOND            ; AFBC! 
    JR   F_PIXEL_APPLIQUER_DEPLACEMENT      ; AFHL!
    