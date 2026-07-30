
;-----------------------------------------------------------
; F_SCORE_INITIALISE
;
; Réinitialise les scores des deux joueurs à 0 et fait
; pointer leur fonte affichée (FNT_RAM) sur le chiffre "0"
; (SCORE_FNT_0).
;
; Entrée : aucune
; Sortie : ENT_SCORE_JOUEUR_1.SCORE   = 0
;          ENT_SCORE_JOUEUR_2.SCORE   = 0
;          ENT_SCORE_JOUEUR_1.FNT_RAM = SCORE_FNT_0
;          ENT_SCORE_JOUEUR_2.FNT_RAM = SCORE_FNT_0
; Détruit: AF, HL
;-----------------------------------------------------------
F_SCORE_INITIALISE
	XOR  A
	LD   (ENT_SCORE_JOUEUR_1.SCORE), A    
	LD   (ENT_SCORE_JOUEUR_2.SCORE), A	
	LD 	 HL, SCORE_FNT_0
	LD   (ENT_SCORE_JOUEUR_1), HL    
	LD   (ENT_SCORE_JOUEUR_2), HL
	RET
	