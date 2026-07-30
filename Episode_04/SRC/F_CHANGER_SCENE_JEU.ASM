;==============================================================
; F_CHANGER_SCENE_JEU
;--------------------------------------------------------------
; Description : Aiguille vers l'initialisation de la scène
;               demandée. Invalide d'abord le vecteur IM1
;               courant, cherche l'identifiant reçu dans
;               SCENE_TABLE (entrées alignées 8 octets), puis
;               charge le pointeur de scène, le vecteur IM1
;               associé, et saute vers le setup.
;--------------------------------------------------------------
; Entrées  : B - Identifiant du nouvel état (ID_SCENE_xxx)
; Sorties  : RET si identifiant inconnu
;            Sinon saut vers F_SCENE_xxx_INITIALISATION
; Modifie  : AF, BC, DE, HL, (IM1_INDEX), (SCENE_JEU_ACTUEL+1),
;            (IM1_CURRENT)
;==============================================================
F_CHANGER_SCENE_JEU

    LD   A, IM1_NOT_READY
    LD   (IM1_INDEX), A              ; Invalide le vecteur IM1

    LD   A, B                        ; A = identifiant de scène recherché
    LD   HL, SCENE_TABLE
    LD   C, SCENE_TABLE_COUNT

SCENE_SEARCH
    CP   (HL)
    JR   Z, SCENE_FOUND
    LD   DE, 8
    ADD  HL, DE                      ; entrée suivante (pas fixe de 8 octets)
    DEC  C
    JR   NZ, SCENE_SEARCH
    RET                              ; Identifiant inconnu, retour sans action

SCENE_FOUND
    INC  HL
    LD   E, (HL) : INC HL
    LD   D, (HL) : INC HL            ; DE = adresse F_SCENE_xxx
    PUSH DE
    LD   E, (HL) : INC HL
    LD   D, (HL) : INC HL            ; DE = adresse ARRAY_IM1_xxx
    LD   (IM1_CURRENT), DE
    LD   E, (HL) : INC HL
    LD   D, (HL)                     ; DE = adresse F_SCENE_xxx_INITIALISATION
    POP  HL
    LD   (SCENE_JEU_ACTUEL+1), HL
    PUSH DE
    RET                              ; "JP (DE)" via pile

;--------------------------------------------------------------
; SCENE_TABLE : entrées alignées sur 8 octets
;   +0 : ID (1o)
;   +1 : adresse F_SCENE_xxx (2o)
;   +3 : adresse ARRAY_IM1_xxx (2o)
;   +5 : adresse F_SCENE_xxx_INITIALISATION (2o)
;   +7 : padding (1o, inutilisé)
;--------------------------------------------------------------
    ALIGN 8
SCENE_TABLE

    DEFB ID_SCENE_TITRE
    DEFW F_SCENE_TITRE, ARRAY_IM1_TITRE, F_SCENE_TITRE_INITIALISATION
    DEFB 0
   
    DEFB ID_SCENE_MENU
    DEFW F_SCENE_MENU, ARRAY_IM1_MENU, F_SCENE_MENU_INITIALISATION
    DEFB 0
   
    DEFB ID_SCENE_JEU
    DEFW F_SCENE_JEU, ARRAY_IM1_JEU, F_SCENE_JEU_INITIALISATION
    DEFB 0
   
    DEFB ID_SCENE_GAMEOVER
    DEFW F_SCENE_GAMEOVER, ARRAY_IM1_GAMEOVER, F_SCENE_GAMEOVER_INITIALISATION
    DEFB 0
   
    ;DEFB ID_SCENE_TEST
    ;DEFW F_SCENE_TEST, ARRAY_IM1_DEFAUT, F_SCENE_TEST_INITIALISATION
    ;DEFB 0
SCENE_TABLE_COUNT EQU 4
