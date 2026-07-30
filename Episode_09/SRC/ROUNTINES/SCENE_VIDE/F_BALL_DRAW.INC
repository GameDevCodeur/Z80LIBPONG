
; --------------------------------------------------------
; ROUTINE : F_BALL_DRAW
; Rôle    : Affiche le pixel/balle (2 px de large x 4 lignes)
;           à sa position VRAM courante, en choisissant le
;           motif graphique selon la parité (alignement pixel
;           gauche/droite dans l'octet écran).
; Entrée  : DE = adresse écran (ligne 0)
;           ENT_PIXEL.Parite = 0 (pair) ou 1 (impair)
; Sortie  : aucune
; Détruit : AF, BC, DE, HL
; Dépend  : mBLIT_LINE_M0, DATALIGNE_BYTES
; --------------------------------------------------------

F_BALL_DRAW
        LD    A, (ENT_PIXEL.Parite)
        AND   A : JR Z, .pair                   ; Si A=0, Z=1
        LD    HL, DATALINE+2                    ; Offset 1 (Pixel impair)
        JR    .store
.pair:  LD    HL, DATALINE                      ; Offset 0 (Pixel pair)
.store: LD    (ENT_PIXEL.SrcPtr), HL
        mBLIT_LINE_M0 (ENT_PIXEL.SrcPtr), DATALINE_BYTES, 1     ; Ligne 0
        mBLIT_LINE_M0 (ENT_PIXEL.SrcPtr), DATALINE_BYTES, 1     ; Ligne 1
        mBLIT_LINE_M0 (ENT_PIXEL.SrcPtr), DATALINE_BYTES, 1     ; Ligne 2
        mBLIT_LINE_M0 (ENT_PIXEL.SrcPtr), DATALINE_BYTES, 0     ; Ligne 3
        RET
    