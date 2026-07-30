
;-----------------------------------------------------------
; F_COPYTOVRAM_4x4_M0
;
; Copie un bloc de 4 lignes × 4 pixels (Mode 0) depuis HL
; vers DE. 
;
; Entrée : HL -> source (adresse écran ou buffer)
;          DE -> destination (buffer mémoire ou écran)
; Détruit: AF, HL, DE
;-----------------------------------------------------------
F_COPYTOVRAM_4x4_M0
	mCOPYBLOCK_HW_M0 4, 2
RET
