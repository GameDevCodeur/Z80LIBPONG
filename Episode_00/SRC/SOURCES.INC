
	;================================================================
    ;  INSERTION DES MACROS & FUNCTIONS Z80LIBv00
    ;================================================================ 
	INCLUDE "Z80LIBv00\SYS\SYS.INC"
    INCLUDE "Z80LIBv00\MEM\mCLEAR_BUFFER.INC"

	INCLUDE "Z80LIBv00\F_CREER_TABLE_ECRAN.INC"
	INCLUDE "Z80LibV00\F_ATTENTE_VBL.INC"

    ;-------------------------------
    ; GATE ARRAY ENCRES
    ;-------------------------------
	INCLUDE "Z80LibV00\F_ETEINDRE_ENCRES.INC"

    ;-------------------------------
    ; FONTS
    ;-------------------------------
    INCLUDE "Z80LibV00\FNT\F_CHAR_4xB_M0.INC"

    ;-------------------------------
    ; COMPRESSION
    ;-------------------------------
    ;INCLUDE "Z80LibV00\F_RLE_COMPRESS.INC"
    ;INCLUDE "Z80LibV00\F_RLE_DECOMPRESS.INC"
    INCLUDE "Z80LibV00\RASM\dzx0_standard.asm"

    ;-------------------------------
    ; TEMPORALITE
    ;-------------------------------
    INCLUDE "Z80LibV00\F_TEMPO.INC"    

	;================================================================
    ;  INSERTION DES FONCTIONS
    ;================================================================        
    
    ;-----------------------------
    ; DECOMPRESS ZX0
    ;-----------------------------
    ZX0_DECOMPRESS dzx0_standard (void)
    
    ;-----------------------------
    ; INITIALISATION SYSTEME
    ;-----------------------------
    INCLUDE "CFG/F_CONFIG_CRTC.ASM"
    INCLUDE "CFG/F_CONFIG_GAME.ASM"

    ;-----------------------------
    ; MISE A JOUR ETAT DU JEU
    ;-----------------------------
    INCLUDE "F_CHANGER_ETAT_JEU.ASM"

    INCLUDE "F_ETAT_TITRE.ASM"
    INCLUDE "F_ETAT_MENU.ASM"
    INCLUDE "F_ETAT_JEU_BOUCLE.ASM"
    INCLUDE "F_ETAT_GAME_OVER.ASM"
    INCLUDE "F_ETAT_TEST.ASM"

    ;-----------------------------
    ; INTERRUPTION IM1
    ;-----------------------------
    INCLUDE "IM1/F_IM1_CONFIG.ASM"  
    INCLUDE "IM1/F_IM1_CALLBACK.ASM" 
    INCLUDE "IM1/F_IM1_SKIP.ASM"

    INCLUDE "IM1/F_IM1_SCAN_KEYBOARD.ASM"
    
    INCLUDE "IM1/ARRAY_IM1_DEFAUT.ASM"
    INCLUDE "IM1/ARRAY_IM1_TITRE.ASM"
    INCLUDE "IM1/ARRAY_IM1_MENU.ASM"
    INCLUDE "IM1/ARRAY_IM1_JEU.ASM"
   