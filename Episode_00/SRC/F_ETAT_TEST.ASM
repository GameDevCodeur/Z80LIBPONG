
; ============================================================
; PROGRAMME : JEU - GESTION DES ETATS
; ============================================================
; FICHIER : ETAT_TEST.ASM
; DESCRIPTION : Gestion de l'état d'écran test
; ============================================================

F_ETAT_TEST_INITIALISATION

	; Coupe les couleurs, éviter les artefacts visuels
	JP F_ETEINDRE_ENCRES 

F_ETAT_TEST

RET

;================================================================
;  INSERTION DES DONNEES
;================================================================
