

;-----------------------------------------------------------
; F_BALL_ACCELERATION
;
; Tous les {threshold} appels (compteur ENT_BALLE.CR), fait
; progresser l'accélération de la balle en décrémentant
; ENT_BALLE.SP (jusqu'à un minimum de 1, jamais 0).
;
; Entrée : ENT_BALLE.CR -> compteur d'appels
;          ENT_BALLE.SP -> valeur de vitesse/délai courante
; Sortie : ENT_BALLE.CR remis à 0 si seuil atteint
;          ENT_BALLE.SP décrémenté si seuil atteint (min 1)
; Détruit: AF
;-----------------------------------------------------------

F_BALL_ACCELERATION

	LD   A, (ENT_BALLE.CR)
	CP   BALL_BOUNCE_ACC_COUNTER
	RET  NZ							; pas encore au seuil, on sort

	XOR  A
	LD   (ENT_BALLE.CR), A 			; réinitialise le compteur

	LD   A, (ENT_BALLE.SP)
	DEC  A
	RET  Z 							; déjà au minimum, ne pas descendre à 0
	
	LD   (ENT_BALLE.SP), A

RET
