# demo_moor

Application Flutter pour illustrer le fonctionnement de Moor

# Etapes à suivre

1. Ajouter les plugins nécessaires dans pubspec.yaml (moor_flutter, moor_generator et build_runner)
2. Créer la table de la classe désirée en héritant de Table (voir modele/persistence). Générer ensuite le code de la BD avec la commande "flutter pub run build_runner build". Ce code va générer le code utilitaire de la base de données, et une classe de modèle pour manipuler la table créée (et bien d'autres trucs).
3. Créer une classe utilitatire pour accéder à la BD (ici, modele/persistence.dart$Database). Créer les méthodes de manipulation de la BD
4. Utiliser les classes crées dans son code

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
