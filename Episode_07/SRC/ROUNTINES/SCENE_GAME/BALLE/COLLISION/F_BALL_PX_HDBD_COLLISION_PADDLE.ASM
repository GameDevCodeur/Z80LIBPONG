
;-----------------------------------------------------------
; F_BALLE_COLLISION_PHD / F_BALLE_COLLISION_PBD
;
; Détecte une collision entre la balle et une raquette
; (bord Haut-Droit / bord Bas-Droit) et, si collision,
; force la direction horizontale de la balle vers la gauche.
;
; Entrée : ENT_BALLE.XY  -> position (X,Y) de la balle
;          BALL_HEIGHT   -> hauteur de la balle en lignes
; Sortie : ENT_BALLE.DX  = BALL_MOVE_LEFT si collision détectée
; Détruit: AF, BC, HL
;-----------------------------------------------------------
F_BALL_PX_TOP_RIGHT_COLLISION_PADDLE
	LD   HL, (ENT_BALLE.XY)
	INC  HL : INC  HL
	JR   F_CHECK_COLLISION_RIGHT

F_BALL_PX_BOTTOM_RIGHT_COLLISION_PADDLE
	LD   HL, (ENT_BALLE.XY)
	INC  HL : INC HL
	LD   B, BALL_HEIGHT	
	.SET_LIGNE_BD 	
	mSET_NEXTLINE_HL (VOID)
	DJNZ .SET_LIGNE_BD

F_CHECK_COLLISION_RIGHT
	LD   A, (HL) : AND A : RET Z 		; si 0 pas de collision	
	LD   A, BALL_MOVE_LEFT 				; sinon
	LD   (ENT_BALLE.DX), A 				; direction a gauche

	; Incremente le conteur de rebond
	LD   HL, ENT_BALLE.CR : INC (HL)

	RET
