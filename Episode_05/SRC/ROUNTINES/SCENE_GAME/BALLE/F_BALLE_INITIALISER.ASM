; --------------------------------------------------------
; ROUTINE : F_BALLE_INITIALISER
; Rôle    : Initialise la balle à sa position et vitesse
;           de départ (compteurs remis à zéro).
; Entrée  : aucune
; Sortie  : ENT_BALLE.CR = 0, ENT_BALLE.CX = 0
;           ENT_BALLE.SP = 4 (vitesse initiale)
;           ENT_BALLE.XY = ENT_BALLE.OLDXY = #F2DF
; Détruit : AF, HL
; --------------------------------------------------------

F_BALLE_INITIALISER

    XOR A
    LD  (ENT_BALLE.CR), A       ; Compteur accélération = 0
    LD  (ENT_BALLE.CX), A

    LD  A, BALL_SPEED_START
    LD  (ENT_BALLE.SP), A       ; Vitesse initiale = 4

    LD  HL, BALL_VRAM_START
    LD  (ENT_BALLE.XY), HL
    LD  (ENT_BALLE.OLDXY), HL

    RET
    