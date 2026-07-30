
;--------------------------------------------------------
; mSET_NEXTLINE_HL
; Calcule l'adresse de la ligne pixel suivante (écran CPC)
;
; Entrée  : HL = adresse ligne pixel courante
; Sortie  : HL = adresse ligne pixel suivante
; Modifie : AF
;--------------------------------------------------------
MACRO mSET_NEXTLINE_HL

    LD  A, H : ADD A, 8 : LD  H, A     ; ligne suivante dans le même bloc
    
    AND #38             ; teste les bits 5-4-3 (zone de ligne dans le bloc)
    JR  NZ, @END        ; si pas encore débordé du bloc de 8 lignes, on sort ici

    ; --- ici, on a débordé : changement de bande ---
    LD  A, #40 : ADD L : LD L, A       ; L += #40 (avance dans la bande suivante)
    LD  A, #C0 : ADC H : LD H, A       ; H = H + #C0 + retenue
    RES 3, H                           ; <-- efface le bit

@END
MEND
