
;--------------------------------------------------------
; mSET_NEXTLINE_DE
; Calcule l'adresse de la ligne pixel suivante (écran CPC)
;
; Entrée  : HL = adresse ligne pixel courante
; Sortie  : HL = adresse ligne pixel suivante
; Modifie : AF
;--------------------------------------------------------
MACRO mSET_NEXTLINE_DE

    LD  A, D
    ADD A, 8            ; ligne suivante dans le même bloc
    LD  D, A
    
    AND #38             ; teste si on dépasse le bloc
    JR  NZ, @END

    LD  A, E            ; changement de bloc :
    ADD A, #40          ; +#4000 pour passer au bloc suivant
    LD  E, A
    
    LD  A, D
    ADC A, #C0          ; ajuste l'octet haut + carry
    LD  D, A

    RES 3, D            ; réinitialiser le compteur de ligne à 0 au sein du nouveau bloc

@END
MEND

_HAS_mSET_NEXTLINE_DE EQU 1   ; marqueur : cette macro est bien définie
