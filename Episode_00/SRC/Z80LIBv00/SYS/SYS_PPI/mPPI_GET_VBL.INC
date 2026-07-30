;============================================================
; mPPI_GET_VBL
; Attend le signal VSYNC (VBL) via le port B du PPI
;
; Entrée  : -
; Sortie  : -
; Modifie : AF, B
;============================================================
MACRO mPPI_GET_VBL
    LD   B, HI(PPI_PORT_B)  ; 2o  7c  — B = 0xF5
@wait_vbl:
    IN   A, (C)             ; 2o 11c  — lit port B PPI
    RRCA                    ; 1o  4c  — bit 0 (VSYNC) → carry
    JR   NC, @wait_vbl      ; 2o 12c  — boucle si VSYNC = 0
MEND                        ; 7o 34c  (hors boucle)