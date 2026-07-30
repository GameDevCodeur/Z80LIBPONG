
;--------------------------------------------------------
; F_PADDLE_AFFICHER
; Efface le paddle à son ancienne position puis l'affiche
; à sa position courante (écran CPC, mode 0)
;
; Entrée  : ENT_PADDLE.OLD_XY         	 = ancienne adresse VRAM
;           ENT_PADDLE.VRAM_XY        	 = adresse VRAM courante
;           ENT_PADDLE.IM_PADDLE_ERASE   = sprite d'effacement
;           ENT_PADDLE.IM_PADDLE_CURRENT = pointeur sprite courant
; Sortie  : -
; Modifie : A, B, DE, HL (via F_CHAR_2xB_M0)
;--------------------------------------------------------
F_PADDLE_AFFICHER

    ; Effacer PADDLE
 	LD   HL, ENT_PADDLE.IM_PADDLE_ERASE
 	LD 	 DE, (ENT_PADDLE.OLD_XY)
 	LD   B, ENT_PADDLE_NBL
 	CALL F_CHAR_2xB_M0							; ABDEHL!
	
	; Afficher PADDLE
 	LD   HL, (ENT_PADDLE.IM_PADDLE_CURRENT)
 	LD 	 DE, (ENT_PADDLE.VRAM_XY)
 	LD   B, ENT_PADDLE_NBL
	JP   F_CHAR_2xB_M0							; ABDEHL!
	