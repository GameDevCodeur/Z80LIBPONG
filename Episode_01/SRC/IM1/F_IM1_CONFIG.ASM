; =============================================================================
; GESTIONNAIRE DES INTERRUPTIONS MATÉRIELLES (IM 1) - AMSTRAD CPC
; =============================================================================
; Description : Configuration du vecteur d'interruption #0038 (RST 38h).
;               Intercepte les signaux du Gate Array pour synchroniser le jeu.
;               Gère le diviseur de fréquence (300 Hz matériel -> 50 Hz logique).
; =============================================================================

; -------------------------------------------------------------------------
; F_CONFIG_IM1 : Initialisation et routage de l'interruption
; -------------------------------------------------------------------------
; Sortie : Mode IM1 activé, RST 38h patché, Interruptions réactivées (EI).
; Modifie : Registres A et HL.
; -------------------------------------------------------------------------
F_IM1_CONFIG

    di                              ; Désactive temporairement les interruptions

    ; Securisation de l'adresse #0038
    ;ld   a, #C3                     ; Opcode Z80 pour l'instruction "JP" (Jump)
    ;ld   (#0038), a                 ; Écrit "JP" directement à l'adresse de l'IT

    ; Patch du vecteur de saut
    ld   hl, F_IM1_CALLBACK         ; Charge l'adresse de notre routine maison
    ld   (#0039), hl                ; Écrit cette adresse juste après le "JP"

    ei                              ; Réactive globalement les interruptions
    ret

F_IM1_CONFIG_END
