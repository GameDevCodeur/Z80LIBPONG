
; =============================================================================
; FONCTION    : F_ATTENTE_VBL
; =============================================================================
; Description : Bloque le CPU en attendant le signal de synchronisation verticale 
;               (VBL / VSYNC) de l'écran. Aligne le jeu sur un timing de 50 Hz.
; Entrée      : Aucune
; Sortie      : Aucune
; Modifie     : AF, B (selon l'implémentation de la macro mPPI_GET_VBL)
; =============================================================================
F_ATTENTE_VBL

    ; --- Appel de la Macro Matérielle ---
    ; Cette macro lit le port B du PPI (0xF5xx) et boucle tant que le bit 0 est à 0.
    mPPI_GET_VBL (VOID)

    RET                         ; Fin de l'attente, la frame commence !
    
F_ATTENTE_VBL_