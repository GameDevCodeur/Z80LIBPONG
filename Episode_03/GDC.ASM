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
;  DEFINES Z80LIBv00
; =============================================================================
INCLUDE "SRC\Z80LIBv00\DEFINES.INC" 
INCLUDE "SRC\CONST.INC"
; =============================================================================

; =============================================================================
;  INSERTION DES MACROS DU JEU
; ============================================================================

; =============================================================================
;  VARIABLES RASM
; =============================================================================
DEBUG = 1
; =============================================================================

; =============================================================================
; BOUCLE PRINCIPALE ET INITIALISATION - AMSTRAD CPC
; =============================================================================
; Description : Point d'entrée principal du jeu. 
; 				- Configure le système.
;               - Gère la synchronisation de la boucle via interruptions.
;               - Utilise un gestionnaire d'état dynamique.
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

	CALL F_ETEINDRE_ENCRES  ; Coupe les couleurs, éviter les artefacts visuels
    CALL F_ATTENTE_VBL      ; Attend la synchronisation verticale de l'écran

    CALL F_CONFIG_CRTC      ; Configure taille de l'écran 32x24 (128x192)
    CALL F_CONFIG_GAME      ; Configure le jeu
    
    CALL F_IM1_CONFIG       ; Configure l'interruption IM1

    LD HL, FRAME_READY      ; Charge adresse drapeau synchronisation

SYS_INITIALISATION_END

; -------------------------------------------------------------------------
; BOUCLE PRINCIPALE (MAIN LOOP) 50Hz
; -------------------------------------------------------------------------

BC_PRINCIPALE
    ; On attend ici que la routine d'interruption
    ; passe la variable 'FRAME_READY' à 0, signalant début frame.

    LD   A, (hl)              ; Charge la valeur du drapeau
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
INCLUDE "SRC\SOURCES.INC"

;=============================================================================
;  INSERTION DES VARIABLES Z80
;=============================================================================
INCLUDE "SRC\VARIABLES.INC"

;=============================================================================
;  FIN DU CODE
;=============================================================================

FIN_CODE

;=============================================================================
;  SAUVEGARDE DSK  
;=============================================================================
SAVE "disc.bin", DEBUT_CODE, FIN_CODE-DEBUT_CODE, DSK, "DSK\gdc.dsk"
