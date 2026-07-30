
;-----------------------------------------------------------
; F_COPYTOVRAM_24x2_M0
;
; Copie un bloc de 24 lignes × 2 pixels (Mode 0) depuis HL
; vers DE. 
;
; Entrée : HL -> source (adresse écran ou buffer)
;          DE -> destination (buffer mémoire ou écran)
;
; Détruit: AFDEHL! 
;-----------------------------------------------------------
F_COPYTOVRAM_24x2_M0
	mCOPYBLOCK_HW_M0 24, 1
RET
