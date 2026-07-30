
; -------------------
; PARAMETRES SCENES         ; Identifiants des scènes
; -------------------
;ID_SCENE_VIDE				 EQU     0

ID_SCENE_TITRE              EQU     0
ID_SCENE_MENU               EQU     1
ID_SCENE_JEU                EQU     2
ID_SCENE_GAMEOVER           EQU     3

; ---------------------
; PARAMETRES GAME
; ---------------------
GAME_VRAM_TEXT              EQU #C18C
GAME_MENU_VRAM_TEXT         EQU #C30E
GAME_OVER_VRAM_TEXT_MENU    EQU #C30C
GAME_OVER_VRAM_TEXT_RESTART EQU #C38C
GAME_TITRE_PALETTE_SIZE     EQU    11
GAME_MENU_PALETTE_SIZE      EQU 	8
GAME_OVER_PALETTE_SIZE      EQU     8
GAME_PATTERN_WHITE          EQU   #3C		; Blanc - Blanc
GAME_PATTERN_BLACK          EQU   #00		; Noir  - Noir
GAME_PATTERN_BLACK_WHITE    EQU   #14 		; Noir  - Blanc

; -------------------
; PARAMETRES FONTE          ; Géométrie de la police d'écriture en pixels
; -------------------
FNT_WIDTH                   EQU     4
FNT_HEIGHT                  EQU     8

; ------------------
; PARAMETRES ETATS          ; Identifiants des états
; ------------------
ETAT_PAUSER_JEU             EQU     0
ETAT_LANCER_JEU             EQU     1
ETAT_QUITER_JEU             EQU     2

; ---------------------
; PARAMETRES PADDLE         ; Défine PADDLES
; ---------------------
PADDLE_VRAM_START           EQU #E281
PADDLE_WIDTH                EQU     1 		; Largeur octets
PADDLE_HEIGHT               EQU   3*8 		; Hauteur en lignes
PADDLE_LIMITE_BAS           EQU    74
PADDLE_LIMITE_HAUT          EQU   -74
PADDLE_PATTERN              EQU GAME_PATTERN_WHITE
PADDLE_BG_PATTERN           EQU GAME_PATTERN_BLACK

; ---------------------
; PARAMETRES BALL          ; Défine BALL
; ---------------------
BALL_VRAM_START             EQU #F2DF
BALL_SPEED_START            EQU 	4
BALL_BOUNCE_ACC_COUNTER     EQU 	5
BALL_WIDTH                  EQU     2 		; Largeur 2 octets
BALL_HEIGHT                 EQU     4 		; Hauteur 4 lignes
BALL_MOVE_LEFT              EQU    -1 		; Se déplacer à gauche
BALL_MOVE_RIGHT             EQU     1 		; Se déplacer à droite
BALL_EDGE_RIGHT             EQU    31 		; Bord droit  (CX= 30)
BALL_EDGE_LEFT              EQU   -31 		; Bord gauche (CX=-31)

; ---------------------
; PARAMETRES TERRAIN       ; Défine TERRAIN
; ---------------------
TERRAIN_WALL_PATTERN        EQU GAME_PATTERN_BLACK_WHITE
TERRAIN_VRAM_HIGH_WALL      EQU #C040
TERRAIN_VRAM_BOTTON_WALL    EQU #FD80

; ---------------------
; PARAMETRES SCORE         ; Défine SCORE
; ---------------------
SCORE_MAX                   EQU     9
SCORE_PATTERN               EQU GAME_PATTERN_WHITE
SCORE_BG_PATTERN            EQU GAME_PATTERN_BLACK
SCORE_GLIPH_HEIGHT          EQU    15
SCORE_GLIPH_WIDTH           EQU     4

