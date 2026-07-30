
F_IM1_COMPTEUR_FRAME
    LD HL, (TICK_FRAME)         ; Charge le compteur de temps/ticks en RAM
    INC HL                      ; Incrémente le compteur (+1)
    LD (TICK_FRAME), HL         ; Sauvegarde la nouvelle valeur
    JP F_IM1_SKIP
