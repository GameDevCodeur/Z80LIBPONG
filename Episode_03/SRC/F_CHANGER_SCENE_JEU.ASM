
;==============================================================
; F_CHANGER_SCENE_JEU
;--------------------------------------------------------------
; Description : Aiguille vers le sélecteur d'état demandé.
;               Invalide d'abord le vecteur IM1 courant,
;               puis redirige vers la fonction de sélection
;               correspondant à l'identifiant d'état reçu.
;--------------------------------------------------------------
; Entrées  : B - Identifiant du nouvel état
; Sorties  : RET si identifiant inconnu
;            Sinon JR vers F_SELECT_ETAT_xxx
; Modifie  : A, (IM1_INDEX)
;==============================================================
F_CHANGER_SCENE_JEU:

    LD   A, IM1_NOT_READY
    LD   (IM1_INDEX), A         ; Invalide le vecteur IM1
    
    LD   A, B                   ; Charge l'identifiant de la nouvelle SCENE
    
    CP   ID_SCENE_TITRE
    JR   Z, F_SELECT_SCENE_TITRE ; -> Sélection scène Titre

    CP   ID_SCENE_MENU
    JR   Z, F_SELECT_SCENE_MENU  ; -> Sélection scène Menu

    CP   ID_SCENE_JEU
    JR   Z, F_SELECT_SCENE_JEU   ; -> Sélection scène Jeu

    CP   ID_SCENE_TEST
    JR   Z, F_SELECT_SCENE_TEST  ; -> Sélection scène Test

    RET                         ; Identifiant inconnu, retour sans action

;==============================================================
; F_SELECT_SCENE_TEST
;--------------------------------------------------------------
; Description : Sélectionne et initialise l'état "Test".
;               Met à jour le pointeur d'état courant,
;               configure le vecteur d'interruption IM1
;               et saute vers le setup de l'état Test.
;--------------------------------------------------------------
; Entrées  : F_SCENE_TEST       - Adresse de la fonction d'état Test
;            ARRAY_IM1_DEFAUT  - Tableau des handlers IM1 par défaut
; Sorties  : Aucune
; Modifie  : HL, (ETAT_JEU_ACTUEL+1), (IM1_CURRENT)
;==============================================================
F_SELECT_SCENE_TEST:

    LD  HL, F_SCENE_TEST
    LD  (SCENE_JEU_ACTUEL+1), HL     ; Mise à jour du pointeur d'état courant
    
    LD  HL, ARRAY_IM1_DEFAUT
    LD  (IM1_CURRENT), HL            ; Configuration du vecteur IM1 par défaut
    
    JP  F_SCENE_TEST_INITIALISATION  ; Initialisation de l'état Test

;==============================================================
; F_SELECT_SCENE_TITRE
;--------------------------------------------------------------
; Description : Sélectionne et initialise l'état "Titre".
;               Met à jour le pointeur d'état courant,
;               configure le vecteur d'interruption IM1
;               et saute vers le setup de l'état Titre.
;--------------------------------------------------------------
; Entrées  : F_SCENE_TITRE      - Adresse de la fonction d'état Titre
;            ARRAY_IM1_TITRE   - Tableau des handlers IM1 de l'état Titre
; Sorties  : Aucune
; Modifie  : HL, (SCENE_JEU_ACTUEL+1), (IM1_CURRENT)
;==============================================================
F_SELECT_SCENE_TITRE:

    LD  HL, F_SCENE_TITRE
    LD  (SCENE_JEU_ACTUEL+1), HL     ; Mise à jour du pointeur d'état courant
   
    LD  HL, ARRAY_IM1_TITRE
    LD  (IM1_CURRENT), HL            ; Configuration du vecteur IM1 Titre
   
    JP  F_SCENE_TITRE_INITIALISATION ; Initialisation de l'état Titre

;==============================================================
; F_SELECT_SCENE_MENU
;--------------------------------------------------------------
; Description : Sélectionne et initialise l'état "Menu".
;               Met à jour le pointeur d'état courant,
;               configure le vecteur d'interruption IM1
;               et saute vers le setup de l'état Menu.
;--------------------------------------------------------------
; Entrées  : F_SCENE_MENU      - Adresse de la fonction d'état Menu
;            ARRAY_IM1_MENU   - Tableau des handlers IM1 de l'état Menu
; Sorties  : Aucune
; Modifie  : HL, (SCENE_JEU_ACTUEL+1), (IM1_CURRENT)
;==============================================================
F_SELECT_SCENE_MENU:

    LD  HL, F_SCENE_MENU
    LD  (SCENE_JEU_ACTUEL+1), HL     ; Mise à jour du pointeur d'état courant
    LD  HL, ARRAY_IM1_MENU
    LD  (IM1_CURRENT), HL            ; Configuration du vecteur IM1 Menu   
    JP  F_SCENE_MENU_INITIALISATION  ; Initialisation de l'état Menu

;==============================================================
; F_SELECT_SCENE_JEU
;--------------------------------------------------------------
; Description : Sélectionne et initialise l'état "Jeu".
;               Met à jour le pointeur d'état courant,
;               configure le vecteur d'interruption IM1
;               et saute vers le setup de l'état Jeu.
;--------------------------------------------------------------
; Entrées  : F_SCENE_JEU      - Adresse de la fonction d'état Jeu
;            ARRAY_IM1_JEU   - Tableau des handlers IM1 de l'état Jeu
; Sorties  : Aucune
; Modifie  : HL, (SCENE_JEU_ACTUEL+1), (IM1_CURRENT)
;==============================================================
F_SELECT_SCENE_JEU:

    LD  HL, F_SCENE_JEU
    LD  (SCENE_JEU_ACTUEL+1), HL     ; Mise à jour du pointeur d'état courant
    LD  HL, ARRAY_IM1_JEU
    LD  (IM1_CURRENT), HL            ; Configuration du vecteur IM1 Jeu
    JP  F_SCENE_JEU_INITIALISATION   ; Initialisation de l'état Jeu
