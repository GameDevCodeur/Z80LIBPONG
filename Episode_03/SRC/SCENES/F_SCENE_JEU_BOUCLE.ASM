
INCLUDE "..\PONG.ASM"

F_SCENE_JEU_INITIALISATION
	
	; Initialser SCENE_BOUCLE_JEU
	XOR  A 								; A = 0
	LD (ETAT_JEU), A 					; ETAT_PAUSER_JEU
	
	; Initialiser les SCORES 
	LD (ENT_SCORE_JOUEUR_1.SCORE), A    
	LD (ENT_SCORE_JOUEUR_2.SCORE), A

	; Eteindre ecran
	CALL F_ETEINDRE_ENCRES

	; Nettoyer ecran
	LD   HL, #C000
	mCLEAR_BUFFER (VOID)

	; Afficher terrain
	mAFFICHER_TERRAIN (VOID)

	; Afficher score	
	LD  HL, (ENT_SCORE_JOUEUR_1.VRAM)
	LD  DE, SCORE_FNT_0
	CALL F_SCORE_AFFICHER

	LD  HL, (ENT_SCORE_JOUEUR_2.VRAM)
	LD  DE, SCORE_FNT_0
	CALL F_SCORE_AFFICHER

	; Afficher paddle
	CALL F_PADDLE_AFFICHER

	; Afficher balle
	CALL F_BALLE_AFFICHER

	; Afficher PRESS ENTER TO START
	CALL F_AFFICHER_PRESS_ENTER_TO_START

	; Allumer ecran
	LD   B, HI(GA_PORT)
	LD   A, GA_PEN_6   
    LD   D, HW_BRIGHT_WHITE
    mGA_SET_PEN_INK

RET

F_SCENE_JEU

LOGIQUE	

	LD 	 A, (ETAT_JEU) : AND A   		; SI A=0 Attente touche ENTER
	JR   Z, F_ETAT_ENTER_REQUESTED 		; SINON  Lancer la partie

 	mKEY_P_REQUESTED (VOID) 
 	JP Z, F_ETAT_PAUSER_JEU

 	CALL F_PADDLE_MISE_A_JOUR 			; Met à jour la position du PADDLE
	
	CALL F_BALLE_MISE_A_JOUR    		; Met à jour la position de la BALLE
    CALL F_BALLE_VERIFER_REBOND 		; Vérifie si la balle doit rebondir

AFFICHAGE

	LD  HL, (ENT_SCORE_JOUEUR_1.VRAM)
	LD  DE, (ENT_SCORE_JOUEUR_1.FNT_RAM)
	CALL F_SCORE_AFFICHER

	LD  HL, (ENT_SCORE_JOUEUR_2.VRAM)
	LD  DE, (ENT_SCORE_JOUEUR_2.FNT_RAM)
	CALL F_SCORE_AFFICHER

    CALL F_PADDLE_AFFICHER				; Affiche le paddle
  	JP 	 F_BALLE_AFFICHER 	    		; Affiche la balle

;================================================================
;  INSERTION DES DONNEES
;================================================================

ETAT_JEU
	DEFB ETAT_PAUSER_JEU
ETAT_JEU_END
