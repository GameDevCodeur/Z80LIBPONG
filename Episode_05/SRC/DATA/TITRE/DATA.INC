
;================================================================
;  INSERTION DES DONNEES SCENE TITRE
;================================================================

SCR_TEMPO_3
     DEFB 150                       ; durée (s) = N / 50
SCR_TEMPO_3_END

SCR_TITTLE_PAL
    INCLUDE "SCR_TITTLE.PAL"
SCR_TITTLE_PAL_END

SCR_TITTLE_ZX0
	INCZX0 "SCR_TITTLE.BIN"
SCR_TITTLE_ZX0_END