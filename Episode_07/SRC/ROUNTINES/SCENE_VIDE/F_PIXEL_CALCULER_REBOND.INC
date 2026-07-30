
; --------------------------------------------------------
; ROUTINE : F_PIXEL_CALCULER_REBOND
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
F_PIXEL_CALCULER_REBOND
    LD   A, (ENT_PIXEL.VelX)
    LD   B, A

    LD   A, (ENT_PIXEL.PosX)
    ADD  A, B

    CP   RIGHT_LIMIT
    JR   Z, .bounce
    CP   LEFT_LIMIT
    RET  NZ                     ; ni l'un ni l'autre mur -> pas de rebond, A prêt à sortir

.bounce
    LD   C, A                   ; sauvegarde la position X candidate
    LD   A, B                   ; NEG utilise A
    NEG                         ; A = -B (inverse la vitesse actuelle)
    LD   (ENT_PIXEL.VelX), A
    LD   A, C                   ; nouvelle position X
    RET
    