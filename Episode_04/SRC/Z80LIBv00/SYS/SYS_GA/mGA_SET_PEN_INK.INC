
  ;============================================================
                    MACRO mGA_SET_PEN_INK  
  ;------------------------------------------------------------
  ; Sélectionne l’encre du stylo current                     A! 
  ;------------------------------------------------------------
  ; Entrées : A=PEN, D=COULEUR HARDWARE, B = GA_PORT
  ; Sorties : 
  ; Detruits:
  ;------------------------------------------------------------  
    
  OUT	(C),A 	    ; Numéro du stylo
  OUT (C),D      	; Couleur du stylo
  
  MEND 

