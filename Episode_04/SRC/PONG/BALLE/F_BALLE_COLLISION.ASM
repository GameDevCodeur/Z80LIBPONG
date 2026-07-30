;-----------------------------------------------------------
; F_BALLE_COLLISION_PHG / F_BALLE_COLLISION_PBG
;
; Détecte une collision entre la balle et une raquette
; (bord Haut-Gauche / bord Bas-Gauche) et, si collision,
; force la direction horizontale de la balle (DX = 1).
;
; Entrée : ENT_BALLE.XY  -> position (X,Y) de la balle
; Sortie : ENT_BALLE.DX  = 1 si collision détectée
;          Z flag        = 1 si aucune collision (RET Z)
; Détruit: AF, HL
;-----------------------------------------------------------
F_BALLE_COLLISION_PHG
	LD   HL, (ENT_BALLE.XY)
	DEC  HL
	JR   F_BALLE_COLLISION_CHECK

F_BALLE_COLLISION_PBG
	LD   HL, (ENT_BALLE.XY)		
	LD   B, ENT_BALLE_NBL 	
	
	BALLE_NEXT_LIGNE
		mSET_NEXTLINE_HL (VOID)
	DJNZ BALLE_NEXT_LIGNE

F_BALLE_COLLISION_CHECK	
	LD   A, (HL)
	AND  A                  ; si 0 pas de collision
	RET  Z
	LD   A, 1
	LD   (ENT_BALLE.DX), A
	RET