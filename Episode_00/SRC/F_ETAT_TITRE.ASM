
; ============================================================
; PROGRAMME : JEU - GESTION DES ETATS
; ============================================================
; FICHIER : ETAT_TITRE.ASM
; DESCRIPTION : Gestion de l'état d'écran titre
; ============================================================

;==============================================================
; F_ETAT_TITRE_INITIALISATION
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
F_ETAT_TITRE_INITIALISATION
	
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
; F_ETAT_TITRE
;--------------------------------------------------------------
; Description : Gestion de l'état "Titre" du jeu.
;               Attend 3sec et change d'état.
;--------------------------------------------------------------
; Entrées  : 
; Sorties  :             
;==============================================================
F_ETAT_TITRE
  
    LD   A, TMP_3S    
    CALL F_TEMPO

    LD   B, ID_ETAT_MENU
    JP   F_CHANGER_ETAT_JEU

;================================================================
;  INSERTION DES DONNEES
;================================================================
SCR_TITTLE_PAL
    INCLUDE "PNG/BIN/SCR_TITTLE.PAL"
SCR_TITTLE_PAL_END

SCR_TITTLE_ZX0
	INCZX0 "PNG/BIN/SCR_TITTLE.BIN"
SCR_TITTLE_ZX0_END
