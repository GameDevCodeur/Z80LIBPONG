
; =============================================================================
; FONCTION    : F_CONFIG_GAME
; =============================================================================
; Description : Initialise l'environnement logique du jeu. Génère les tables
;               graphiques et définit le premier état actif du moteur.
; Entrée      : Aucune
; Sortie      : Aucune
; Modifie     : AF, BC, DE, HL (Hérité de F_SCR_CREER_TABLE)
; =============================================================================
F_CONFIG_GAME
    
    ; --- 1. Précalcul deux tables (C000-8000) de lignes écran ---
    CALL F_SCR_CREER_TABLE    

    ; --- 2. Définition de la scéne initial du jeu ---
    LD   B, ID_SCENE_TITRE  ; B = ID de l'état cible.
    
    ; Au lieu de faire CALL F_CHANGER_ETAT puis RET, on utilise un JP direct.
    JP   F_CHANGER_SCENE_JEU

F_CONFIG_GAME_
