# Mini_jeu_poo

Objectif :
Créer une petite simulation de combat entre deux joueurs dans un jeu en mode console, où chaque joueur attaque l'autre tour à tour jusqu'à ce que l'un des joueurs soit vaincu ( points de vie à 0).

Fonctionnalités principales du programme :
Création de deux instances de la classe Player : Chaque joueur possède un nom et des points de vie (@life_points), initialement définis à 10.

Attaque entre les joueurs :

Un joueur attaque l'autre et inflige des dommages (calculés aléatoirement entre 1 et 6 avec une méthode utilisant rand).
Affichage de l'état des joueurs : À chaque tour, le programme affiche les points de vie restants pour chaque joueur.

Boucle de combat : Le combat continue tant qu'aucun des deux joueurs n'est mort. L

Problématiques rencontrées :
Utilisation incorrecte de Player.show_state au lieu de player.show_state :

Problème : La méthode show_state était appelée sur la classe Player au lieu des instances player1 et player2.
Solution : Appeler la méthode sur les instances des joueurs, par exemple player1.show_state et player2.show_state.
Boucle de combat jusqu'à la mort :

attaque répétée d'un seul joueur :

