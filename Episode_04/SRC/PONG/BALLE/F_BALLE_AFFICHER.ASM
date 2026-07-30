
;-----------------------------------------------------------
; F_BALLE_AFFICHER
;-----------------------------------------------------------
; Description :
;   Affiche la balle a l'ecran (mode 0) :
;     1) Efface le sprite a son ancienne position (OLDXY)
;        en utilisant l'image d'effacement IM_BALLE_ERASE.
;     2) Dessine le sprite a sa nouvelle position (XY)
;        en utilisant l'image IM_BALLE_FRAME0.
;
; Pre-requis :
;   ENT_BALLE.OLDXY et ENT_BALLE.XY doivent avoir ete mis a
;   jour au prealable (voir F_MISE_A_JOUR_BALLE).
;
; Entree :
;   ENT_BALLE.IM_BALLE_ERASE  : pointeur image d'effacement
;   ENT_BALLE.OLDXY           : adresse ecran ancienne position
;   ENT_BALLE.IM_BALLE_FRAME0 : pointeur image de la balle
;   ENT_BALLE.XY              : adresse ecran nouvelle position
;   ENT_BALLE_NBL              : nombre de lignes du sprite
;
; Sortie :
;   Ecran mis a jour (ancien sprite efface, nouveau affiche).
;
; Appelle :
;   F_CHAR_4xB_M0 (deux fois : effacement puis affichage)
;
; Registres modifies :
;   AF, BC, DE, HL (et ceux modifies par F_CHAR_4xB_M0)
;
; Remarques :
;   - Le second appel a F_CHAR_4xB_M0 se fait via JP (et non
;     CALL) : c'est un appel terminal (tail call), le RET de
;     F_CHAR_4xB_M0 remonte directement chez l'appelant de
;     F_AFFICHER_BALLE.
;-----------------------------------------------------------
F_BALLE_AFFICHER

    ; Effacer BALLE
 	LD   HL, ENT_BALLE.IM_BALLE_ERASE
 	LD 	 DE, (ENT_BALLE.OLDXY)
 	LD   B, ENT_BALLE_NBL
	CALL F_CHAR_4xB_M0
	
	; Afficher BALLE
 	LD   HL, (ENT_BALLE.IM_BALLE_CURRENT)
 	LD 	 DE, (ENT_BALLE.XY)
 	LD   B, ENT_BALLE_NBL
	JP   F_CHAR_4xB_M0
