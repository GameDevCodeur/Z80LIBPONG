
; FRAME_READY : Flag de synchronisation avec l'interruption
; Valeurs     : 0 - Prêt à calculer, 1 - En attente interruption
FRAME_READY   : DEFB #01

; FRAME_READY : Compteur de temps (FRAMES)
TICK_FRAME 	  : DEFW #0000
