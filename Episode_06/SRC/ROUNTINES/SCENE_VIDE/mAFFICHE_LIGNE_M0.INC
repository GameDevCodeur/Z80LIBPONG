
; --------------------------------------------------------
; MACRO   : mAFFICHE_LIGNE_M0
; Rôle    : Copie 2 octets (1 ligne de motif Mode 0, sprite
;           2 pixels de large) via LDI vers l'écran (DE), puis
;           avance DE au début de la ligne pixel suivante si
;           demandé, en gérant correctement le franchissement
;           d'un bloc de 8 lignes de caractères (via
;           mSET_NEXTLINE_DE, pas un simple +#0800 qui serait
;           faux en cas de franchissement de bloc).
; Paramètres :
;   {SRC}    = source à charger dans HL avant les LDI
;              (adresse immédiate ou variable mémoire)
;   {AVANCE} = 1 pour avancer à la ligne suivante, 0 sinon
;              (dernière ligne d'un sprite : pas d'avance)
; Entrée  : DE = adresse écran ligne courante
; Sortie  : DE = adresse écran ligne suivante (si AVANCE=1)
; Détruit : AF, BC, DE, HL
; Dépend  : mSET_NEXTLINE_DE
; --------------------------------------------------------

IFNDEF _HAS_mSET_NEXTLINE_DE
    FAIL "mAFFICHE_LIGNE_M0 nécessite mSET_NEXTLINE_DE : incluez-la avant ce fichier"
ENDIF

MACRO mAFFICHE_LIGNE_M0 SRC, AVANCE
    LD    HL, {SRC}
    LDI : LDI                     ; Copie 2 octets (1 ligne de motif Mode 0)
    IF {AVANCE}
        DEC DE : DEC DE           ; Replace DE au début du bloc horizontal
        mSET_NEXTLINE_DE (VOID)   ; Passe à la ligne VRAM suivante
    ENDIF
MEND
