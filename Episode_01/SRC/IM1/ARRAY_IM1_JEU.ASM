
INCLUDE "F_IM1_COMPTEUR_FRAME.ASM"

; ------------------------------------------------------------
; TABLEAU DE VECTEURS JEU
; ------------------------------------------------------------
ARRAY_IM1_JEU
    DEFW F_IM1_COMPTEUR_FRAME       ; Index 0 → Compteur de temps
    DEFW F_IM1_SCAN_KEYBOARD        ; Index 1 → Lecture matrice du clavier
    DEFW F_IM1_SKIP                 ; Index 2 → pointe vers INT_SKIP
    DEFW F_IM1_SKIP                 ; Index 3 → pointe vers INT_SKIP
    DEFW F_IM1_SKIP                 ; Index 4 → pointe vers INT_SKIP
    DEFW F_IM1_SKIP                 ; Index 5 → pointe vers INT_SKIP
