; -------------------------------------------------------------------------
; F_IM1_CALLBACK : Routine de traitement du signal (appelée à 300 Hz)
; -------------------------------------------------------------------------
; Note : Le Gate Array du CPC génère 6 interruptions par frame (52 lignes).
;        On utilise le PPI pour isoler la VBL et n'agir qu'à 50 Hz.
;
; Le test VBL est fait AVANT le test IM1_NOT_READY : ainsi, une VBL peut
; toujours réinitialiser le dispatch (A = IM1_FIRST_VALUE), même si
; IM1_INDEX avait été invalidé entre-temps par F_CHANGER_SCENE.
; -------------------------------------------------------------------------
F_IM1_CALLBACK

    ; SAUVEGARDE DU CONTEXTE
    EXX
    EX    AF, AF'
    PUSH  IX
    PUSH  IY

    ; DETECTER SYNCHRO VBL
    LD    A, HI(PPI_PORT_B)
    IN    A, (0)
    RRCA
    JR    NC, .NO_VBL

    ; DEBUT DE FRAME (Fréquence exacte de 50 Hz)
    LD    HL, FRAME_READY           ; Pointeur vers le drapeau de synchro
    XOR   A                         ; A = 0 (index de la 1ère IT de la frame)
    LD    (HL), A                   ; Met le drapeau à 0 pour libérer la boucle    
    JR    .DISPATCH  

.NO_VBL
    LD    A, (IM1_INDEX)
    CP    IM1_NOT_READY
    JR    Z, F_IM1_SKIP             ; pas de VBL et pas encore prêt -> sortie
    INC   A                         ; Incrémente l'index (A = A + 1)
    CP    IM1_IT_MAX                ; Compare avec 6 IT
    JR    C, .DISPATCH              ; si A < 6, DISPATCH
    XOR   A                         ; Si A >= 6 -> remet A à 0

.DISPATCH
    LD    (IM1_INDEX), A            ; Sauvegarde l'index A
    ADD   A, A                      ; Double l'index (chaque entrée = 2 bytes)
    LD    C, A                      ; C = offset bas (A × 2)
    LD    B, 0                      ; BC = offset 16 bits (A × 2)
    LD    HL, (IM1_CURRENT)         ; HL = adresse de base du tableau de vecteurs
    ADD   HL, BC                    ; HL pointe vers l'entrée [index] du tableau
    LD    A, (HL)                   ; A = octet bas du pointeur
    INC   HL                        ; HL pointe vers l'octet haut
    LD    H, (HL)                   ; H = octet haut du pointeur
    LD    L, A                      ; L = octet bas (précédemment chargé)
    JP    (HL)                      ; HL = adresse complète de la fonction

;.EXIT
;    POP   IY
;    POP   IX
;    EX    AF, AF'
;    EXX
;    EI
;    RETI

; ------------------------------------------------------------
; DONNÉES POUR LE SYSTÈME D'INTERRUPTIONS VECTORISÉES
; ------------------------------------------------------------
IM1_INDEX:
    DEFB 0                           ; Valeur initiale = -2 ou 0xFE
                                     ; Indique que l'index est "non prêt"
                                     ; Pas encore d'interruption à traiter
IM1_CURRENT:
    DEFW 0                           ; Pointe vers le tableau de vecteurs par défaut

; SIZE: 45 octets
