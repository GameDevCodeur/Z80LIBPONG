; --------------------------------------------------------
; ROUTINE : F_SCORE_AFFICHER
; Rôle    : Affiche un glyphe de score (chiffre) en Mode 0,
;           1 bit source = 1 octet écran (2 pixels identiques).
;           Appelée uniquement quand le score change (pas
;           chaque frame) -> pas de contrainte de vitesse forte.
; Entrée  :
;   HL = adresse écran de départ (coin haut-gauche du glyphe)
;   DE = adresse des données du glyphe (1 octet par ligne,
;        bit -> pixel, cf. sens LSB/MSB à vérifier selon
;        l'encodage de SCORE_GLIPHS)
; Sortie  : aucune
; Détruit : AF, BC, DE, HL
; Constantes utilisées :
;   SCORE_GLIPH_WIDTH   : largeur du glyphe en bits/pixels
;   SCORE_GLIPH_HEIGHT  : hauteur du glyphe en lignes
;   SCORE_PATTERN       : octet écran (2 pixels) couleur "chiffre"
;   SCORE_BG_PATTERN    : octet écran (2 pixels) couleur fond
; Dépend  : mSET_NEXTLINE_HL (macro externe, passage ligne pixel suivante)
; --------------------------------------------------------

F_SCORE_AFFICHER
    LD   C, SCORE_GLIPH_HEIGHT
.nextline
    LD   A, (DE)
    PUSH HL
    LD   B, SCORE_GLIPH_WIDTH
.bit_next
    RRCA
    JR   NC, .bg
    LD   (HL), SCORE_PATTERN
    JR   .skip
.bg
    LD   (HL), SCORE_BG_PATTERN
.skip
    INC  HL
    DJNZ .bit_next
    POP  HL
    mSET_NEXTLINE_HL (VOID)
    INC  DE
    DEC  C
    JR   NZ, .nextline
    
    RET