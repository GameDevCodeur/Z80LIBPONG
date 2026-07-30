
;-----------------------------------------------------------
; F_SCORE_INC_PLAYER_1 / F_SCORE_INC_PLAYER_2
;
; Incrémente le score du joueur concerné et met à jour le
; pointeur vers la police (fonte) du chiffre à afficher.
; Si le score atteint SCORE_MAX, bascule sur l'écran de fin
; de partie (F_SCORE_SET_SCENE_GAMEOVER).
;
; Entrée : IX -> ENT_SCORE_JOUEUR_1 ou ENT_SCORE_JOUEUR_2
; Sortie : (IX+SCORE_IDX)         = nouveau score
;          (IX+FNT_RAM_IDX .. +1) = adresse fonte du chiffre
;          -> saut vers GAMEOVER si score = SCORE_MAX
; Détruit: AF, HL
;-----------------------------------------------------------

F_SCORE_INC_PLAYER

	LD   A, (IX+4) : INC A : LD (IX+4), A

	CP   SCORE_MAX
	JP   NC, F_SET_ETAT_QUITER_JEU

	LD   HL, SCORE_FNT_TABLE
	ADD  A, A : ADD A, L : LD L, A

	LD   A, (HL) : LD (IX), A :	INC  HL
	LD   A, (HL) : LD (IX+1), A

	RET
