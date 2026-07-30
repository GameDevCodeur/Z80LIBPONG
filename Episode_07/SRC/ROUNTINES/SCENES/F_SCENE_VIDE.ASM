; ==========================================================
; MODULE : Déplacement pixel/balle horizontal avec rebond
; Entité  : ENT_PIXEL 
; Écran   : 128x192 px Mode 0 (64 octets/ligne, sprite 2x4)
; ==========================================================
    
    PIXEL_WIGHT     EQU 2
    LEFT_LIMIT      EQU 0
    RIGHT_LIMIT     EQU (SCR_WIDTH_M0 - PIXEL_WIGHT)
    PIXEL_CENTRE_X  EQU RIGHT_LIMIT / 2

    INCLUDE "../SCENE_VIDE/mAFFICHE_LIGNE_M0.INC"
    INCLUDE "../SCENE_VIDE/EFFACEBALLE.INC"
    INCLUDE "../SCENE_VIDE/DESSINEBALLE.INC"

    INCLUDE "../SCENE_VIDE/F_PIXEL_CALCULER_REBOND.INC"
    INCLUDE "../SCENE_VIDE/F_PIXEL_APPLIQUER_DEPLACEMENT.INC"
    INCLUDE "../SCENE_VIDE/F_PIXEL_LOGIQUE.INC"

    INCLUDE "../SCENE_VIDE/F_PIXEL_RENDU.INC"

; -----------------------------------------------------------------------------
; INITIALISATION DE LA SCÈNE
; -----------------------------------------------------------------------------
F_SCENE_VIDE_INITIALISATION:

    mGA_SET_MODE GA_MODE0_ROMS_OFF
    LD    DE, (ENT_PIXEL.VramAddr)
    CALL  DessineBalle
    mGA_SET_INK GA_PEN_6, HW_BRIGHT_WHITE

    RET    

; --------------------------------------------------------
; ROUTINE : F_SCENE_VIDE
; --------------------------------------------------------
F_SCENE_VIDE
    
    LD   HL, (ENT_PIXEL.VramAddr)
    LD   (ENT_PIXEL.OldVramAddr), HL 

    LD   A, (ENT_PIXEL.PosX) 
    INC  A 
    LD   B, 1 
    CALL F_PIXEL_APPLIQUER_DEPLACEMENT

    ;CALL F_PIXEL_LOGIQUE
    JR   F_PIXEL_RENDU

; -----------------------------------------------------------------------------
; STRUCTURES DE DONNÉES & TAMPONS
; -----------------------------------------------------------------------------
ENT_PIXEL_POSITION
ENT_PIXEL
.PosX        DEFB PIXEL_CENTRE_X           ; Coordonnée X = (128-2)/2 pixels
.PosY        DEFB 0                        ; Coordonnée Y = 0 pixels
.VelX        DEFB 1                        ; Vitesse X
.Parite      DEFB 1                        ; 0 = Pixel Pair, 1 = Pixel Impair
.VramAddr    DEFW #F2DF                    ; Pointeur VRAM écran
.OldVramAddr DEFW #F2DF                    ; Pointeur VRAM écran
.SrcPtr      DEFW 0                        ; Pointeur data du sprite

DonneesLigne:
    DEFB #3C, 0                            ; Graphisme Offset 0 (Pair)
    DEFB #14, #28                          ; Graphisme Offset 1 (Impair)
    DEFB 0, 0                              ; Octets vides pour effacement
