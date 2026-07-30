
; =============================================================================
; FONCTION    : F_CONFIG_GAME
; =============================================================================
; Description : Initialise l'environnement logique du jeu. Génère les tables
;               graphiques et définit le premier état actif du moteur.
; Entrée      : Aucune
; Sortie      : Aucune
; Modifie     : AF, BC, DE, HL (Hérité de F_CREER_TABLE_ECRAN)
; =============================================================================
F_CONFIG_GAME
    
    ; --- 1. Précalcul des tables de lignes écran ---
    CALL F_CREER_TABLE_ECRAN    

    ; --- 2. Définition de l'état initial du jeu ---
    LD   B, ID_ETAT_TITRE  ; B = ID de l'état cible.
    
    ; Au lieu de faire CALL F_CHANGER_ETAT puis RET, on utilise un JP direct.
    JP   F_CHANGER_ETAT_JEU

F_CONFIG_GAME_
