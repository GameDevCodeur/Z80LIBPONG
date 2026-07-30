
;==============================================================
; SCENE_TITRE - Initialisation
;--------------------------------------------------------------
; Description : Initialisation de l'état "Titre".
;               Configure le mode graphique, décompresse
;               l'écran titre et charge sa palette.
;==============================================================

F_SCENE_TITRE_INITIALISATION
	
    mGA_SET_MODE GA_MODE0_ROMS_OFF

    ; DECOMPRESS ZX0
    LD   HL, SCR_TITTLE_ZX0
    LD   DE, SCR_VRAM_BASE
    CALL F_ZX0_DECOMPRESS

    ; CHARGE LA PALETTE    
    LD   HL, SCR_TITTLE_PAL
    LD   BC, GA_PORT 
    LD    A, GAME_TITRE_PALETTE_SIZE
    mGA_SET_PALETTE (VOID)
    
    RET

;==============================================================
; SCENE_TITRE - Boucle principale
;==============================================================
F_SCENE_TITRE
  
    LD   HL, SCR_TEMPO_3
    DEC  (HL) : RET  NZ

    LD   B, ID_SCENE_MENU
    JP   F_SCENE_CHARGER
