
F_SCORE_INC_PLAYER_1
	LD   IX, ENT_SCORE_JOUEUR_1
	JR   F_SCORE_INC_COMMON

F_SCORE_INC_PLAYER_2
	LD   IX, ENT_SCORE_JOUEUR_2

F_SCORE_INC_COMMON
	INC  (IX+SCORE_IDX)				; ENT_SCORE_JOUEUR_X[IDX_SCORE] = SCORE++
	
	LD   A, (IX+SCORE_IDX)	
	CP   SCORE_MAX : RET NC
	
	LD   HL, SCORE_FNT_TABLE 		; Calcul Idx pour faire SCORE_FNT_TABLE[Idx]
	ADD  A, A :	LD 	 L, A

	LD   A, (HL) : LD (IX), A : INC  HL 
	LD   A, (HL) : LD (IX+1), A 	; ENT_SCORE_JOUEUR_X[FNT_RAM] = SCORE_FNT_TABLE[Idx]

	RET

;================================================================
;  INSERTION DES DONNEES
;================================================================

SCORE_IDX EQU 4
SCORE_MAX EQU 10

