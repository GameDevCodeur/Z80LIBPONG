
;-----------------------------------------------------------
; F_BALL_COLLISION
;
; Teste la collision de la balle contre une raquette, en ne
; vérifiant que les deux coins du côté vers lequel la balle
; se déplace horizontalement (optimisation : inutile de
; tester le côté opposé au sens de déplacement).
; Enchaîne ensuite sur la vérification des bords d'écran.
;
; Entrée : ENT_BALLE.DX -> direction horizontale de la balle
;                          (1 = droite, sinon = gauche)
; Sortie : ENT_BALLE.DX mis à jour si rebond détecté
;          -> enchaîne vers BALL_CHECK_EDGE
;
; Détruit: AFBCDEHL!
;-----------------------------------------------------------
F_BALL_COLLISION

	LD   A, (ENT_BALLE.DX) 
	CP   BALL_MOVE_RIGHT : JR NZ, CHECK_LEFT

CHECK_RIGHT
	CALL F_BALL_PX_BOTTOM_RIGHT_COLLISION_PADDLE ; Collision pixel bas droit
	CALL F_BALL_PX_TOP_RIGHT_COLLISION_PADDLE    ; Collision pixel haut droit	
	JR   CHECK_EDGE

CHECK_LEFT
	CALL F_BALL_PX_BOTTOM_LEFT_COLLISION_PADDLE  ; Collision pixel bas gauche
	CALL F_BALL_PX_TOP_LEFT_COLLISION_PADDLE     ; Collision pixel haut gauche

CHECK_EDGE
	JP   F_BALL_CHECK_EDGE            			 ; Collision bord de l'écran
