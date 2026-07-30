
;-----------------------------------------------------------------------------
; mKEY_SPACE_REQUESTED - Teste la touche ESPACE
; Retour: Z=1 si ESPACE pressée, Z=0 sinon
; Modifie: AF
;-----------------------------------------------------------------------------

MACRO mKEY_SPACE_REQUESTED
	LD   A, (KBD_BUFFER_SPACE)
    CP   KBD_KEY_SPACE
ENDM