; =============================================================================
; CONFIGURATION DE LA GÉOMÉTRIE DE L'ÉCRAN (CRTC 6845)
; =============================================================================
; Description : Initialise les registres du contrôleur vidéo pour définir
;               une zone d'affichage personnalisée de 256x192 pixels (Mode 1).
;               Idéal pour centrer l'écran et booster les performances du moteur.
; =============================================================================

HAUTEUR_PIXELS    EQU 192           ; Hauteur de l'écran en lignes de pixels

; -------------------------------------------------------------------------
; ROUTINE : F_CONFIG_CRTC
; -------------------------------------------------------------------------
; Entrée  : Aucune
; Sortie  : Aucune
; Modifie : AF, BC, HL (selon l'implémentation de la macro)
; -------------------------------------------------------------------------
F_CONFIG_CRTC
    LD   HL, TAB_CRTC           ; HL = Adresse des données de configuration
    LD    C, 13                 ;  C = Nombre de registres à copier (13)
    
    ; Appelle la macro matérielle pour envoyer la table au CRTC
    mCRTC_SCR_SETUP (VOID)          
    RET

; -------------------------------------------------------------------------
; TABLE DES VALEURS DES REGISTRES CRTC INVERSE
; -------------------------------------------------------------------------
TAB_CRTC
    DB  #00                     ; R13 - Adresse de départ écran poids faible
    DB  #30                     ; R12 - Adresse de départ écran poids fort (#30 -> #C000)
    DB  0                       ; R11 - Ligne de fin du curseur
    DB  0                       ; R10 - Ligne de début du curseur (0 = caché)
    DB  7                       ; R9  - Hauteur d'un caractère (7 = 8 lignes de pixels)
    DB  0                       ; R8  - Mode de balayage (0 = Pas d'entrelacement)
    DB  30                      ; R7  - Position de la synchronisation verticale
    DB  HAUTEUR_PIXELS / 8      ; R6  - Hauteur visible (24 lignes de caractères)
    DB  #00                     ; R5  - Ajustement vertical fin
    DB  38                      ; R4  - Hauteur totale de la trame
    DB  #86                     ; R3  - Largeur des pulses de synchro (H=14, V=9)
    DB  42                      ; R2  - Position de la synchronisation horizontale
    DB  32                      ; R1  - Largeur visible (32 caractères = 256 pixels)
    DB  #3F                     ; R0  - Largeur totale de la ligne
TAB_CRTC_
