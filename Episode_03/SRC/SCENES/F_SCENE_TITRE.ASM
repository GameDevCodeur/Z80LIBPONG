
; ============================================================
; PROGRAMME : JEU - GESTION DES ETATS
; ============================================================
; FICHIER : ETAT_TITRE.ASM
; DESCRIPTION : Gestion de l'état d'écran titre
; ============================================================

;==============================================================
; F_SCENE_TITRE_INITIALISATION
;--------------------------------------------------------------
; Description : Initialisation de l'état "Titre".
;               Configure le mode graphique, décompresse
;               l'écran titre et charge sa palette.
;--------------------------------------------------------------
; Entrées  : SCR_TITTLE_ZX0 - Données écran compressées ZX0
;            SCR_TITTLE_PAL - Palette de l'écran titre
; Sorties  : Aucune
; Modifie  : A, BC, DE, HL
;==============================================================
F_SCENE_TITRE_INITIALISATION
	
    mGA_SET_MODE MODE0_ROMS_OFF

; DECOMPRESS ZX0
 	LD   HL, SCR_TITTLE_ZX0
 	LD   DE, #C000
 	CALL ZX0_DECOMPRESS

; CHARGE LA PALETTE
 	LD   HL, SCR_TITTLE_PAL
    LD   BC, GA_PORT
    LD    A, 11
    mGA_SET_PALETTE (VOID)
    
    RET

;==============================================================
; F_SCENE_TITRE
;--------------------------------------------------------------
; Description : Gestion de l'état "Titre" du jeu.
;               Attend 3sec et change d'état.
;--------------------------------------------------------------
; Entrées  : 
; Sorties  :             
;==============================================================
F_SCENE_TITRE
  
    LD   HL, SCR_TEMPO_3
    DEC  (HL)
    RET  NZ

    LD   B, ID_SCENE_MENU
    JP   F_CHANGER_SCENE_JEU

;================================================================
;  INSERTION DES DONNEES
;================================================================

SCR_TEMPO_3
     DEFB 150                       ; durée (s) = N / 50
SCR_TEMPO_3_END

SCR_TITTLE_PAL
    INCLUDE "GFX/SCR_TITTLE.PAL"
SCR_TITTLE_PAL_END

SCR_TITTLE_ZX0
	INCZX0 "GFX/SCR_TITTLE.BIN"
SCR_TITTLE_ZX0_END
