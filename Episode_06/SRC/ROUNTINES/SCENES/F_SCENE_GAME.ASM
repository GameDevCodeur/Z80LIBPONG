
; ===============================================================
; SCENE GAME - Initialisation
; ===============================================================

F_SCENE_JEU_INITIALISATION
	
    ; Initialser etat du jeu
    mSET_GAME_STATE ETAT_PAUSER_JEU           ; AF!
	
    ; Eteindre la scène
    ;CALL F_ETEINDRE_ENCRES                   ; ABDF!

    ; Nettoyer la scène
    mCLEAR_BUFFER SCR_VRAM_BASE               ; AFHL!

    ; Initialiser la balle 
    CALL F_BALLE_INITIALISER                  ; AFHL!

    ; Initialiser PADDLE 
    CALL F_PADDLE_INITIALISER                 ; AFHL!

    ; Initialiser les scores 
    CALL F_SCORE_INITIALISER                  ; AFHL!

    ; Afficher terrain
    mAFFICHER_TERRAIN (VOID)                  ; ABDE!

    ; Afficher score 0
    LD  HL, (ENT_SCORE_JOUEUR_1.VRAM)
    LD  DE, FNT.CHAR_0
    CALL F_SCORE_AFFICHER                     ; AFBCDEHL!

    LD  HL, (ENT_SCORE_JOUEUR_2.VRAM)
    LD  DE, FNT.CHAR_0
    CALL F_SCORE_AFFICHER

    ; Afficher paddle
    CALL F_PADDLE_AFFICHER                    ; ABDEHL!
    CALL F_IA_PADDLE_AFFICHER

    ; Afficher balle
    CALL F_BALLE_AFFICHER                     ; ABDEHL!

    ; Afficher PRESS ENTER TO START
    CALL F_AFFICHER_PRESS_ENTER_TO_START      ; ABDEHL!

    ; Allumer scène PEN_6
    LD   B, HI(GA_PORT)
    LD   A, GA_PEN_6   
    LD   D, HW_BRIGHT_WHITE
    mGA_SET_PEN_INK

    RET

; ===============================================================
; SCENE GAME - Boucle Principale
; ===============================================================

F_SCENE_JEU

LOGIQUE	

    LD   A, (GAME_STATE) : AND A              ; Si A=0 Attente touche ENTER
    JP   Z, F_ENTER_REQUESTED_JEU
	
    CP   ETAT_QUITER_JEU                      ; Si A=4 Fin du jeu
    JP 	 Z, F_SET_SCENE_GAMEOVER

    mKEY_P_REQUESTED (VOID)                   ; Si P mettre en pause le jeu
    JP   Z, F_METTRE_EN_PAUSE_JEU

    CALL F_PADDLE_MISE_A_JOUR                 ; Met à jour le PADDLE	

    LD   HL, FRAME_TICK
    DEC  (HL) : JP NZ, AFFICHAGE
	
    CALL F_BALLE_MISE_A_JOUR                  ; Met à jour de la BALLE	
    CALL F_BALL_COLLISION                     ; Collision de la balle
    CALL F_BALL_ACCELERATION

    LD   A, (ENT_BALLE.SP)
    LD   (FRAME_TICK), A

AFFICHAGE

    LD   HL, (ENT_SCORE_JOUEUR_1.VRAM)
    LD   DE, (ENT_SCORE_JOUEUR_1.FNT_RAM)
    CALL F_SCORE_AFFICHER

    LD   HL, (ENT_SCORE_JOUEUR_2.VRAM)
    LD   DE, (ENT_SCORE_JOUEUR_2.FNT_RAM)
    CALL F_SCORE_AFFICHER

    CALL F_IA_PADDLE_AFFICHER                 ; Affiche le paddle IA
    CALL F_PADDLE_AFFICHER                    ; Affiche le paddle

    JP   F_BALLE_AFFICHER                     ; Affiche la balle
