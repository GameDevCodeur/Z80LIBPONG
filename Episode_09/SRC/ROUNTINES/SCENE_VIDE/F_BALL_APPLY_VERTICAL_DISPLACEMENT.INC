
; --------------------------------------------------------
; ROUTINE : F_BALL_APPLY_VERTICAL_DISPLACEMENT
; Rôle    : Applique la nouvelle position Y et ajuste VramAddr
;           Ecran 128x192.
; Entrée  : A = nouvelle position Y à appliquer
;           B = vitesse utilisée (1, -1 ou 0)
;           HL = valeur courante de (ENT_PIXEL.VramAddr)
; Sortie  : ENT_PIXEL.PosY, ENT_PIXEL.VramAddr mis à jour
; Détruit : AF, C
; --------------------------------------------------------
F_BALL_APPLY_VERTICAL_DISPLACEMENT
    
    LD   C, A                        ; sauvegarde la nouvelle PosY
    LD   A, B : AND A : RET Z
    
    LD   A, C
    LD   (ENT_PIXEL.PosY), A
    
    BIT  7, B
    JR   NZ, .up
    
.down
    mSET_NEXTLINE_HL
    JR   .store
    
.up
    mSET_PREVIOUSLINE_HL

.store
    LD   (ENT_PIXEL.VramAddr), HL
    RET
