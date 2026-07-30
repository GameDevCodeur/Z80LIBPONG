
; --------------------------------------------------------
; ROUTINE : F_BALL_CALCULATE_VERTICAL_BOUNCE
; Rôle    : Calcule la nouvelle position Y candidate à partir
;           de VelY, et gère le rebond sur les bords haut/bas
;           (inversion de VelY pour la frame suivante).
;           Convention B : B=1 -> déplacement vers le bas
;                          B=-1 -> déplacement vers le haut
; Entrée  : ENT_PIXEL.PosY, ENT_PIXEL.VelY
; Sortie  : A = nouvelle position Y à appliquer
;           B = vitesse RÉELLEMENT utilisée pour CE déplacement.
;           ENT_PIXEL.VelY mis à jour si rebond.
; Détruit : AF, BC
; --------------------------------------------------------

F_BALL_CALCULATE_VERTICAL_BOUNCE

    LD   A, (ENT_PIXEL.VelY)
    LD   B, A

    LD   A, (ENT_PIXEL.PosY)
    ADD  A, B

    CP   BALL_PX_BOTTOM_LIMIT
    JR   Z, .bounce
    
    CP   BALL_PX_TOP_LIMIT
    RET  NZ                      ; ni l'un ni l'autre bord -> pas de rebond

.bounce
    LD   C, A                    ; sauvegarde la position candidate
    LD   A, B
    NEG                          ; inverse la vitesse actuelle
    LD   (ENT_PIXEL.VelY), A
    LD   A, C
    RET