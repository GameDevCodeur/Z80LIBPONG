
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
    
    BIT  7, B : JR NZ, .left         ; si Bit(7)=1 Z=0

.right
    OR   A                           ; A or A > 0000 OR 0000 = 0000  Z=1
    RET  NZ                          ; A or A > 0001 OR 0001 = 0001  Z=0
    INC  HL
 
.store
    LD   (ENT_PIXEL.VramAddr), HL
    RET

.left
    OR   A                           ; A or A > 0001 OR 0001 = 0000  Z=0
    RET  Z                           ; A or A > 0000 OR 0000 = 0000  Z=1
    DEC  HL
    JR   .store
