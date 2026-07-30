
; --------------------------------------------------------
; ROUTINE : EFFACEBALLE
; Rôle    : Efface le pixel/balle (2 px de large x 4 lignes)
;           à sa position VRAM courante, en écrivant des
;           octets à zéro (noir) sur les 4 lignes du sprite.
; Entrée  : DE = adresse écran (ligne 0)
; Sortie  : aucune
; Détruit : AF, BC, DE, HL
; Dépend  : mBLIT_LINE_M0, DATALINE (bloc zéros à +4)
; --------------------------------------------------------

EFFACEBALLE:
    mBLIT_LINE_M0 DATALINE_CLEAR, DATALINE_BYTES, 1   ; Ligne 0 (rempli de zéros)
    mBLIT_LINE_M0 DATALINE_CLEAR, DATALINE_BYTES, 1   ; Ligne 1
    mBLIT_LINE_M0 DATALINE_CLEAR, DATALINE_BYTES, 1   ; Ligne 2
    mBLIT_LINE_M0 DATALINE_CLEAR, DATALINE_BYTES, 0   ; Ligne 3 (pas d'avance)
    RET
