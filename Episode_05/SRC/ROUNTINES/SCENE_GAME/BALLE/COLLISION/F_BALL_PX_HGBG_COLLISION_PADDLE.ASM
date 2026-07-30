
;-----------------------------------------------------------
; F_BALLE_COLLISION_PHG / F_BALLE_COLLISION_PBG
;
; Détecte une collision entre les bords ecran, la balle et une raquette
; (bord Haut-Gauche / bord Bas-Gauche) et, si collision,
; force la direction horizontale de la balle (DX = 1 ou -1).
;
; Entrée : ENT_BALLE.XY  -> position (X,Y) de la balle
; Sortie : ENT_BALLE.DX  = 1 ou -1 si collision détectée
;          Z flag        = 1 si aucune collision (RET Z)
; Détruit: AF, HL
;-----------------------------------------------------------

F_BALL_PX_TOP_LEFT_COLLISION_PADDLE
	LD   HL, (ENT_BALLE.XY) : DEC HL 
	JR   F_CHECK_COLLISION_LEFT

F_BALL_PX_BOTTOM_LEFT_COLLISION_PADDLE
	LD   HL, (ENT_BALLE.XY) : DEC HL

	LD   B, BALL_HEIGHT	
	BALLE_NEXT_LIGNE
		mSET_NEXTLINE_HL (VOID)
	DJNZ BALLE_NEXT_LIGNE

F_CHECK_COLLISION_LEFT	
	LD   A, (HL) : AND A : RET Z 		; si pas de collision retour
	LD   A, BALL_MOVE_RIGHT 			; sinon
	LD   (ENT_BALLE.DX), A 				; direction a droite

	; Incremente le conteur de rebond
	LD   HL, ENT_BALLE.CR : INC (HL)
	
	RET
	