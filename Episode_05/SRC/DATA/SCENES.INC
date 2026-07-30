
;--------------------------------------------------------------
; SCENE_TABLE : entrées alignées sur 8 octets
;   +0 : ID (1o)
;   +1 : adresse F_SCENE_xxx (2o)
;   +3 : adresse ARRAY_IM1_xxx (2o)
;   +5 : adresse F_SCENE_xxx_INITIALISATION (2o)
;   +7 : padding (1o, inutilisé)
;--------------------------------------------------------------
    
SCENE_TABLE

    ;DEFB ID_SCENE_VIDE
    ;DEFW F_SCENE_VIDE, ARRAY_IM1_VIDE, F_SCENE_VIDE_INITIALISATION
    ;DEFB 0

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
    
SCENE_TABLE_COUNT EQU 4
