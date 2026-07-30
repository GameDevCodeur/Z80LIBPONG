
; --------------------------------------------------------
; ROUTINE : F_PADDLE_INITIALISER
; Rôle    : Initialise la raquette à sa position de départ
;           (adresse VRAM et coordonnée Y à zéro).
; Entrée  : aucune
; Sortie  : ENT_PADDLE.VRAM_XY, ENT_PADDLE.OLD_XY = PADDLE_VRAM_START
;           ENT_PADDLE.CY = 0
; Détruit : AF, HL
; --------------------------------------------------------

F_PADDLE_INITIALISER

    LD  HL, PADDLE_VRAM_START
    LD  (ENT_PADDLE.VRAM_XY), HL
    LD  (ENT_PADDLE.OLD_XY), HL
    XOR A
    LD  (ENT_PADDLE.CY), A

    RET
