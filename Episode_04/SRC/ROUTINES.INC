    
    ;================================================================
    ;  INSERTION DES MACROS SYSTEM DE LA Z80LIBv00
    ;================================================================ 
    INCLUDE "Z80LIBv00/SYS/SYS.INC"

    ;================================================================
    ;  INSERTION DES FUNCTIONS DE LA Z80LIBv00
    ;================================================================ 
    INCLUDE "Z80LIBv00/F_IM1.INC"
    INCLUDE "Z80LIBv00/F_CFG_CRTC_32x24.INC"
    INCLUDE "Z80LIBv00/F_ZX0_DECOMPRESS.INC"
    INCLUDE "Z80LIBv00/F_ETEINDRE_ENCRES.INC"
    INCLUDE "Z80LIBv00/F_ATTENTE_VBL.INC"
    INCLUDE "Z80LIBv00/F_CHAR_2xB_M0.INC"
    INCLUDE "Z80LIBv00/F_CHAR_4xB_M0.INC"
    INCLUDE "Z80LIBv00/F_CHAR_8xB_M0.INC" 

    ;INCLUDE "Z80LIBv00/F_RLE_COMPRESS.INC"
    ;INCLUDE "Z80LIBv00/F_RLE_DECOMPRESS.INC" 
    ;INCLUDE "Z80LIBv00/F_TEMPO.INC"          

    ;INCLUDE "Z80LIBv00/SCR/F_SCR_CREER_TABLE.INC"
    ;INCLUDE "Z80LIBv00/SCR/F_SCR_ADRESSE_HL.INC"

	;================================================================
    ;  INSERTION DES FONCTIONS DU JEU
    ;================================================================        
     
    INCLUDE "CFG/F_CFG_GAME.ASM"

    ;-----------------------------
    ; SCENES DU JEU
    ;-----------------------------
    INCLUDE "F_CHANGER_SCENE_JEU.ASM"
    INCLUDE "SCENES/F_SCENE_TITRE.ASM"
    INCLUDE "SCENES/F_SCENE_MENU.ASM"
    INCLUDE "SCENES/F_SCENE_JEU_BOUCLE.ASM"
    INCLUDE "SCENES/F_SCENE_GAMEOVER.ASM"
    ;NCLUDE "SCENES/F_SCENE_TEST.ASM"

    ;-----------------------------
    ; TABLES INTERRUPTION IM1
    ;-----------------------------
    INCLUDE "IM1/ARRAY_IM1_TITRE.ASM"
    INCLUDE "IM1/ARRAY_IM1_MENU.ASM"
    INCLUDE "IM1/ARRAY_IM1_JEU.ASM"
    INCLUDE "IM1/ARRAY_IM1_GAMEOVER.ASM"
   
    ;----------------------------
    ; DONNEES FONTE
    ;----------------------------
    INCLUDE "FNT/FNT.INC"
