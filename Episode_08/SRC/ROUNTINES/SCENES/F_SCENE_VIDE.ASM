; ==========================================================
; MODULE : Déplacement pixel/balle horizontal avec rebond
; Entité  : ENT_PIXEL 
; Écran   : 128x192 px Mode 0 (64 octets/ligne, sprite 2x4)
; ==========================================================
        
    BALL_PX_LEFT_LIMIT    EQU 0                                         ;   0px
    BALL_PX_WIDTH_M0      EQU (1 * SCR_PX_PER_BYTE_M0)
    BALL_PX_RIGHT_LIMIT   EQU (SCR_PX_WIDTH_M0 - BALL_PX_WIDTH_M0)      ; 126px 
    BALL_PX_CENTRE_H      EQU (SCR_PX_WIDTH_M0 - BALL_PX_WIDTH_M0) / 2  ;  63px
    DATALINE_BYTES        EQU 2

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

    CALL F_PIXEL_CALCULER_REBOND
    CALL F_PIXEL_APPLIQUER_DEPLACEMENT

    ;CALL F_PIXEL_LOGIQUE
    JR   F_PIXEL_RENDU

; -----------------------------------------------------------------------------
; STRUCTURES DE DONNÉES & TAMPONS
; -----------------------------------------------------------------------------
ENT_PIXEL_POSITION
ENT_PIXEL
.PosX        DEFB BALL_PX_CENTRE_H         ; Coordonnée X = 63 pixels
.PosY        DEFB 0                        ; Coordonnée Y =  0 pixels
.VelX        DEFB 1                        ; Vitesse X
.Parite      DEFB 1                        ; 0 = Pixel Pair, 1 = Pixel Impair
.VramAddr    DEFW #F2DF                    ; Pointeur VRAM écran
.OldVramAddr DEFW #F2DF                    ; Pointeur VRAM écran
.SrcPtr      DEFW 0                        ; Pointeur data du sprite

DATALINE:
    DEFB #3C, 0                            ; Graphisme Offset 0 (Ligne Pair)
    DEFB #14, #28                          ; Graphisme Offset 1 (Ligne Impair)

DATALINE_CLEAR
    DEFB 0, 0                              ; Octets vides pour effacement
