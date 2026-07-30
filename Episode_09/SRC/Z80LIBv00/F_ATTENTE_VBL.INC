
; =============================================================================
; FONCTION    : F_ATTENTE_VBL
; =============================================================================
; Description : Bloque le CPU en attente du signal de synchronisation verticale 
;               (VBL / VSYNC) de l'écran. Aligne le jeu sur un timing de 50 Hz.
; Entrée      : Aucune
; Sortie      : Aucune
; Modifie     : AF
; =============================================================================
F_ATTENTE_VBL
    
    mPPI_GET_VBL (VOID)    ; 7o
    RET

; SIZE : 7o + 1
