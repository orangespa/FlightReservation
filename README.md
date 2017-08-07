Réservation d'avions pour les champions
Récap

Ce projet va te faire manipuler les formulaires comme un grand. Tu vas transpirer sur les params, mais c'est une excellente introduction au monde des formulaires.
Durée estimée

Le reste de la journée
Le projet, complet

Dans ce projet, tu vas faire un site de réservation d'avions. Voici le flow que nous allons construire :

    les utilisateurs pourront choisir la date des avions, puis cliquer sur "Rechercher"
    Ils pourront choisir leur vol parmi ceux qui sont resortis
    ils vont devoir rentrer les informations des passagers pour tous les passagers
    ils vont passer à la caisse

Partie 1 : préparation

Dans cette partie, tu vas préparer quelques modèles et remplir ta base de données avant de faire les recherches.
A. Les models

Le système sera simple : nous allons faire une recherche parmi tous nos flight pour voir ceux qui correspondent à la recherche de l'utilisateur. Nous allons créer deux classes :

    une classe Flight, qui a une duration (en minutes), une departure_date, un departure_airport et un arrival_airport
    une classe Airport, qui a un airport_code (CDG, SFO, etc etc)

La classe Airport belongs_to deux fois à notre classe Flights : via le arrival_airport, et le departure_airport. Comment faire ceci ? Nos amis de The Odin Project ont fait un super cours à ce sujet, dans la partie Foreign Keys and Class Names. Nous te conseillons de t'en inspirer :upside_down_face:

Une fois que tu as fait tes classes, je t'invite à vérifier en console que tout marche bien.
B. Seeds

Tu vas ensuite utiliser le fichier seeds.rb pour créer en base pleeeeeeein de flight. Le but est d'avoir quelques trajets pour que notre recherche ne soit pas super vide. Puis tu peux mettre en base dans la classe airport les dix plus grands aéroports d'Europe.

Pour le seed des flights, pas besoin de se prendre la tête : crée les avec une fonction qui prend un aéroport de départ au hasard, un aéroport d'arrivée au hasard, une durée au hasard (lol le Paris - Amsterdam direct en 10h), puis une date prise au hasard entre aujourd'hui et dans une semaine.
Partie 2 : le formulaire de recherche

Les ennuis commencent. Mais rien n'est impossible. Le formulaire, et la home de ton site se feront sur l'index de Flights. Fais-donc un controller Flights, et root la méthode index.

Ensuite, fais donc le formulaire de recherche dans la view. Tu peux utiliser simple_form (niveau difficile), ou tu peux le faire avec form_tag (niveau facile). Au choix. Ton formulaire devra être un formulaire GET (pas de route POST pour index) et avoir les champs de recherche suivants :

    le airport_code de l'aéroport de départ. L'utilisateur devra choisir parmi la liste des aéroports en base
    le airport_code de l'aéroport d'arrivée. L'utilisateur devra choisir parmi la liste des aéroports en base
    le nombre de passagers. On s'en servira plus tard
    le jour du trajet. Pas besoin de mettre à jour les jours disponibles en fonction de l'aéroport de départ et d'arrivée. Ce sont des techniques que l'on verra plus tard en AJAX.

Le controller te servira à plusieurs choses :

    la première est de prépopuler ton formulaire, avec les airport que l'on a en base, puis de prendre les 7 prochains jours pour faire le formulaire de date
    la deuxième est de récupérer les params et de faire une recherche : il devra retourner une array avec les vols qui correspondent à la recherche de l'utilisateur. La méthode where te sera d'une grande utilité :wink: Le controller enregistrera cette array dans une variable qui nous servira dans notre view

Nous t'invitons à tester en console les méthodes, et de faire des puts partout dans ton controller pour que tu vois où en sont les méthodes.

Une fois que ton formulaire te renvoie la bonne array, nous allons afficher cette array dans notre view index. Mais comment faire :thinking: Il y a une petite astuce : si tu fais un truc du genre :

<% if params[:TA_RECHERCHE_TROP_COOL] %>
  <p>Le forumaire vient d'être soumis c'est de la 💣</p>
<% else %>
  <p>Je n'ai toujours pas appuyé sur le submit button 🚨</p>
<% end %>

Tu peux afficher une partie de la view uniquement si une recherche a été soumise. Tu n'as plus qu'à balancer ton array de résultats de recherche dans le if.
Partie 3 : Booking, Passengers
A. Les models

Maintenant nous voudrions que les gens puissent réserver un billet d'avion une fois le formulaire fini. Pour ceci, nous allons devoir créer deux classes :

    une classe Booking, dont chaque instance correspondra à une réservation
    une classe Passenger, qui correspond aux passagers

Nous pouvons réserver plusieurs passenger sur un booking (d'où le formulaire qui demande combien de passagers), et un passenger peut avoir plusieurs booking.

Enfin, un booking ne correspond qu'à un flight, tandis qu'un flight peut avoir plusieurs booking.

Il ne te reste plus qu'à générer une migration et lier ces models entre eux.
B. Book me

Nous voudrions que lorsque les résultats de la reccherche s'affichent, le site mette un petit radio button devant chaque résultat. Ainsi, un utilisateur pourra sélectionner le flight qui l'intéresse.

Tu vas devoir créer un formulaire pour booking/new, avec un radio button pour chaque résultat de la recherche, puis en fin de boucle each un submit button. Nous te conseillons de mettre le nombre de passengers en hidden field : tu pourras le récupérer facilement.
C. Who ?

Une fois que la personne va sur booking/new, nous allons l'accueillir avec un récap du trajet qu'elle a sélectionné. Il nous faudra juste remplir autant de formulaires qu'il y a de passagers, pour que nouis puissions rentrer tout ceci en base. Pense aux nested forms que je t'ai donnés en lien aujourd'hui :wink:
Partie 4 : bah, c'est fini :sunglasses:

Une fois le formulaire avec les passengers soumis, tu es quasiment à la fin. Tu peux rediriger vers booking/show qui affiche tous les détails du vol.

Voilà, tu as bien manipulé les formulaires, tu peux être fier de toi. Si jamais tu t'ennuies un peu trop, voici quelques exemples d'exercices pour aller plus loin :
A. Simple_form

Remplce tous les form_tags par des simple_form.
B. À la caisse :moneybag:

TU peux intégrer un module de paiement avec Paypal ou Stripe.