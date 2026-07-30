
    NUM_ROWS EQU 192

; =============================================================================
; VERSION OPTIMISÉE : F_CREER_TABLE_ECRAN
; =============================================================================
F_CREER_TABLE_ECRAN
    
    ; --- PREMIÈRE ÉTAPE : Génération de la table de base #C000 ---
    LD   HL, #C000                  ; Adresse de départ écran
    LD   DE, SCR_ADDR_TABLE_C0      ; Pointeur d'écriture table
    LD   B, NUM_ROWS                ; 192 lignes

.BC_C0
    LD   A, L
    LD   (DE), A                    ; Écrit poids faible
    INC  DE
    LD   A, H
    LD   (DE), A                    ; Écrit poids fort
    INC  DE

    ; Mathématiques écran CPC
    LD   A, H
    ADD  A, 8
    LD   H, A
    AND  #38
    JR   NZ, .skip_wrap

    LD   A, L
    ADD  A, #40
    LD   L, A
    LD   A, H
    ADC  A, #C0
    LD   H, A

.skip_wrap
    DJNZ .BC_C0

    ; --- DEUXIÈME ÉTAPE : Génération de la table #8000 par miroir ---
    LD   HL, SCR_ADDR_TABLE_C0      ; Source
    LD   DE, SCR_ADDR_TABLE_80      ; Destination
    LD   B, NUM_ROWS

.BC_80
    LD   A, (HL)
    LD   (DE), A                    ; Le poids faible est identique copie directement
    INC  HL
    INC  DE
    
    LD   A, (HL)                    ; On prend le poids fort (#C0...)
    XOR  #40                        ; On le transforme en #80...
    LD   (DE), A                    ; On le sauvegarde dans la seconde table
    INC  HL
    INC  DE
    
    DJNZ .BC_80

    ; Fixe le pointeur actif
    LD   HL, SCR_ADDR_TABLE_C0
    LD   (SCR_ADDR_TABLE), HL

    RET

   SCR_ADDR_TABLE_C0
      DEFS NUM_ROWS * 2
   SCR_ADDR_TABLE_C0_END

   SCR_ADDR_TABLE_80
      DEFS NUM_ROWS * 2
   SCR_ADDR_TABLE_80_END

   SCR_ADDR_TABLE 
        DEFS 2
   SCR_ADDR_TABLE_END

