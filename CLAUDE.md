# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Working rules

- **Jamais de `git commit` ni `git push` sans autorisation explicite de l'utilisateur**, même quand le travail semble "fini". L'autorisation d'un commit ne vaut pas pour les suivants.
- **Pas de co-auteur dans les messages de commit** (pas de trailer `Co-Authored-By:` ni équivalent).
- **Auteur des commits** : toujours `Ame <pokemon.triforce@gmail.com>`. Si Claude est détecté comme auteur (`Author: Claude <noreply@anthropic.com>`) sur un commit en tête de branche, faire immédiatement `git commit --amend --author="Ame <pokemon.triforce@gmail.com>" --no-edit` suivi de `git push --force` pour corriger.
- **Avant toute modification du code/fichiers**, présente d'abord un compte rendu des changements prévus (fichiers touchés, nature de l'édit) et attends validation explicite avant d'éditer.
- Si ambigu : demande. Ne choisis pas à la place de l'utilisateur.
- Diff minimal. Touche uniquement ce qui est demandé — pas de cleanup opportuniste, pas de refactor non sollicité.
- Définis "done" avant de commencer (critères explicites de ce qui valide la tâche).
- Vérifie dans le code à jour. Jamais d'hypothèses — lis le fichier avant d'affirmer ce qu'il contient.
- Code minimum. Pas de feature spéculative, pas d'abstraction "au cas où", pas de hook pour un besoin futur hypothétique.
