# 🎴 Application Pokémon TCG Flutter

## Résumé
Cette application Flutter est un catalogue interactif de cartes du Jeu de Cartes à Collectionner (JCC) Pokémon. Elle permet aux utilisateurs d'explorer les dernières cartes, de les rechercher, et de consulter les détails complets de chaque carte.

## Architecture
Le projet suit strictement l'architecture **MVVM (Model-View-ViewModel)** pour assurer une séparation claire entre l'interface utilisateur et la logique métier.

## 📂 Structure du projet
Voici l'arborescence des fichiers principaux du dossier `lib/` :

```text
lib/
├── main.dart --> Point d'entrée de l'application, configure le thème et les routes.
├── models/
│   └── pokemon.dart --> Modèle de données unique et simplifié (Carte, Set, Prix...).
├── services/
│   └── api_service.dart --> Service gérant les appels HTTP vers l'API Pokémon TCG.
├── theme/
│   └── app_theme.dart --> Définition du thème global, palette de couleurs et styles.
├── viewmodels/
│   ├── pokemon_explore_viewmodel.dart --> Logique métier pour l'exploration et le chargement infini.
│   └── pokemon_search_viewmodel.dart --> Logique métier pour la barre de recherche et les résultats.
├── views/
│   ├── detail_page.dart --> Page de détail d'une carte (SliverAppBar, stats, prix).
│   ├── explore_page.dart --> Page principale affichant la grille de cartes.
│   ├── home_page.dart --> Page d'accueil avec navigation rapide.
│   └── search_page.dart --> Page dédiée à la recherche de cartes par nom.
└── widgets/
    ├── app_drawer.dart --> Menu de navigation latéral (Drawer) stylisé.
    ├── loading_pokeball.dart --> Animation de chargement personnalisée (Pokéball).
    ├── pokemon_button.dart --> Composant bouton réutilisable aux couleurs du thème.
    ├── pokemon_card_widget.dart --> Composant affichant une carte dans les listes.
    ├── rarity_badge.dart --> Badge visuel indiquant la rareté d'une carte.
    └── type_chip.dart --> Badge affichant le type d'un Pokémon avec sa couleur officielle.
```
# mds_flutter_pokemon_tcg_api
