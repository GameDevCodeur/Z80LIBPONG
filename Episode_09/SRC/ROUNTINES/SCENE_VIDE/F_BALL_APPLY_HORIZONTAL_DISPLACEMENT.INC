
; --------------------------------------------------------
; ROUTINE : F_BALL_APPLY_HORIZONTAL_DISPLACEMENT
; Rôle    : Applique la nouvelle position X, met à jour la
;           parité, et fait évoluer VramAddr d'un octet si un
;           franchissement a eu lieu.
; Entrée  : A = nouvelle position X à appliquer
;           B = vitesse utilisée (1, -1 ou 0)
;           HL = valeur courante de (ENT_PIXEL.VramAddr)
; Sortie  : ENT_PIXEL.PosX, ENT_PIXEL.Parite, ENT_PIXEL.VramAddr
;           mis à jour
; Détruit : AF, C
; --------------------------------------------------------
F_BALL_APPLY_HORIZONTAL_DISPLACEMENT

    LD   C, A                            ; sauvegarde la nouvelle PosX
    LD   A, B : AND A : RET Z            ; velX=0 
    
    LD   A, C
    LD   (ENT_PIXEL.PosX), A
    AND  %00000001 : LD (ENT_PIXEL.Parite), A
    
    BIT  7, B : JR NZ, .left
    
.right
    OR   A
    RET  NZ                              ; parité=1 (pixel droite) : même octet
    INC  HL                              ; parité=0 (pixel gauche) : octet suivant
    JR   .store
    
.left
    OR   A
    RET  Z                               ; parité=0 (pixel gauche) : même octet
    DEC  HL                              ; parité=1 (pixel droite) : octet précédent

.store
    LD   (ENT_PIXEL.VramAddr), HL
    RET
