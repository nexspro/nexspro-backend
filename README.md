# Nexspro Backend (Ruby on Rails API)

**Nexspro** est un projet personnel ambitieux conçu comme un **hub centralisé** regroupant toutes les facettes de ma vie numérique : portfolio de développeur, bibliothèque de ressources, projets, réseaux sociaux, e-commerce, gaming et plus encore.

Ce dépôt correspond à la **partie backend** de Nexspro, développée en **Ruby on Rails (API only)**.
Le frontend est développé séparément avec **Next.js + Tailwind CSS**.

## Objectif du projet

> Centraliser en un seul endroit tous mes outils, contenus, projets et services digitaux sous forme de modules indépendants connectés via une API.

## Technologies principales

- **Ruby on Rails 7 (API mode)**
- **PostgreSQL**
- **RSpec** – tests
- **dotenv-rails** – gestion des variables d’environnement
- **rack-cors** – support de la communication avec le frontend Next.js
- **puma** – serveur applicatif

## Fonctionnalités prévues (API)

- Authentification sécurisée (Rodauth + JWT)
- Gestion des utilisateurs
- Modules indépendants connectés :
  - Portfolio
  - Bibliothèque de ressources (livres, articles, vidéos)
  - Projets (personnels / professionnels)
  - Réseaux sociaux
  - Système de liens personnalisés (type Linktree)
  - Module e-commerce (à venir)
  - Intégration gaming & live
- API documentée avec versionning (`/api/v1/...`)

## Auteur

Développé par Michael Minot

Formation : Le Wagon (Fullstack Ruby on Rails)

Objectif : Créer une plateforme personnelle évolutive, modulaire, et open-source pour centraliser tous mes outils et contenus.
