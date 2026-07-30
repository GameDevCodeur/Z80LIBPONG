
;--------------------------------------------------------
; mSET_NEXTLINE_HL
; Calcule l'adresse de la ligne pixel suivante (écran CPC)
;
; Entrée  : HL = adresse ligne pixel courante
; Sortie  : HL = adresse ligne pixel suivante
; Modifie : AF
;--------------------------------------------------------
MACRO mSET_NEXTLINE_HL

    LD  A, H
    ADD A, 8            ; ligne suivante dans le même bloc
    LD  H, A
    
    AND #38             ; teste si on dépasse le bloc
    JR  NZ, @END

    LD  A, L            ; changement de bloc :
    ADD A, #40          ; +#4000 pour passer au bloc suivant
    LD  L, A
    
    LD  A, H
    ADC A, #C0          ; ajuste l'octet haut + carry
    LD  H, A

@END
MEND
