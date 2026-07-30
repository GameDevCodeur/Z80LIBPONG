
; --------------------------------------------------------
; ROUTINE : F_BALL_CALCULATE_HORIZONTAL_BOUNCE
; Rôle    : Calcule la nouvelle position X candidate à partir
;           de VelX, et gère le rebond sur les bords gauche/
;           droite (inversion de VelX pour la frame suivante).
; Entrée  : ENT_PIXEL.PosX, ENT_PIXEL.VelX
; Sortie  : A = nouvelle position X à appliquer
;           B = vitesse RÉELLEMENT utilisée pour CE déplacement
;               (avant inversion éventuelle par le rebond)
;           ENT_PIXEL.VelX mis à jour si rebond (effet différé)
; Détruit : AF, BC
; --------------------------------------------------------
F_BALL_CALCULATE_HORIZONTAL_BOUNCE

    LD   A, (ENT_PIXEL.VelX)
    LD   B, A

    LD   A, (ENT_PIXEL.PosX)    ; A = X + VX
    ADD  A, B

    CP   BALL_PX_RIGHT_LIMIT
    JR   Z, .bounce             ; Si = 126 Z=1

    CP   BALL_PX_LEFT_LIMIT     ; Si = 0   Z=1
    RET  NZ                     ; ni l'un ni l'autre mur -> pas de rebond, A prêt à sortir

.bounce
    LD   C, A                   ; Sauvegarde la position X candidate
    LD   A, B                   ; NEG utilise A uniquement
    NEG                         ; A = -A (inverse la vitesse actuelle)
    LD   (ENT_PIXEL.VelX), A
    LD   A, C                   ; nouvelle position X
    RET
    