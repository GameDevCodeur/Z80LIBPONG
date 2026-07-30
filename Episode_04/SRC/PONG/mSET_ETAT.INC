
;-----------------------------------------------------------
; mSET_ETAT_JEU STATE
;
; Macro : positionne l'état courant du jeu (ETAT_JEU) à la
; valeur STATE passée en paramètre.
;
; Paramètre : STATE -> nouvelle valeur de ETAT_JEU
;                       (constante ou expression connue
;                       à l'assemblage)
; Sortie    : ETAT_JEU = STATE
; Détruit   : AF
;-----------------------------------------------------------
MACRO mSET_ETAT_JEU STATE
	IF {STATE} == 0
		XOR  A
	ELSE
		LD   A, {STATE}
	ENDIF
	LD   (ETAT_JEU), A
ENDM
