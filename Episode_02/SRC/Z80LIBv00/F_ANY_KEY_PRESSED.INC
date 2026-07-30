;==============================================================
; F_ANY_KEY_PRESSED
;--------------------------------------------------------------
; Description : Teste si une touche quelconque est pressée
;               en parcourant les 10 octets de la matrice
;               clavier.
;--------------------------------------------------------------
; Entrées  : KBD_BUFFER_RAM - Adresse de la matrice clavier
; Sorties  : A = 0   aucune touche pressée  (Z=1)
;            A != 0  au moins une touche    (Z=0 / NZ)
; Modifie  : A, HL, B
;==============================================================
F_ANY_KEY_PRESSED:
    XOR  A                      ; A = 0, reset accumulateur
    LD   HL, KBD_BUFFER_RAM     ; HL = début matrice clavier
    LD   B, 10                  ; 10 lignes à parcourir

.LOOP:
    OR   (HL)                   ; OR la ligne courante dans A (met à jour Z)
    INC  HL                     ; Ligne suivante
    DJNZ .LOOP                  ; Répète (ne modifie pas les flags)

    RET                         ; Les flags de la boucle sont préservés !
