
;-----------------------------------------------------------
; mSET_GAME_STATE
;
; Macro : positionne l'état courant du jeu à la
; valeur STATE passée en paramètre.
;
; Paramètre : STATE -> nouvelle valeur de GAME_STATE
;
; Sortie    : GAME_STATE = STATE
; Détruit   : AF
;-----------------------------------------------------------
MACRO mSET_GAME_STATE STATE
	IF {STATE} == 0
		XOR  A
	ELSE
		LD   A, {STATE}
	ENDIF
	LD   (GAME_STATE), A
ENDM
