; =============================================================================
; CONFIGURATION MINIMALE REQUISE PONG
; =============================================================================
; CPC             : 6128 
; RAM             : 64K + 64K EXT
; CRTC            : TYPE 0 6845S
; Microprocesseur : Z80A 4 MHz
; Format          : RASM v3.2.5
; =============================================================================

; =============================================================================
;  VARIABLES RASM
; =============================================================================
DEBUG = 1

; =============================================================================
;  INSERTION DES CONSTANTES
; =============================================================================
INCLUDE "SRC\CONSTANTES.INC"

; =============================================================================
; BOUCLE PRINCIPALE ET INITIALISATION - AMSTRAD CPC
; =============================================================================
; Description : Point d'entrée principal du jeu. 
; 				- Configure le système.
;               - Gère la synchronisation de la boucle via interruptions.
;               - Utilise un gestionnaire de scène dynamique.
; Adresse     : #100 (256 en décimal), standard pour les exécutables CPC.
; =============================================================================

ORG #100

; =============================================================================
;  DEBUT DU CODE
; =============================================================================
DEBUT_CODE

    DI                              ; Désactive interruptions
    LD SP, #8000                    ; Initialise la pile

; -------------------------------------------------------------------------
; INITIALISATION DU SYSTEME
; -------------------------------------------------------------------------
SYS_INITIALISATION

	CALL F_ETEINDRE_ENCRES      ; Coupe les couleurs, éviter les artefacts visuels
    CALL F_ATTENTE_VBL          ; Attend la synchronisation verticale de l'écran

    CALL F_CFG_CRTC_32x24       ; Configure taille de l'écran 32x24 (128x192)
    CALL F_CFG_GAME             ; Configure le jeu
    
    CALL F_IM1_START            ; Lance l'interruption IM1

    LD HL, FRAME_READY          ; Charge adresse drapeau synchronisation

SYS_INITIALISATION_END

; -------------------------------------------------------------------------
; BOUCLE PRINCIPALE (MAIN LOOP) 50Hz
; -------------------------------------------------------------------------

BC_PRINCIPALE
    ; On attend ici que la routine d'interruption
    ; passe la variable 'FRAME_READY' à 0, signalant début frame.

    LD   A, (HL)              ; Charge la valeur du drapeau
    AND  A                    ; Teste si A est égal à 0
    JR   NZ, BC_PRINCIPALE    ; Si ce n'est pas 0, on boucle en attendant

; -------------------------------------------------------------------------
; GESTIONNAIRE DYNAMIQUE DE LA SCENE
; -------------------------------------------------------------------------
	SCENE_JEU_ACTUEL 
    CALL #0000                          
  
    LD   HL, FRAME_READY
    LD   (HL), #01            ; On remet le drapeau à 1 (bloquant)
    JR   BC_PRINCIPALE        ; On repart pour un tour de boucle

BC_PRINCIPALE_END

;=============================================================================
;  INSERTION DES ROUTINES EXTERNES
;=============================================================================
INCLUDE "SRC\ROUTINES.INC"

;=============================================================================
;  INSERTION DES VARIABLES Z80
;=============================================================================
; FRAME_READY : Flag de synchronisation avec l'interruption
; Valeurs     : 0 - Prêt, 1 - En attente interruption
;=============================================================================
FRAME_READY   : DEFB #01

;=============================================================================
;  FIN DU CODE
;=============================================================================

FIN_CODE

;=============================================================================
;  SAUVEGARDE DSK  
;=============================================================================
SAVE "PONG.BIN", DEBUT_CODE, FIN_CODE-DEBUT_CODE, DSK, "DSK\PONG.DSK"
