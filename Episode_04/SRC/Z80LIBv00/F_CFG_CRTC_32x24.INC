
INCLUDE "CRTC/CRTC_TABLE_32x24.INC"

; -------------------------------------------------------------------------
; ROUTINE : F_CONFIG_CRTC
; -------------------------------------------------------------------------
; Entrée  : Aucune
; Sortie  : Aucune
; Modifie : AF, BC, HL (selon l'implémentation de la macro)
; -------------------------------------------------------------------------
F_CFG_CRTC_32x24
    LD   HL, CRTC_TABLE_32x24
    LD    C, 13
    mCRTC_SCR_SETUP (VOID) 
    RET

