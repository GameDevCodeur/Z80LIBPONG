
; =============================================================================
; FONCTION    : F_CONFIG_GAME
; =============================================================================
; Description : Initialise l'environnement logique du jeu. Génère les tables
;               graphiques et définit le premier état actif du moteur.
; Entrée      : Aucune
; Sortie      : Aucune
; Modifie     : AF, BC, DE, HL (Hérité de F_SCR_CREER_TABLE)
; =============================================================================
F_CFG_GAME
    LD   B, ID_SCENE_TITRE
    JP   F_CHANGER_SCENE_JEU

