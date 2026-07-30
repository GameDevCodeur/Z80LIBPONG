
;-----------------------------------------------------------------------------
; mKEY_Q_REQUESTED - Teste la touche Q
; Retour: Z=1 si ESPACE pressée, Z=0 sinon
; Modifie: AF
;-----------------------------------------------------------------------------

MACRO mKEY_Q_REQUESTED
	LD   A, (KBD_BUFFER_Q)
    CP   KBD_KEY_Q
ENDM