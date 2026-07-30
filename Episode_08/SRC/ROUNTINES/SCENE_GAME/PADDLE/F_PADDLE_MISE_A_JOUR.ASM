
; ===============================================================
;  INSERTION DES MACROS
; ===============================================================
 
INCLUDE "mGET_PADDLE_LIMITE.INC"

; --------------------------------------------------------
; ROUTINE : F_PADDLE_MISE_A_JOUR
; Rôle    : Lit les touches A (haut) / Q (bas) et met à jour
;           la position Y de la raquette + son adresse VRAM,
;           avec clamp aux limites haute/basse du terrain.
; Entrée  : ENT_PADDLE.CY, ENT_PADDLE.VRAM_XY
; Sortie  : ENT_PADDLE.CY, ENT_PADDLE.VRAM_XY, ENT_PADDLE.OLD_XY
;           mis à jour si déplacement effectué
; Détruit : AF, HL
; Dépend  : mKEY_A_REQUESTED, mKEY_Q_REQUESTED, mGET_PADDLE_LIMITE,
;           mSET_NEXTLINE_HL, mSET_PREVIOUSLINE_HL
; --------------------------------------------------------

F_PADDLE_MISE_A_JOUR

    mKEY_A_REQUESTED (VOID)        ; AF!
    JR  Z, .haut
    mKEY_Q_REQUESTED (VOID)        ; AF!
    RET NZ

.bas
    mGET_PADDLE_LIMITE PADDLE_LIMITE_BAS : RET Z

    INC A
    LD  (ENT_PADDLE.CY), A
    LD  HL, (ENT_PADDLE.VRAM_XY)
    LD  (ENT_PADDLE.OLD_XY), HL

    mSET_NEXTLINE_HL (VOID)
    JR  .store

.haut
    mGET_PADDLE_LIMITE PADDLE_LIMITE_HAUT : RET Z

    DEC A
    LD  (ENT_PADDLE.CY), A
    LD  HL, (ENT_PADDLE.VRAM_XY)
    LD  (ENT_PADDLE.OLD_XY), HL
    mSET_PREVIOUSLINE_HL (VOID)

.store
    LD  (ENT_PADDLE.VRAM_XY), HL
    RET
	