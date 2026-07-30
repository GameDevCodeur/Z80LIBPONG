; ==========================================================
; SCENE   : Déplacement balle horizontal/vertical
;           avec rebond en pixel perfect
; Entité  : ENT_PIXEL 
; Écran   : 128x192 px Mode 0 (64 octets/ligne, sprite 2x4)
; ==========================================================
        
    BALL_PX_LEFT_LIMIT    EQU 0                                          ;   0px
    BALL_PX_WIDTH_M0      EQU (1 * SCR_PX_PER_BYTE_M0)                   ;   2px
    BALL_PX_RIGHT_LIMIT   EQU (SCR_PX_WIDTH_M0 - BALL_PX_WIDTH_M0)       ; 126px 
    BALL_PX_CENTRE_H      EQU (SCR_PX_WIDTH_M0 - BALL_PX_WIDTH_M0) / 2   ;  63px
    
    BALL_PX_TOP_LIMIT     EQU 0                                          ;   0px
    BALL_PX_HEIGHT_M0     EQU 4                                          ;   4px
    BALL_PX_BOTTOM_LIMIT  EQU (SCR_PX_HEIGHT_M0 - BALL_PX_HEIGHT_M0)     ; 188px 
    BALL_PX_CENTRE_V      EQU (SCR_PX_HEIGHT_M0 - BALL_PX_HEIGHT_M0) / 2 ;  94px 

    DATALINE_BYTES        EQU 2

    INCLUDE "../SCENE_VIDE/F_BALL_CALCULATE_HORIZONTAL_BOUNCE.INC"
    INCLUDE "../SCENE_VIDE/F_BALL_APPLY_HORIZONTAL_DISPLACEMENT.INC"

    INCLUDE "../SCENE_VIDE/F_BALL_CALCULATE_VERTICAL_BOUNCE.INC"
    INCLUDE "../SCENE_VIDE/F_BALL_APPLY_VERTICAL_DISPLACEMENT.INC"
    
    INCLUDE "../SCENE_VIDE/F_BALL_LOGIQUE.INC"

    INCLUDE "../SCENE_VIDE/F_BALL_ERASE.INC"
    INCLUDE "../SCENE_VIDE/F_BALL_DRAW.INC"
    INCLUDE "../SCENE_VIDE/F_BALL_DISPLAY.INC"

; -----------------------------------------------------------------------------
; INITIALISATION DE LA SCÈNE
; -----------------------------------------------------------------------------
F_SCENE_VIDE_INITIALISATION:

    mGA_SET_MODE GA_MODE0_ROMS_OFF
    mGA_SET_INK GA_PEN_6, HW_BRIGHT_WHITE

    RET    

; --------------------------------------------------------
; ROUTINE : F_SCENE_VIDE
; --------------------------------------------------------
F_SCENE_VIDE
    
    ;CALL F_BALL_LOGIQUE

    LD   HL, (ENT_PIXEL.VramAddr)
    LD   (ENT_PIXEL.OldVramAddr), HL

    CALL F_BALL_CALCULATE_HORIZONTAL_BOUNCE    ; AFBC! 
    CALL F_BALL_APPLY_HORIZONTAL_DISPLACEMENT  ; AFHL!
    
    CALL F_BALL_CALCULATE_VERTICAL_BOUNCE      ; AFC!
    CALL F_BALL_APPLY_VERTICAL_DISPLACEMENT    ; AFHL!

    JR   F_BALL_DISPLAY

; -----------------------------------------------------------------------------
; STRUCTURES DE DONNÉES & TAMPONS
; -----------------------------------------------------------------------------
ENT_PIXEL
.PosX        DEFB BALL_PX_CENTRE_H         ; Coordonnée X = 63 pixels
.PosY        DEFB BALL_PX_CENTRE_V         ; Coordonnée Y = 94 pixels
.VelX        DEFB 1                        ; Vitesse X (-1 0 +1)
.VelY        DEFB 1                        ; Vitesse Y (-1 0 +1)
.Parite      DEFB 1                        ; 0 = Px en X Pair, 1 = Px en X Impair
.VramAddr    DEFW #F2DF                    ; Pointeur VRAM écran
.OldVramAddr DEFW #F2DF                    ; Pointeur VRAM écran précédent
.SrcPtr      DEFW 0                        ; Pointeur data du sprite

DATALINE:
    DEFB #3C, 0                            ; Graphisme Offset 0 (Ligne Pair)
    DEFB #14, #28                          ; Graphisme Offset 1 (Ligne Impair)

DATALINE_CLEAR
    DEFB 0, 0                              ; Octets vides pour effacement
