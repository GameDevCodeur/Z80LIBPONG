
; -------------------------------------------------------------------------
; F_IM1_CALLBACK : Routine de traitement du signal (appelée à 300 Hz)
; -------------------------------------------------------------------------
; Note : Le Gate Array du CPC génère 6 interruptions par frame (52 lignes).
;        On utilise le PPI pour isoler la VBL et n'agir qu'à 50 Hz.
; -------------------------------------------------------------------------
F_IM1_CALLBACK

    ; 1. SAUVEGARDE DU CONTEXTE
    EXX
    EX   AF, AF'

    ; 2. SÉPARATION DES 6 IT
    LD   A, HI(PPI_PORT_B)          ; Port B du PPI (#F5XX)
    IN   A, (0)                     ; Lit le port d'E/S 0 et stocke le résultat dans A
    RRCA                            ; Décale le bit 0 dans le "Carry" du CPU
    JR   NC, INT_SKIPINITFIRST      ; Si Carry = 0, ce n'est pas la VBL -> On quitte

    ; 3. DEBUT DE FRAME (Fréquence exacte de 50 Hz)
    LD   HL, FRAME_READY            ; Pointeur vers le drapeau de synchro    
    LD   (HL), #00                  ; Met le drapeau à 0 pour libérer la boucle

    LD   A, IM1_FIRST_VALUE         ; A = -1
    LD   (IM1_INDEX), A             ; Sauvegarde l'index A

; ------------------------------------------------------------
; GESTION D'UN COMPTEUR D'INDEX (AVEC DÉBORDEMENT)
; ------------------------------------------------------------
; Variables :
;   INT_INDEX    : compteur courant (0-5 normalement)
;   INT_NOTREADY : valeur spéciale indiquant "non prêt" (ex: 0FFh)
; ------------------------------------------------------------
INT_SKIPINITFIRST

    LD   A, (IM1_INDEX)             ; Charge la valeur courante de l'index
    CP   IM1_NOT_READY              ; Compare avec la valeur "non prêt"
    JR   Z, F_IM1_SKIP              ; Si égal → sauter (ne pas incrémenter)

    INC  A                          ; Incrémente l'index (A = A + 1)
    CP   IM1_IT_MAX                 ; Compare avec 6 IT
    JR   NZ, INT_CURRENT            ; Si différent de 6 → pas de remise à zéro

    XOR  A                          ; Si A = 6 → remet A à 0 (XOR A = 0)
    
; ------------------------------------------------------------
; GESTION DE TABLEAU DE POINTEURS (VECTEURS D'INTERRUPTION)
; ------------------------------------------------------------
; INT_INDEX   contient l'index (0,1,2...) du vecteur à appeler
; INT_CURRENT pointe vers un tableau de mots (pointeurs 16 bits)
; ------------------------------------------------------------
INT_CURRENT

    LD   (IM1_INDEX), A             ; Sauvegarde l'index A

    ADD  A, A                       ; Double l'index (chaque entrée = 2 bytes)
    LD   C, A                       ; C = offset bas (A × 2)
    LD   B, 0                       ; BC = offset 16 bits (A × 2)

    LD   HL, (IM1_CURRENT)          ; HL = adresse de base du tableau de vecteurs
    ADD  HL, BC                     ; HL pointe vers l'entrée [index] du tableau
                                    ; HL = IM1_CURRENT + (A × 2)

    LD   A, (HL)                    ; A = octet bas du pointeur
    INC  HL                         ; HL pointe vers l'octet haut
    LD   H, (HL)                    ; H = octet haut du pointeur
    LD   L, A                       ; L = octet bas (précédemment chargé)
    JP   (HL)                       ; HL = adresse complète de la fonction

; ------------------------------------------------------------
; DONNÉES POUR LE SYSTÈME D'INTERRUPTIONS VECTORISÉES
; ------------------------------------------------------------

; ------------------------------------------------------------
; VARIABLE : IM1_INDEX
; ------------------------------------------------------------
IM1_INDEX:
    DEFB IM1_NOT_READY              ; Valeur initiale = -2 ou 0xFE
                                    ; Indique que l'index est "non prêt"
                                    ; Pas encore d'interruption à traiter

; ------------------------------------------------------------
; POINTEUR : IM1_CURRENT
; ------------------------------------------------------------
IM1_CURRENT:
    DEFW ARRAY_IM1_DEFAUT           ; Pointe vers le tableau de vecteurs par défaut
