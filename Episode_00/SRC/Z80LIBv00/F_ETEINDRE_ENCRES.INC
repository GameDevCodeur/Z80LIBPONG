; =============================================================================
; FONCTION    : F_ETEINDRE_ENCRES
; =============================================================================
; Description : Force la couleur noire sur les 16 encres de la palette ainsi
;               que sur la bordure de l'écran (17 encres au total).
;               Utilisé pour masquer l'écran pendant les chargements ou la VBL.
; Entrée      : Aucune
; Sortie      : Aucune
; Modifie     : AF, B, D (Les registres d'origine sont écrasés)
; =============================================================================

F_ETEINDRE_ENCRES

    LD   A, 16                      ; On commence par la 17e encre (16 = Bordure)
    LD   B, HI(GA_PORT)             ; B = port Gate Array
    LD   D, HW_BLACK                ; D = couleur hardware noir
    
.BC_ENCRES

    mGA_SET_PEN_INK (VOID)          ; Définit l'encre A conjointe avec la couleur D
    
    DEC  A                          ; Encre précédente (gère les flags automatiquement)
    JP   P, .BC_ENCRES              ; Boucle tant que A est Positif (de 16 à 0)

    RET

F_ETEINDRE_ENCRES_
