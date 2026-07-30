
; --------------------------------------------------------
; ROUTINE : F_PIXEL_APPLIQUER_DEPLACEMENT
; Rôle    : Applique la nouvelle position X, met à jour la
;           parité, et fait évoluer VramAddr d'un octet si un
;           franchissement a eu lieu (condition dépendante du
;           sens de déplacement B).
; Entrée  : A = nouvelle position X à appliquer
;           B = vitesse utilisée pour ce déplacement (1 ou -1)
;           HL = valeur courante de (ENT_PIXEL.VramAddr)
; Sortie  : ENT_PIXEL.PosX, ENT_PIXEL.Parite, ENT_PIXEL.VramAddr
;           mis à jour
; Détruit : AF, HL
; --------------------------------------------------------
F_PIXEL_APPLIQUER_DEPLACEMENT

    LD   (ENT_PIXEL.PosX), A
    AND  %00000001 : LD (ENT_PIXEL.Parite), A
    
    BIT  7, B : JR   NZ, .left

.right
    OR   A                  ; régénérer Z
    RET  NZ
    INC  HL
    JR   .store

.left
    OR   A                  ; régénérer Z
    RET  Z
    DEC  HL

.store
    LD   (ENT_PIXEL.VramAddr), HL
    RET
