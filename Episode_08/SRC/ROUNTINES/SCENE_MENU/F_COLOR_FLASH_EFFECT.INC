
F_COLOR_FLASH_EFFECT                    ; appelée à chaque frame

    ld   hl,FlashCounter
    dec  (hl)
    ret  nz                             ; cas courant (50 trames) : sortie rapide

    ld   (hl),50                        ; relance le compte à rebours 50 (1 sec)  
    
    ld   hl,FlashState
    rrc  (hl)                           ; lit, tourne ET réécrit (HL) en UNE instruction
                                        ; carry alterne 0/1/0/1... à chaque appel

    sbc  a,a                            ; A = 0 si carry=0, #FF si carry=1
    and  %00000100                      ; A = 0 ou 4 → offset dans la table

    ld   e,a : ld d,0
    ld   hl,FlashColors
    add  hl,de

    ld   b, HI(GA_PORT)

    ld   a,(hl) : out (c),a : inc hl    ; sélection encre 6
    ld   a,(hl) : out (c),a : inc hl    ; couleur encre 6
    ld   a,(hl) : out (c),a : inc hl    ; sélection encre 7
    ld   a,(hl) : out (c),a             ; couleur encre 7
    
    ret

FlashCounter: db 50                     ; durée (s) = N / 50
FlashState:   db %10101010

FlashColors:
    db 6,HW_BLACK,          7,HW_BLACK  ; état 0
    db 6,HW_BRIGHT_WHITE,   7,HW_WHITE  ; état 1
    