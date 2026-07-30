;-----------------------------------------------------------
; F_BALLE_MISE_A_JOUR
;-----------------------------------------------------------
; Description :
;   Met a jour la position de la balle en appliquant le
;   deplacement DX. Sauvegarde l'ancienne position (OLDXY)
;   avant mise a jour, pour permettre l'effacement du sprite
;   a son ancien emplacement. Met egalement a jour CX, le
;   compteur utilise pour la detection de collision.
;
; Entree :
;   ENT_BALLE.DX   : delta de deplacement en X (signe, 8 bits)
;   ENT_BALLE.XY   : position courante (coordonnee/adresse)
;   ENT_BALLE.CX   : compteur de detection de collision
;
; Sortie :
;   ENT_BALLE.OLDXY : ancienne valeur de XY (avant maj)
;   ENT_BALLE.XY    : nouvelle position = XY + DX
;   ENT_BALLE.CX    : nouveau compteur de collision = CX + DX
;
; Registres modifies :
;   AF, HL
;
; Remarques :
;   - Addition 8 bits sans gestion de retenue/debordement.
;   - CX suit le meme increment DX que XY, ce qui permet
;     de detecter une collision en comparant CX a un seuil
;     ou une table.
;-----------------------------------------------------------
F_BALLE_MISE_A_JOUR
    
    LD   HL, ENT_BALLE.DX       ; HL pointe sur DIRX
    
    LD   A, (ENT_BALLE.XY)      ; Sauve position 
    LD   (ENT_BALLE.OLDXY), A

    ADD  A, (HL)                ; A =  X + DIRX
    LD   (ENT_BALLE.XY), A      ; MAJ Position X
    
    LD   A, (ENT_BALLE.CX)      ; Compteur de colision
    ADD  A, (HL)                ; A = CX + DIRX
    LD   (ENT_BALLE.CX), A
    
    RET
    