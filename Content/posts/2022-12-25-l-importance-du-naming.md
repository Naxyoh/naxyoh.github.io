---
title:  L'importance du naming
subtitle: ... ou comment faire de votre code une histoire
preview: Pour mon premier article en français, le sujet de l'anglais dans le monde du développement peut paraître ironique pourtant cela reste un sujet sous-estimé par beaucoup, encore aujourd'hui.
date:   2022-12-25 16:18
wordCount: 982
tags: [Swift, Autour du code]
---

Le naming est au code ce que le scénario est au film, s'il est bancal ça devient dur d'y comprendre quelque chose.
À travers cet article nous allons pourquoi prendre la peine d'y réfléchir mais aussi le clefs pour avoir un naming de qualité !

![Pensez aux autres lorsque vous codez](/images/be-like-bill.jpg)

Avant toute chose, puisqu'on est dans un article traitant du naming, commençons par définir le terme.

D'après Le Robert, le "nommage" est :
> Attribution d'un nom permettant d'identifier un objet.

Bon ça nous avance pas des masses donc si je devais reformuler ça donnerait quelque chose comme :
> L'art de faire comprendre son code à un gamin de 5 ans

## A quoi ça sert ?

A prmière vue on pourrait se dire "Yoan on s'en fout de tout ça, in fine ça reste du code et l'ordinateur ça lui fait une belle jambe le naming", sauf que c'est plus compliqué que ça.

### Relecture

Je sais plus qui disait :

> Vous allez passer dix fois plus de temps à lire du code qu'à en écrire

Et même si je ne sais pas si cet ordre de grandeur est véridique ou non, il n'empêche que du code, vous allez en lire et pas qu'un peu.

Prenons un exemple concret que n'importe quel développeur a rencontré dans sa vie : une Peer Review.

En général vous n'avez pas les détails autour de cette PR, vous n'avez pas forcément les règles business et même si vous les avez parce que l'auteur a lié le ticket Jira, votre job c'est aussi de vous assurez de la qualité du code produit.

Et donc vous tombez sur ça :

```swift
private let button = UIButton()

func updateButton(_ flag: Bool) -> String {
    button.setTitle(flag ? "This is a button" : button.titleLabel?.text ?? "No title")

    return flag ? "YES" : "NO"
}
```

Là, même avec le meilleur contexte du monde, vous relisez 2-3 fois ce bout de code, qui n'est pas si long et pas si compliqué, juste parce que vous comprenez pas ce qu'il se passe.

Ici on a un snippet qui fait 4 lignes et si vous êtes un reviewer conscienceux, vous voulez vous assurez que ça ne provoque pas de régression, vous allez mettre des idées d'amélioration en commentaire, pour améliorer la lisibilité par exemple et ça, ça prend du temps. Pour 4 pauvres lignes.

Imaginez si vous deviez review une PR de 300 lignes avec ce niveau de naming.

(Vous vous doutez bien que c'est juste pour l'exemple parce qu'il y a pas que le naming qu'il faut revoir ici ...)

### Debugging

La deuxième occasion la plus courante de relire du code, c'est pour debug.

Même si c'est vous qui avez écrit le code en question, en à peine quelques semaines voire jours, je peux vous dire que vous n'aurez plus aucun souvenir de cette partie et qu'il va falloir sortir la machette pour défricher tout ça.

Le snippet plus haut est très court et n'utilise rien de compliqué en soi mais si le bug est dans un module de plusieurs fichiers, chacun de plusieurs centaines de lignes, je vous laisse imaginer le temps que ça va prendre de localiser la source du bug, sans parler des risques de régression ...

### Documentation

Enfin une des raisons principales de vous soucier du naming, c'est la documentation que ça fournit.

Je fais partie de ces gens qui pensent que les commentaires ne doivent servir qu'à une seule chose : Expliqer le pourquoi et non le comment.

Si vous avez besoin de rajouter des commentaires pour expliquer ce que vous faites (et pas _pourquoi_ vous le faites) alors c'est que votre naming est à revoir. Il suffit de regarder le snippet précédent pour s'en rendre compte.

Exception faite bien sûr de la SwiftDoc.

## Comment adopter un bon naming

 Maintenant que je vous ai montré pourquoi, selon moi, il est important d'avoir le naming le plus travaillé possible, voyons quelques astuces pour y arriver.


### Ayez un vocabulaire commun

C'est tout bête mais combien de fois a-t-on au sein d'une organisation plusieurs noms pour une même entitée ? Que ce soit l'utilisateur, le compte client, le produit.

Il suffit que deux équipes, même tech, n'aient pas la même dénomination et cette différence se retrouve dans le code. Ce qui va ensuite mener à des incompréhension pour les relecteurs puisqu'il n'y aura pas de cohérence.

L'avantage d'avoir un vocabulaire précis et défini c'est que les développeurs n'ont pas de question à se poser sur la meilleure façon de nommer les choses.

In fine peu importe le nom en soi, ce qui est important c'est que tout le monde sache de quoi on parle.

### Grammaire anglaise

Dans la même idée de langue commune, la base reste quand même d'utiliser la langue de Shakespeare comme il se doit.

J'en ai parlé rapidement dans mon précédent article mais ça peut faire une énorme différence entre par exemple une variable nommée `freeMonthSubscriptionDuration` et `freeSusbcriptionDurationInMonth`, vous voyez la nuance ?

C'est peut-être le point le plus compliqué car cela dépend du niveau d'anglais du développeur aussi n'hésitez pas à utiliser des sites comme Linguee si vous n'êtes pas sûr de votre coup.

### Guidelines Apple

Concernant le code lui-même, une bonne idée serait de vous aider des [guidelines Apple](https://www.swift.org/documentation/api-design-guidelines/).

C'est un must-read concernant le design d'API, je ne m'étendrai pas dessus, ce ne serait que de la paraphrase.

---

Avoir un bon naming c'est quelque chose qui prend du temps et qui vient avec l'expérience. Plus vous y ferez attention et plus vous serez bon dans ce domaine.  Si vous pouvez faire lire votre code telle une histoire à un non-tech, c'est que vous êtes sur la bonne voie !

Si vous avez des questions ou des remarques n'hésitez pas à me contacter sur [Twitter](https://twitter.com/YoanSmit) ou [LinkedIn](https://www.linkedin.com/in/yoan-smit/), je me ferai un plaisir de vous répondre.

Cheers.