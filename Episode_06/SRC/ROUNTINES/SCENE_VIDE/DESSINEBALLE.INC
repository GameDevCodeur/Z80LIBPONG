
; --------------------------------------------------------
; ROUTINE : DESSINEBALLE
; Rôle    : Affiche le pixel/balle (2 px de large x 4 lignes)
;           à sa position VRAM courante, en choisissant le
;           motif graphique selon la parité (alignement pixel
;           gauche/droite dans l'octet écran).
; Entrée  : DE = adresse écran (ligne 0)
;           ENT_PIXEL.Parite = 0 (pair) ou 1 (impair)
; Sortie  : aucune
; Détruit : AF, BC, DE, HL
; Dépend  : mAFFICHE_LIGNE_M0, DonneesLigne
; --------------------------------------------------------
DESSINEBALLE:
    LD    A, (ENT_PIXEL.Parite) : AND   A
    JR    Z, .pair
    LD    HL, DonneesLigne+2                    ; Offset 1 (Pixel impair)
    JR    .store
.pair:
    LD    HL, DonneesLigne                      ; Offset 0 (Pixel pair)
.store:
    LD    (ENT_PIXEL.SrcPtr), HL
    mAFFICHE_LIGNE_M0 (ENT_PIXEL.SrcPtr), 1     ; Ligne 0
    mAFFICHE_LIGNE_M0 (ENT_PIXEL.SrcPtr), 1     ; Ligne 1
    mAFFICHE_LIGNE_M0 (ENT_PIXEL.SrcPtr), 1     ; Ligne 2
    mAFFICHE_LIGNE_M0 (ENT_PIXEL.SrcPtr), 0     ; Ligne 3
    RET
    