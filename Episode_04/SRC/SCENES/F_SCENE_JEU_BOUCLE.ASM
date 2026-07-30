
;================================================================
;  INSERTION DES MACROS/FONCTIONS DU JEU
;================================================================
INCLUDE "..\PONG.ASM"

;-----------------------------------------------------------
; F_SCENE_JEU_INITIALISATION
;
; Initialise la scène de jeu : remet l'état du jeu et les
; scores à zéro, efface l'écran, puis réaffiche le terrain,
; les scores, les paddles, la balle et le message
; "PRESS ENTER TO START". Rallume l'écran en fin de routine.
;
; Entrée : aucune
; Sortie : ETAT_JEU                    = 0 (ETAT_PAUSER_JEU)
;          ENT_SCORE_JOUEUR_1.SCORE    = 0
;          ENT_SCORE_JOUEUR_2.SCORE    = 0
;          écran réinitialisé et affiché
; Détruit: AF, BC, DE, HL
;-----------------------------------------------------------

F_SCENE_JEU_INITIALISATION
	
	; Initialser etat du jeu
	mSET_ETAT_JEU ETAT_PAUSER_JEU			; AF
	
	; Initialiser les scores 
	CALL F_SCORE_INITIALISE 				; AFHL!

	; Eteindre la scène
	CALL F_ETEINDRE_ENCRES 					; ABDF!

	; Nettoyer la scène
	LD   HL, #C000
	mCLEAR_BUFFER (VOID)					; BCDE!

	; Afficher terrain
	mAFFICHER_TERRAIN (VOID)				; ABDE!

	; Afficher score 0
	LD  HL, (ENT_SCORE_JOUEUR_1.VRAM)
	LD  DE, SCORE_FNT_0
	CALL F_SCORE_AFFICHER 					; ABCDEFHL!

	LD  HL, (ENT_SCORE_JOUEUR_2.VRAM)
	LD  DE, SCORE_FNT_0
	CALL F_SCORE_AFFICHER

	; Afficher paddle
	CALL F_PADDLE_AFFICHER 					; ABDEHL!

	; Afficher balle
	CALL F_BALLE_AFFICHER 					; ABDEHL!

	; Afficher PRESS ENTER TO START
	CALL F_AFFICHER_PRESS_ENTER_TO_START 	; ABDEHL!

	; Allumer scène PEN_6
	LD   B, HI(GA_PORT)
	LD   A, GA_PEN_6   
    LD   D, HW_BRIGHT_WHITE
    mGA_SET_PEN_INK

	RET

;-----------------------------------------------------------
; F_SCENE_JEU
;
; Boucle principale de la scène de jeu, appelée une fois par
; frame. Gère l'état du jeu (attente, pause, fin de partie),
; met à jour paddles/balle, teste les collisions/rebonds,
; puis réaffiche scores, paddles et balle.
;
; Entrée : ETAT_JEU -> état courant du jeu
; Sortie : écran mis à jour (scores, paddles, balle)
;          -> saut vers GAMEOVER / PAUSE selon état/input
; Détruit: AF, BC, DE, HL (selon sous-routines appelées)
;-----------------------------------------------------------
F_SCENE_JEU

LOGIQUE	

	LD 	 A, (ETAT_JEU) : AND A   		; Si A=0 Attente touche ENTER
	JR   Z, F_ENTER_REQUESTED_JEU
	
	CP   ETAT_QUITER_JEU				; Si A=4 Fin du jeu
	JP 	 Z, F_SET_SCENE_GAMEOVER

 	mKEY_P_REQUESTED (VOID) 			; Si P mettre en pause le jeu
 	JP Z, F_METTRE_EN_PAUSE_JEU

 	CALL F_PADDLE_MISE_A_JOUR 			; Met à jour le PADDLE	
	
	CALL F_BALLE_MISE_A_JOUR    		; Met à jour la BALLE	
	CALL F_BALLE_COLLISION_PHG 			; Collision pixel haut gauche 
	CALL F_BALLE_COLLISION_PBG 			; Collision pisel bas gauche
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
