
;--------------------------------------------------------
; F_IA_PADDLE_AFFICHER
; Efface le paddle à son ancienne position puis l'affiche
; à sa position courante (écran CPC, mode 0)
;
; Entrée  : ENT_IA.OLD_XY         	 = ancienne adresse VRAM
;           ENT_IA.VRAM_XY        	 = adresse VRAM courante
;           ENT_IA.IM_PADDLE_ERASE   = sprite d'effacement
;           ENT_IA.IM_PADDLE_CURRENT = pointeur sprite courant
; Sortie  : -
; Modifie : AFDEHL!
;--------------------------------------------------------
F_IA_PADDLE_AFFICHER

    ; Effacer PADDLE IA
 	LD   HL, ENT_IA.IM_PADDLE_ERASE
 	LD   DE, (ENT_IA.OLD_XY)
 	CALL F_COPYTOVRAM_24x2_M0						; AFDEHL!
	
	; Afficher PADDLE IA
 	LD   HL, (ENT_IA.IM_PADDLE_CURRENT)
 	LD   DE, (ENT_IA.VRAM_XY)
	JP   F_COPYTOVRAM_24x2_M0						; AFDEHL!
	