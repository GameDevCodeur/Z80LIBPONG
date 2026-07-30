

;============================================================================
						MACRO mPPI_READ_KEYBOARD
;============================================================================
; DESCRIPTION : 
;   Realise le scan complet de la matrice du clavier Amstrad CPC (10 lignes).
;   Remplit un buffer en mémoire avec l'etat des touches.
;
; PARAMETRES D'ENTREE :
;   adr_buffer : Adresse en RAM ou stocker les 10 octes lus (Lignes 0 a 9).
;   Le stockage se fait de l'adresse (adr_buffer+9) a (adr_buffer).
;----------------------------------------------------------------------------
; REGISTRES MODIFIES :
;   AF, BC, HL
;----------------------------------------------------------------------------
; REGISTRES PRESERVES :
;   Aucun
;----------------------------------------------------------------------------

	; --- HL pointe sur la fin du buffer (Ligne 9) ---
	; --- Selection ligne 9 (compteur) ---
	LD HL, KBD_BUFFER_RAM + 9 	 ; adr_buffer
	
	; --- Initialisation PSG (Registre 14) ---
	mPSG_SELECT PSG_REG14_KBD 	 ; Selectionne le registre 14 du PSG
	mPSG_VALIDATE (VOID) 		 ; Valide le registre
	
	; --- Initialisation PPI (Mode Keyboard Read) ---
	mPPI_KEYBOARD_MODE_INIT (VOID)
	
KBD_LOOP:	
	
	; --- Selection de la ligne ---
	LD  B, HI(PPI_PORT_C)		 ; B = #F6	
	OUT (C), L 					 ; ligne a scanner
	
	; --- Lecture des donnees ---
	LD  B, HI(PPI_PORT_A) 		 ; B = #F4
    IND                          ; IN (HL), (C) : Lit Port A dans (HL)
                                 ; DEC B 
                                 ; DEC HL : HL pointe vers la ligne precedente
	
	; --- Preparation prochaine iteration --- 
    BIT   4, L                   ; Teste si on est passe sous #40
    JR    Z, KBD_LOOP            ; Si Bit 4 = 0, on continue (Lignes 9 a 0)

	; --- Restauration PPI (Mode par defaut) ---
	mPPI_RESET (VOID)

MEND
