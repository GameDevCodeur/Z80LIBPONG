
; --------------------------------------------------------
; ROUTINE : F_BALL_LOGIQUE
; Rôle    : Met à jour l'entitée balle pour une frame          
;           Sauvegarde l'ancienne adresse VRAM dans OldVramAddr
;           pour que la phase d'affichage sache quoi effacer.
;
; Entrée  : ENT_PIXEL.PosX, ENT_PIXEL.VelX, ENT_PIXEL.VramAddr
; Sortie  : ENT_PIXEL.OldVramAddr = ancienne VramAddr
;           ENT_PIXEL.PosX/VelX/Parite/VramAddr mis à jour
;
; Détruit : AF, BC, HL
;
; Dépend  : F_BALL_CALCULATE_HORIZONTAL_BOUNCE
;           F_PIXEL_APPLIQUER_DEPLACEMENT
; --------------------------------------------------------
F_BALL_LOGIQUE
    LD   HL, (ENT_PIXEL.VramAddr)
    LD   (ENT_PIXEL.OldVramAddr), HL
 
    CALL F_BALL_CALCULATE_HORIZONTAL_BOUNCE    ; AFBC! 
    CALL F_BALL_APPLY_HORIZONTAL_DISPLACEMENT  ; AFHL!
    
    CALL F_BALL_CALCULATE_VERTICAL_BOUNCE      ; AFBC!
    JR   F_BALL_APPLY_VERTICAL_DISPLACEMENT    ; AFHL!
    