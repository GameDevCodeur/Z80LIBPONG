
; --------------------------------------------------------
; MACRO   : mGET_PADDLE_LIMITE
; Rôle    : Compare la position Y courante de la raquette à
;           une limite donnée (haut ou bas du terrain).
; Paramètre : {LIMITE} = valeur ou constante à comparer (immédiat)
; Entrée  : ENT_PADDLE.CY = position Y courante de la raquette
; Sortie  : Flags Z/C positionnés par le CP (à tester juste après
;           l'expansion de la macro, ex: JR Z / JR C / JR NC)
; Détruit : AF
; --------------------------------------------------------
MACRO mGET_PADDLE_LIMITE LIMITE
    LD  A, (ENT_PADDLE.CY)
    CP  {LIMITE}
ENDM