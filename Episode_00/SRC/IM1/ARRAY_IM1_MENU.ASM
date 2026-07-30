 
F_IM1_TEXT_BLINK
    
    LD   A, (BLINK)
    RRCA 
    LD (BLINK), A

    LD   B, HI(GA_PORT)

    JR   C, IM1_TEXT_WHITE

IM1_TEXT_BLACK

    LD   A, GA_PEN_6   
    LD   D, HW_BLACK
    mGA_SET_PEN_INK

    LD   A, GA_PEN_7   
    mGA_SET_PEN_INK

    LD   A, TMP_1S
    CALL F_TEMPO

    JP  F_IM1_SKIP

IM1_TEXT_WHITE

    LD   A, GA_PEN_6   
    LD   D, HW_BRIGHT_WHITE
    mGA_SET_PEN_INK

    LD   A, GA_PEN_7   
    LD   D, HW_WHITE
    mGA_SET_PEN_INK

    LD   A, TMP_1S
    CALL F_TEMPO

    JP  F_IM1_SKIP

; ------------------------------------------------------------
; TABLEAU DE VECTEURS MENU
; ------------------------------------------------------------
ARRAY_IM1_MENU:
    DEFW F_IM1_SKIP                 ; Index 0 → pointe vers INT_SKIP
    DEFW F_IM1_SCAN_KEYBOARD        ; Index 1 → pointe vers INT_SKIP
    DEFW F_IM1_SKIP                 ; Index 2 → pointe vers INT_SKIP
    DEFW F_IM1_SKIP                 ; Index 3 → pointe vers INT_SKIP
    DEFW F_IM1_SKIP                 ; Index 4 → pointe vers INT_SKIP
    DEFW F_IM1_SKIP                 ; Index 5 → pointe vers INT_SKIP

BLINK:
    DEFB %01010101
