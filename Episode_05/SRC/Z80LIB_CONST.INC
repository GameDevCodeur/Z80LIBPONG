
; =============================================================================
; PARAMETRES Z80LIBv00
; =============================================================================
INCLUDE "Z80LIBv00\CONSTANTES.INC" 

; =============================================================================
; PARAMETRES Z80LIB PARAMETRABLES
; =============================================================================

; -------------------
; PARAMETRES STACK			; Pile systéme
; -------------------
SP_SIZE 			EQU  32*2   	        ; Réservation en X*2 octets (défault: 32*2)

; -------------------
; PARAMETRES CRTC 			; Géométrie de l'écran
; -------------------
CRTC_R1 			EQU    32 		        ; Largeur visible en caractères
CRTC_R6 			EQU    24 		        ; Hauteur visible en lignes de caractères
CRTC_R12 			EQU   #30   	        ; Adresse de départ écran poids fort (#30 -> #C0)
CRTC_R13 			EQU    00   	        ; Adresse de départ écran poids faible

; -------------------
; PARAMETRES IM1            ; Gestionnaire IM1 
; -------------------
IM1_IT_MAX      	EQU     6               ; Taille table IM1 d'une scéne (6 = 50hz)

; -------------------
; PARAMETRES ECRAN 			; Géométrie de l'écran
; -------------------
SCR_VRAM_BASE 		EQU #C000 		        ; CRTC (R12-R13)
SCR_WIDTH  			EQU CRTC_R1*2 			; Octets
SCR_HIGHT 			EQU CRTC_R6*8           ; Lignes

; ------------------
; ORIGINE MEMOIRE 			; Implentation en mémoire
; ------------------
DEBUT_CODE 			EQU #4000
