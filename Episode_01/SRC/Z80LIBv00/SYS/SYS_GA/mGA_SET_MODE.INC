
  ;============================================================
                    MACRO mGA_SET_MODE IRMR
  ;------------------------------------------------------------
  ; Initialise IRMR
  ;------------------------------------------------------------
  ; Entrée   : C=IRMR
  ; Sortie   :
  ; Detruits : BC!
  ;------------------------------------------------------------

  	LD   B, HI(GA_PORT)
  	LD   C, {IRMR}   	; Sélectionne IRM  
  	OUT (C), C     	    ; Applique IRM
  
  MEND
 
  ;  CMD IR UR LR MODE 
  ; %100  0  0  0   00
  MODE0_ROMS_ON  EQU %10000000
  MODE1_ROMS_ON  EQU %10000001 
  MODE2_ROMS_ON  EQU %10000010
  MODE3_ROMS_ON  EQU %10000011
  MODE0_ROMS_OFF EQU %10001100
  MODE1_ROMS_OFF EQU %10001101 
  MODE2_ROMS_OFF EQU %10001110
  MODE3_ROMS_OFF EQU %10001111
