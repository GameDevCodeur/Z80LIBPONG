
    ; ==================================================
    ;  FONCTIONS DU JEU
    ; ==================================================
    INCLUDE "ROUNTINES/LIB/LIB.INC"

    ; ==================================================
    ; SCENE MENU
    ; ==================================================
    INCLUDE "ROUNTINES/SCENE_MENU/F_COLOR_FLASH_EFFECT.INC"

    ; ==================================================
    ; SCENE GAME PONG
    ; ==================================================
    INCLUDE "ROUNTINES/SCENE_GAME/TERRAIN/TERRAIN.INC"
    INCLUDE "ROUNTINES/SCENE_GAME/BALLE/BALLE.INC"
    INCLUDE "ROUNTINES/SCENE_GAME/PADDLE/PADDLE.INC"
    INCLUDE "ROUNTINES/SCENE_GAME/IA/IA.INC"
    INCLUDE "ROUNTINES/SCENE_GAME/SCORE/SCORE.INC"
    INCLUDE "ROUNTINES/SCENE_GAME/PONG.INC"

    ; ==================================================
    ; SCENE PONG Z80LIB
    ; ==================================================
    ;INCLUDE "ROUNTINES/SCENES/F_SCENE_VIDE.ASM"

    INCLUDE "ROUNTINES/SCENES/F_SCENE_TITRE.ASM"
    INCLUDE "ROUNTINES/SCENES/F_SCENE_MENU.ASM"
    INCLUDE "ROUNTINES/SCENES/F_SCENE_GAME.ASM"
    INCLUDE "ROUNTINES/SCENES/F_SCENE_GAMEOVER.ASM"
