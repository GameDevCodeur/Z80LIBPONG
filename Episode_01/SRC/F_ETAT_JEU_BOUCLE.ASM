
INCLUDE "PONG.ASM"

F_ETAT_JEU_INITIALISATION
	
	; Initialser ETAT_BOUCLE_JEU
	XOR  A
	LD   (ETAT_BOUCLE_JEU), A 		; ETAT_PAUSER_JEU

	; Eteindre ecran
	CALL F_ETEINDRE_ENCRES

	; Nettoyer ecran
	LD   HL, #C000
	mCLEAR_BUFFER (VOID)

	; Afficher terrain
	mAFFICHER_TERRAIN (VOID)

	; Afficher balle
	CALL AFFICHER_BALLE

	; Allumer ecran
	LD   B, HI(GA_PORT)
	LD   A, GA_PEN_6   
    LD   D, HW_BRIGHT_WHITE
    mGA_SET_PEN_INK

RET

F_ETAT_JEU
	
	LD 	 A, (ETAT_BOUCLE_JEU)
	AND  A
	JR   Z, F_PAUSER_JEU 		; SI A=0 ETAT_PAUSER_JEU
                                ; SINON LANCER_JEU
F_LANCER_JEU
 
	CALL MISE_A_JOUR_BALLE     	; Met à jour la position de la BALLE
	CALL AFFICHER_BALLE 	   	; Affiche la balle
    JP 	 VERIFER_REBOND_BALLE  	; Vérifie si on doit rebondir

;================================================================
;  INSERTION DES DONNEES
;================================================================

ETAT_BOUCLE_JEU
	DEFB ETAT_PAUSER_JEU

ETAT_PAUSER_JEU EQU 0
ETAT_LANCER_JEU EQU 1
ETAT_QUITER_JEU EQU 2
