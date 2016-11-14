# Chordettes webpages

This repository provides a template to generate webpages for the team of [Matthieu Cord](http://webia.lip6.fr/~cord/). The followup of this file is the documentation of this template and will be in French.

Cette page présente comment utiliser ce template pour réaliser un site personnel à destination majoritairement d'un utilisateur de ce template, et pas de quelqu'un qui voudrait en modifier son cœur. Ce n'est donc pas une documentation technique mais bien une documentation d'utilisateur.

La première partie de cette page décrit les motivations et principes assez généraux pour développer un site avec ce template, alors que la seconde partie se charge de détailler les spécificités de ce template.

## Présentation générale de Jekyll

Jekyll est un outil permettant de **générer des sites statiques** (c'est à dire en HTML / CSS / Javascript). C'est donc un intermédiaire intéressant entre un site purement statique (on écrit manuellement l'intégralité du site) et des sites dynamiques où on a généralement du contenu stocké en base de données qui peut être modifié via une interface d'administration et qui sert à faire un rendu du site à la demande du visiteur.

Tout comme un site dynamique, Jekyll **sépare le contenu du _template_**, cependant, ce contenu correspond à des fichiers dans divers formats (que l'on verra par la suite) plutôt qu'une base de données. Par ailleurs, il s'agit de contenu qui n'a donc pas vocation à être différent en fonction du visiteur, permettant donc de générer le site une fois plutôt que de devoir générer les pages à la demande pour chaque visiteur.

Le rôle de Jekyll est de **transformer et d'intégrer du contenu dans un template**.

Jekyll permet d'éditer différents **types de contenus** :

* Du contenu textuel
    * Des pages quelconques (ex : présentation, CV, à propos, etc.)
    * Des billets de blog
    * Des collections, c'est à dire un ensemble de petites pages indépendantes et variées (ex : les divers blocs d'une page style _one page website_)
* Des données structurées (ex : liste de publications)



### Organisation des fichiers

Les fichiers du site sont organisés de la façon suivante :

```
.
| ## CONFIGURATION
|
├── _config.yml            # Configuration du site
|
| ## TEMPLATE
|
├── _includes              # Fichiers de template pouvant être inclus
|   ├── footer.html
|   ├── header.html
|   └── ...
├── _layouts               # Modèles de présentation des contenus
|   ├── default.html
|   ├── page.html
|   ├── multiblock.html
|   └── ...
├── assets                # CSS / JS / images du template
|
| ## CONTENU INTERPRETÉ
|
├── _pages                # Pages
|   └── home.html
|   ├── blog.html
|   ├── publications.html
|   ├── about.md
|   └── ...
├── _homepage             # Elements de la collection "homepage"
|   ├── intro.md
|   ├── research.md
|   ├── news.md
|   └── ...
├── _posts                # Billets de blog
|   ├── 2015-09-01-started-phd.md
|   └── ...
├── _data                 # Données structurées
|   ├── publications.yml
|   └── ...
|
| ## CONTENU STATIQUE (dossiers sans _), copié tel quel
|
├── images
├── pdfs
|
| ## RESULTAT
|
└── _site                 # Site généré par Jekyll
```

Ces divers éléments seront décris dans la suite de ce document.

### Configuration du site et YAML

Le fichier `_config.yml` permet de configurer le site. **Les explications concernant
ce fichier se trouvent directement en commentaire dans le fichier.**

Ce fichier s'écrit en YAML, comme l'intégralité des données structurées en Jekyll.
YAML permet de structurer des données sous forme de dictionnaires et de listes
grâce à l'indentation.

Voici un exemple de fichier YAML décrivant la syntaxe :

```yaml
clé: valeur
titre: Chaine de caractère
sous-titre: "Chaine avec quotes, notamment utile si elle contient le caractère :"
description: >
  Le chevron ">" permet d'entrer plusieurs lignes de texte, il ignore les retours
  à la ligne. On peut aussi utiliser "|" à la place pour conserver les retours à
  la ligne.
# Ceci est un commentaire, on peut aussi utiliser des booléens ou des nombres
affichage: true
year: 2016
# La valeur associée à une clé peut être un nouveau dictionnaire
auteur:
  nom: Robert
  prenom: Thomas
# Ci dessous une liste, chaque élément est indenté et précédé de -
pages:
  - accueil
  - actualités
  - contact
# Les éléments d'une liste peuvent être des dictionnaires :
urls:
  - titre: labo
    url: http://www.lip6.fr
  - titre: université
    url: http://www.upmc.fr
```



### Contenu textuel

Un fichier de contenu textuel contient deux parties : le _front matter_ qui est une sorte de préambule au fichier indiquant un certain nombre de métadonnées concernant le contenu (au format **YAML** vu précédemment), suivi par le contenu en tant que tel.

Un fichier à donc le format suivant :

```
---
key1: value1
key2: value2
...
---

Contenu du fichier...
```

#### _front matter_

Le _front matter_ est donc contenu entre les balises `---` au début du fichier. Voici un certain nombre de données que l'on peut indiquer dedans :

* `layout` (obligatoire) : _template_ à utiliser pour afficher ce contenu (voir ci-dessous)
* `title` (~obligatoire) : titre du document
* `date` (obligatoire pour billets de blog) : date de rédaction (pour billets de blog), au format `YYYY-MM-DD HH:MM:SS TZ` (`TZ` = timezone, _e.g._ `+02` pour GMT+2), on peut ne pas mettre certaines infos, par exemple juste `YYYY-MM-DD` (l'heure sera a minuit) ou juste `YYYY-MM-DD HH:MM` (on peut ignorer la timezone et les secondes)
* `order` (optionnel) : ordre d'appartition du document dans les listes (par exemple ordre dans la liste des pages pour une page)
* ...

En fait, il est possible d'indiquer tout ce que l'on veut, ces informations sont transmises au _template_ chargé de faire le rendu du document (inutile d'indiquer des infos non prises en compte par le template donc).

#### _Templates_

Parlons des _templates_ justement. Un fichier de contenu est supposé contenir uniquement le _contenu_ de la page. Ce contenu devra donc être inclus dans un des _templates_ disponibles dans le dossier `_layouts`. C'est donc en définissant la variable `layout` du _front matter_ que l'on défini à quoi va ressembler une page.

Ainsi dans certains cas on voudra une page simple et on pourra utiliser un template dont le seul rôle est de mettre notre contenu dans l'habillage habituel du site (_e.g._ `page`). Mais il est également possible d'appeler des templates plus "intelligents", par exemple un template dont le rôle est de faire le rendu d'une liste de publications, dans ce cas le contenu du fichier n'est même pas utilisé, le fichier sert simplement à déclarer l'existence de la page.

La liste des templates développés est disponible ci-dessous.


#### Rédaction du contenu

Le _front matter_ est bien sûr suivi du fichier en tant que tel (sauf si on utilise un template qui n'utilise pas de contenu). Ce contenu peut être rédigé dans de nombreux "langages", mais les deux principaux sont le **Markdown** et le **HTML**, dont les usages sont différents :

* Le **Markdown** (fichiers `.md`) est un langage de balisage léger qui permet d'écrire au format texte brut du contenu avec une mise en forme assez simple, mais qui suffit pour la plupart des documents. Jekyll se chargera de convenir le Markdown en HTML lors du rendu de la page. Voir ci-dessous pour une présentation plus complète du langage.
* Le **HTML** (fichiers `.html`) est le langage permettant de structurer des pages web. Si on a besoin d'une mise en page plus riche, on peut directement taper du HTML. Dans ce cas, le contenu sera directement utilisé tel quel par Jekyll.

En réalité, il est possible de taper un document en Markdown et de **mettre des bouts de HTML au milieu du Markdown** en cas de besoin.

Par ailleurs, il faut également noter que les fichiers de contenu (qu'ils soient en HTML ou Markdown) peuvent également contenir des instructions programmatiques (conditions, boucles, usage de variables, etc.) en syntaxe **_Liquid template_**. Le plus utile étant de pouvoir utiliser les variables de configuration du site, par exemple le chemin vers la racine du site à insérer avant l'URL d'une image par exemple, ou pour faire des liens vers d'autres pages. Cette syntaxe sera détaillée davantage plus bas.

**Markdown**

Pour une description complète du Markdown, voir le [site officiel](https://daringfireball.net/projects/markdown/) ou cette [_cheatsheet_](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).

En bref, la syntaxe est la suivante :

```markdown
# Titre 1
## Titre 2

Paragraphe 1. Texte en **gras**, __gras__, *italique*, _italique_,
**_gras italique_**, ~~barré~~, `texte préformatté (code)`.
Les retours à la ligne simple ne comptent pas, tout le texte ci-dessus forme un
seul paragraphe sans retour à la ligne (comme en LaTeX).

Paragraphe 2. [Ceci est un lien](http://www.lip6.fr).  
La ligne du dessus fini par 2 espaces, indiquant qu'il faut ici mettre un retour
à la ligne dans le paragraphe (equivalent `<br>` en HTML, `\\` en LaTeX).

![Image, ceci est la légende](https://www.lip6.fr/images/logo/LIP6.png)

1. Item 1 d'une liste numérotée
3. Item 2 d'une liste numérotée (les numéros n'ont pas besoin d'être corrects)
    * Item 1 sous-liste non numérotée
    - Item 2 sous-liste non numérotée (on peut aussi utiliser - et + pour les listes)
3. Suite de la liste

\```python
# Code sur plusieurs lignes, langage indiqué ci-dessus
# Note: Ne pas include le \ avant les 3 back-quotes
for i in range(0,5):
    print i
\```

On peut également faire des tableaux, voir la doc ou la cheatsheet pour le détail :

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
```

**Syntaxe _Liquid template_**

La syntaxe _Liquid template_ est particulièrement utile lors de la rédaction d'articles, notamment pour avoir accès aux variables de configuration du site. Pour afficher une variable, on utilise simplement deux accolades : `{{ variable }}`. Les instructions plus complexes se placent entre les balises suivantes : `{% commande %}`.

<p class="bg-warning"><strong>Note importante concernant les URL:</strong> Avant d'expliquer davantage les fonctions les plus importantes de Liquid, sachez d'abord qu'il faut faire attention lorsque vous voulez mettre un lien vers quelque chose <strong>dans une page</strong> (pour les URL dans les données structurées (config, frontmatter, _data/*.yml, ...) il ne faut pas le faire).</p>

Pour un lien vers une ressource statique (PDF, image, etc.), il faut utiliser la syntaxe `{% include url.html url=<valeur> %}` par exemple dans un fichier markdown :

```md
![Illustration de WELDON]({% include url.html url="images/publications/weldon.jpg" %})
```

Pour un lien vers une page ou un billet de blog, utiliser respectivement `{% link <filePath> %}` et `{{ site.baseurl }}{% post_url <postFilenameWithoutExt> %}`, par exemple en Markdown :

```md
Voir [la page du projet WELDON]({% link _pages/projects-mantra.md %}) et le [billet de blog correspondant]({{ site.baseurl }}{% post_url 2016-06-26-weldon-at-cvpr %}).
```

Voyons maintenant les fonctionnalités les plus importantes de Liquid. Cette partie est assez optionnelle et vous pouvez passer à la section suivante si vous voulez.

Les _variables_ les plus utiles sont les suivantes :

* Des variables "globales" au site dans `site`, notamment pour les plus utiles :
    * `site.<configurationKey>` : valeur du paramètre de configuration `<configurationKey>` de `_config.yml` (ex : `site.baseurl` ou `site.author.name`)
    * `site.data.<dataFile>` : fichier de données `<dataFile>.yml` (ex : `site.data.publications`)
* Des variables concernant la page en cours :
    * `page.<frontmatterKey>` : valeur du paramètre `<frontmatterKey>` de la page en cours (ex : `page.title` ou `page.layout`)
    * `page.url` : URL de la page (sans le `baseurl` à rajouter)
    * `page.content` : contenu de la page généralement transformé en HTML

Par ailleurs, _Liquid_ propose des _filtres_ c'est à dire des instructions qui transforment un objet en un autre. Ces filtres s'appliquent avec un pipe et peuvent avoir des paramètres. On citera par exemple :

* `slugify` transformer une chaine en une chaine _urlisé_ (ex : `{{ "The _config.yml file" | slugify }}` produit `the-config-yml-file`)
* `sort` pour trier une liste (ex : `{{ page.tags | sort }}` ou `{{ site.pages | sort: "order" }}`)

Enfin, _Liquid_ propose des _tags_ c'est à dire des instructions à appliquer selon des données, par exemple :

* `{% assign <varName> = <operations> %}` pour definir une variable
* `{% include <finename> <paramName>=<paramVal> %}` pour inclure un fichier
* `{% if <cond> %} ... {% elsif <cond> %} ... {% else %} ... {% endif %}`
* `{% for var in array %} ... {% endfor %}`

Pour une documentation plus complète, voir le site de Jekyll (concernant les [variables](http://jekyllrb.com/docs/variables/) et [le langage de template](http://jekyllrb.com/docs/templates/)) et de [Liquid](https://github.com/Shopify/liquid/wiki/Liquid-for-Designers).

### Données structurées

Il est possible de stocker des données structurées qui pourront ensuite être réutilisées pour générer des pages. Typiquement dans notre cadre, une liste de publications ou une liste de projets. Ces données sont écrites en YAML que nous avons déjà vu. Le format à utiliser dépend du template qui se chargera de transformer les données et sera donc détaillé plus bas dans ce document.

Voici un exemple de fichier de données que l'on sauvegarderait dans le fichier `_data/publications.yml` :

```yaml
- type: conf
  in: IEEE ICIP
  year: 2016
  title: Gaze latent SVM for image classification
  authors: X. Wang, N. Thome, M. Cord
  additional: DOI: 10.1109/ICIP.2016.7532354

- type: conf
  in: ICCV
  year: 2015
  title: "MANTRA: Minimum Maximum Latent Structural SVM for Image Classification and Ranking" # need to use the quotes to escape ":"
  authors: T. Durand, N. Thome, M. Cord
  image: http://webia.lip6.fr/~durandt/papers/CVPR16/image2.png
  bibtex: |
      @inproceedings{mantraICCV15,
        Author = {Thibaut Durand and Nicolas Thome and Matthieu Cord},
        Title = {MANTRA: Minimum Maximum Latent Structural SVM for Image Classification and Ranking},
        booktitle = {IEEE International Conference on Computer Vision (ICCV)},
        Year = {2015}
      }

- type: workshop
  in: Cooking and Eating Activities at IEEE ICME
  year: 2015
  title: Recipe Recognition with Large Multimodal Food Dataset
  authors: X. Wang, D. Kumar, N. Thome, M. Cord, F. Precioso

# [...]
```


## Utilisation du template

Passons maintenant à l'utilisation concrète de ce template.

### Installation de Jekyll

Sur macOS, il faut commencer par installer Xcode (depuis l'App Store) puis executer la commande `xcode-select --install`.

Pour installer Jekyll, il suffit d'utiliser la commande `sudo gem install jekyll`.

Si vous ne disposez pas de droits _root_ sur la machine, faites `gem install jekyll --user-install`. Dans ce cas il vous faudra ensuite ajouter le chemin dans le lequel Jekyll a été installé dans votre `$PATH` (ex : `/home/<username>/.gem/ruby/2.3.0/bin` sur les machines du labo normalement).

### Téléchargement du template

Pour utiliser ce template, placez vous dans le dossier dans lequel vous voulez développer et faites :

```sh
git clone https://github.com/ThomasRobertFr/chordettes-webpages.git .
git branch $USER
git checkout $USER
```

### Utilisation de Jekyll (compilation du site)

#### Compilation et mode _serve_

Une fois jekyll installé, depuis un dossier de site Jekyll, faites `jekyll serve --watch` pour lancer Jekyll en mode `serve`, c'est à dire qu'il va compiler le site à chaque modification (sauf `_config.yml` auquel cas il faut arrêter et relancer Jekyll) et fais tourner un petit serveur web vous permettant de consulter votre site. Il vous indique l'URL après lancement de la commande, ex :

```terminal
$ jekyll serve --watch
Configuration file: /Users/thomas/Documents/Dev/chordettes-webpages/_config.yml
            Source: /Users/thomas/Documents/Dev/chordettes-webpages
       Destination: /Users/thomas/Documents/Dev/chordettes-webpages/_site
 Incremental build: disabled. Enable with --incremental
      Generating...
                    done in 1.675 seconds.
 Auto-regeneration: enabled for '/Users/thomas/Documents/Dev/chordettes-webpages'
Configuration file: /Users/thomas/Documents/Dev/chordettes-webpages/_config.yml
    Server address: http://127.0.0.1:4000/~username/
  Server running... press ctrl-c to stop.
```

Notez que pour compiler le site une fois avec Jekyll (sans que Jekyll lance un serveur web et relance la compilation à chaque modification), vous pouvez faire `jekyll build`.

#### Mise en ligne de votre site

Le site final généré par Jekyll est créé dans le dossier `_site`. Ainsi, une fois que le site vous convient, il suffit de récupérer le contenu du dossier `_site` et de le placer (pour le labo) dans votre dossier `/web/<username>/public_html`.

Pour simplifier la mise en ligne, vous pouvez créer un petit script bash qui appelle `rsync` afin d'envoyer la nouvelle version de votre site vers votre `public_html`. Pour cela, on vous conseille la commande `rsync` suivante :

```sh
rsync -e ssh -rlptgoDv --delete-after _site/ <user>@gate.lip6.fr:/web/<user>/public_html/
```

Attention, dans la commande ci-dessus l'instruction `--delete-after` cause la suppression des fichiers présents dans votre `public_html` mais absent de `_site`. Si vous avez donc mis des fichiers manuellement dans votre `public_html` ils seront supprimés. Cependant, ne pas mettre cette option signifie que des pages supprimés de votre site resteront en ligne. Idéalement donc, il serait plutôt conseillé de laisser cette option et d'ajouter tous les fichiers statiques que vous voudriez voir sur votre site dans la version Jekyll de votre site (pas dans `_site` mais bien dans votre dossier de travail qui contient le dossier `_site`), en effet Jekyll copiera tel vers `_site` les fichiers et dossiers que vous ajoutez et qu'il n'a pas à interpreter.

### Exemples de sites

Pour vous aider à mettre en place votre site, vous pouvez vous inspirer des sites déjà créés avec ce template dans les différentes branches du dépôt git du projet, notamment la [démo](https://github.com/ThomasRobertFr/chordettes-webpages/tree/demo) ou le [site de Matthieu Cord](https://github.com/ThomasRobertFr/chordettes-webpages/tree/cord).

### Usage des layouts (ou templates)

Pour créer un site avec ce template, il vous suffit d'**ajouter des fichiers** dans les dossiers :

* `_pages` pour ajouter une page, et :
    * `_homepage` pour ajouter des blocs à une page d'accueil de type _"onepage"_
    * `_data` pour ajouter des données structurées servant à certaines pages
* `_posts` pour ajouter un billet de blog
* `pdfs`, `images`, ou n'importe quel autre dossier que vous créez, pour vos fichiers statiques

Nous allons par la suite nous intéresser particulièrement aux pages et pas aux billets de blog. Cependant, un billet de blog fonctionne globalement comme une page classique.

Comme nous l'avons vu, un fichier de page peut être en HTML (`*.html`) ou en Markdown (`*.md`), et commence par un _front matter_. Outre le titre, **l'information la plus importante du _front matter_ est sans doute le template** (`layout: ...`), qui va changer totalement le type de page à utiliser.

Voyons les **différents templates disponibles**, détaillés par la suite :

* `page` permet de créer une page "de base", avec la mise en page globale du site (menu à gauche), et un bloc de titre suivi par le contenu de votre page
* `post` permet d'afficher un billet de blog, il est très similaire à `page`
* `blog` (\*) permet d'afficher la liste des billets de blog
* `publications` (\*) permet d'afficher une liste de publications d'un fichier de données YAML présent dans `_data`
* `projects` (\*) permet d'afficher une liste de projets d'un fichier de données YAML présent dans `_data`
* `onepage` (\*) permet de créer une page de type _"onepage"_ càd une succession de blocs présentant différentes choses. Les blocs affichés sont ceux présents dans `_homepage` et doivent utiliser les templates suivants :
    * `onepage-block` permet de créer un bloc "de base", avec un titre et du contenu (equivalent de `page` au format `onepage`)
    * `onepage-block-publications` (\*) permet d'afficher une liste de publications à partir des données (équivalent de `publications` au format `onepage`)
    * `onepage-block-contact` (\*) permet d'afficher les divers moyens de vous contacter à partir des infos du `_config.yml`

(\*) Le fichier d'une page avec ce layout ne devrait contenir qu'un _front matter_ suivi d'aucun contenu, car ce contenu sera totalement généré. Si le fichier contient tout de même du contenu, il sera de toute façon ignoré.

Nous allons maintenant voir ces templates plus en détail, en particulier les paramètres disponibles pouvant être mis dans le _front matter_.

### Template `page` (et `blog`)

Les paramètres que vous pouvez mettre dans le _front matter_ sont les suivants :

#### Paramètres de titre et de menu

* `title` _(obligatoire)_ : Titre de la page, sera affiché dans un bloc d'en-tête en haut de page
* `title-short` _(optionnel)_ : Titre qui sera utilisé dans le menu à gauche (prévu pour remplacer les titres longs par un titre court dans le menu)
* `no-navlink` _(optionnel, defaut : `false`)_ : mettre à vrai pour que la page n'apparaisse pas dans le menu du site
* `order` _(optionnel, defaut : 50)_ : Position de la page dans le menu du site, par défaut à 50, ainsi on peut forcer juste certaines page à être au début (avec une valeur < 50) ou à la fin (valeur > 50)
* `intro` _(optionnel)_ : Introduction / Abstract de votre page, qui s'affiche dans le bloc d'en-tête sous le titre
* `head-title` _(optionnel)_ : Titre utilisé comme titre de l'onglet / de la fenêtre
* `no-site-title`  _(optionnel, defaut : `false`)_ : Ne pas inclure le nom du site dans le titre de l'onglet / de la fenêtre

#### Paramètres de parentée

Il est possible d'avoir des sous-pages à une page, par exemple avoir une page _Teaching_ qui présente les cours que l'on donne, et des sous-pages pour chaque cours.

Dans ce cas, on doit définir pour chaque sous page le paramètre `parent` en lui indiquant le nom du fichier de la page parente (ex : `parent: teaching.md`). La page fille n'apparaitra plus dans le menu du site.

Dans une page parente, on peut définir le paramètre `show-children` à `true` ou `false` pour indiquer si on veut qu'une liste des pages enfants soient inclue à la fin de la page. Par défaut à `false`, auquel cas vous devriez inclure vous-même des liens vers les pages filles dans le contenu de votre page principale (attention aux liens, voir la partie sur la syntaxe Liquid).

#### Style d'en-tête

Il est enfin possible de changer le style de l'en-tête de la page avec le paramètre `header-style`. Par defaut le style est celui indiqué dans `header-default-style` dans `_config.yml`, par défaut `trianglify`.

On peut choisir parmi les styles suivants :

* `style-gray` pour un style gris (par défaut fond gris clair), suivi éventuellement des variateurs `darken` (fond gris un peu plus foncé), `dark` (fond sombre) ou `darker` (fond très sombre) (ex : `header-style: style-gray dark`)
* `style-color-<X>` pour un fond coloré (avec `<X>` entre `1` et `5`), par défaut le texte est foncé sur fond clair, on peut avoir l'inverse avec le variateur `dark` (ex : `header-style: style-color-2 dark`)
* `particles` pour avoir un nuage de particules animé
* `trianglify` pour avoir un fond constitué d'une sorte de dégradé de triangles, ce fond est généré aléatoirement et sera donc unique et différent pour chaque page
* `cover-image` pour indiquer que l'on veut mettre une image "de couverture" en fond du bloc d'en-tête, on peut ajouter le variateur `cover-image-process` pour que l'image indiquée soit traitée pour que le texte inscrit dessus soit plus lisible (flou, diminution du contraste, changement de luminosité). On peut ajouter le variateur `dark` pour que le texte soit clair dans le cas où l'image de fond est sombre. L'URL de l'image à utiliser en fond doit être indiqué dans le paramètre `header-image`. (ex : `header-style: cover-image dark` et `header-image: images/headers/supercomputer1.jpg`) _Note : des fonds vous sont proposés dans le dossier images/headers_
* On peut ajouter le variateur `large` pour avoir un en-tête avec plus de marge en haut et en bas, pratique si on veut mettre davantage en valeur une image de fond par exemple (ex : `cover-image dark large`)

### Template `post`

Similaire à `page`, sans `parent` et `show-children`, et avec le champ `date` à définir format `YYYY-MM-DD HH:MM:SS TZ` (`TZ` = timezone, _e.g._ `+02` pour GMT+2), on peut ne pas mettre certaines infos, par exemple juste `YYYY-MM-DD` (l'heure sera a minuit) ou juste `YYYY-MM-DD HH:MM` (on peut ignorer la timezone et les secondes)

### Template `publications`

Même paramètres que `page` avec les paramètres suivants en plus :

* `data-name` _(obligatoire)_ : nom du fichier de données YAML contenant la liste des publications à afficher (ex : `data-name: publications` pour afficher les publis du fichier `_data/publications.yml`)
* `groupby` _(optionnel)_ : par défaut les publis sont affichées à la suite. On peut les grouper par années ou par type (conf, journal, etc.) en définissant ce paramètre à `year` ou `type`. Dans ce cas des titres de groupes seront affichés, avec des liens en haut de la liste de publications.
* `tidy` _(optionnel, def `false`)_ : si à `true`, le style utilisé pour afficher les publications sera un peu plus "serré" et le texte écrit moins gros. Un style alternatif si on trouve que l'original est trop aéré, surtout si la liste de publis est longue.

Le format à utiliser dans le fichier de données est détaillé plus bas.

Comme indiqué précédemment le contenu du fichier d'une page `publications` devrait être vide à part le _front matter_.

### Template `publications`

Même paramètres que `page` avec le paramètre obligatoire `data-name` contenant nom du fichier de données YAML contenant la liste des projets à afficher (ex : `data-name: projects` pour afficher les publis du fichier `_data/projects.yml`)

Le format à utiliser dans le fichier de données est détaillé plus bas.

Comme indiqué précédemment le contenu du fichier d'une page `projects` devrait être vide à part le _front matter_.

### Template `onepage`

* `title`
* `collection` : optionnel et pour les utilisateurs confirmés, nom de la [collection Jekyll](https://jekyllrb.com/docs/collections/) à utiliser, par défaut `homepage`

Comme indiqué précédemment le contenu du fichier d'une page `onepage` devrait être vide à part le _front matter_.

### Template `onepage-block`

* `title`
* `title-short` : Titre pour le menu
* `no-navlink` _(def : false)_ : Ne pas afficher dans le menu
* `no-title` _(def : false)_ : Ne page afficher le titre dans le bloc
* `class` _(optionnel)_ : Style du bloc à utiliser, similaire au `header-style` du layout `page`, sauf qu'il s'agit ici du style de tout le bloc et pas juste du titre. Les styles sont les même que pour `page`, sauf `trianglify` et `particles` qui ne sont pas disponibles.  
  Pour le style `cover-image` l'URL de l'image est à indiquer dans le paramètre `bg-image` au lieu de `header-image`.  
  Par défaut il n'y a pas de style particulier donc le texte est noir sur fond blanc.  
  **En bref styles possibles : (`style-gray + [ darken | dark | darker]`, `style-color-<1-5> + [dark]`, `cover-image`, `+ [large]`)**  
  _Note technique : ce paramètre peut également contenir vos classes CSS personnelles si vous voulez définir vos propres styles puisque ce paramètre sert en fait de classe CSS au bloc._
* `bg-image` : URL de l'image si `class` contient `cover-image`

### Template `onepage-block-publications`

Même paramètres que `onepage-block`, avec le paramètre obligatoire `data-name` en plus, qui doit contenir le nom du fichier de données YAML contenant la liste des publications à afficher dans le bloc. (ex : `data-name: publications-home` pour afficher les publis du fichier `_data/publications-home.yml`)

Le paramètre optionnel `more-publications-page` est le chemin du fichier de la page listant l'intégralité des publications (ex : `more-publications-page: _pages/publications.md`), dans le cas où on ne voudrait qu'un sous-ensemble des publications sur la page d'accueil. Si ce paramètre est défini, un bouton vers la page des publcations sera ajouté à la fin du bloc.

Le format à utiliser dans le fichier de données est détaillé plus bas.

Comme indiqué précédemment le contenu du fichier d'un bloc `onepage-block-publications` devrait être vide à part le _front matter_.

### Template `onepage-block-contact`

Même paramètres que `onepage-block`, avec le paramètre obligatoire `contacts` en plus, qui doit contenir la liste ordonnée de contacts à afficher.

Voici un exemple complet de contacts :

```yaml
# _front matter_ onepage-block-contact
contacts:
  - type: email
  - type: phone
  - type: address
  - type: twitter
  - type: linkedin
  - type: github
  - type: google-plus
  - type: custom
    icon: soundcloud
    text: Soundcloud
    url: http://soundcloud.com/username
```

Chaque élément de la liste contient donc la valeur `type` qui indique le type de contact, si c'est un contact `email`, `phone`, `address`, `twitter`, `linkedin`, `github` ou `google-plus` les infos seront cherchées dans le dictionnaire `author` du fichier `_config.yml` qui doit avoir le format suivant :

```yaml
# Portion fichier _config.yml
author:
  # [...]
  email: firstname.lastname@lip6.fr
  phone: 01 23 45 67 89 # Si fax, mettre "Tel: 01 23 45 67 89 \n Fax: 01 23 45 67 89"
  address: "Couloir 26-00, Bureau 525 \n 4, place Jussieu \n 75005 Paris \n France"
  twitter: username
  linkedin: username
  github: username
  google-plus: username
```

Vous pouvez ajouter des contacts à la main comme indiqué dans l'exemple ci dessus :

```yaml
contacts:
  # [...]
  - type: custom
    icon: soundcloud
    text: Soundcloud
    url: http://soundcloud.com/username
```

Il faut indiquer `type: custom`, vous pouvez alors choisir l'icone à utiliser parmi les icones [FontAwesome](http://fontawesome.io/icons/) (version 4.7) et indiquer son nom dans le paramètre `icon`, `text` sera affiché en dessous, et vous pouvez si vous voulez indiquer une URL dans `url`.


Par ailleurs, on peut assigner la valeur `true` à la clé `not-hidden` pour l'élément de type `email` si on veut que l'adresse email ne soit pas masquée par un bouton (permettant d'éviter que le mail soit crawlé par des bots pour limiter le spam). Ex :

```yaml
contacts:
  # [...]
  - type: email
    not-hidden: true
  # [...]
```

Comme indiqué précédemment le contenu du fichier d'un bloc `onepage-block-contact` devrait être vide à part le _front matter_, il sera généré à partir de la liste ci-dessus.

### Résumé des paramètres des templates

_(\*) : Le fichier d'une page avec ce layout ne devrait contenir qu'un _front matter_ suivi d'aucun contenu, car ce contenu sera totalement généré. Si le fichier contient tout de même du contenu, il sera de toute façon ignoré._  
_"<" : indique qu'un template "hérite" les paramètres d'un autre_

* **page**
    * `title`
    * `title-short`: Titre pour le menu
    * `no-navlink` _(def : false)_ : Ne pas afficher dans le menu
    * `order` _(def : 50)_ : Ordre dans le menu
    * `intro` : Abstract
    * `parent` : Nom du fichier de la page parent
    * `show-children` _(def : false)_ : Afficher la liste des pages enfants
    * `header-style`  _(def : trianglify sauf si changé dans config)_ : Style de l'en-tête (`style-gray + [ darken | dark | darker]`, `style-color-<1-5> + [dark]`, `cover-image`, `trianglify`, `particles`, `+ [large]`)
    * `header-image` si `header-style: cover-image` : URL de l'image, cf `images/headers` pour des suggestions
* **post** < **page**
    * `date` : format `YYYY-MM-DD HH:MM:SS ±TZ` ou `YYYY-MM-DD HH:MM` ou `YYYY-MM-DD`
* **blog** < **page** (\*)
* **publications** < **page** (\*)
    * `publications` : Fichier YAML de publications
* **projects** < **page** (\*)
    * `projects` : Fichier YAML de projets
* **onepage**
    * `collection` : Collection de blocs
* **onepage-block**
    * `title`
    * `title-short`: Titre pour le menu
    * `no-navlink` _(def : false)_ : Ne pas afficher dans le menu
    * `no-title` _(def : false)_ : Ne pas afficher le titre du bloc
    * `order` _(def : 50)_ : Ordre dans le menu
    * `class` : Style de l'en-tête (`style-gray + [ darken | dark | darker]`, `style-color-<1-5> + [dark]`, `cover-image`, `+ [large]`)
    * `bg-image` si `class` contient `cover-image` : URL de l'image, cf `images/headers` pour des suggestions
* **onepage-block-publications** < **onepage-block** (\*)
    * `publications` : Fichier YAML de publications
* **onepage-block-contact** < **onepage-block** (\*)
    * `contacts` : Liste de contacts à afficher

### Format YAML pour les publications

Les fichiers de données YAML contenant les publications doivent contenir une liste de publications où chaque entrée sera structurée comme suit (l'ordre des infos dans l'entrée est libre) :

``` yaml
- title: "MANTRA: Minimum Maximum Latent Structural SVM for Image Classification and Ranking" # Titre (obligatoire)
  authors: T. Durand, N. Thome, M. Cord # Auteurs (obligatoire)
  year: 2015 # Année de publication (obligatoire)
  type: conf # Type de papier (obligatoire), idéalement parmi [conf, workshop, journal, book, bookchapter], mais ajoutez votre propre type si besoin
  in: ICCV # Nom de la conférence / du journal (optionnel)
  additional: p. 123-234, chapter 12 # Infos additionnelles quelconques (pages, chapitre, IF, etc.) que vous voulez voir figurer après l'année de publication, en plus petit (optionnel)
  image: images/publications/mantra.png # URL de l'image de description (optionnel)
  highlight: true # Mise en valeur du papier dans la liste (optionnel, defaut : false)
  # URLs du papier (optionnel), avec au choix :
  # - Une URL seule direct :
  url: /pdfs/publis/mantra.pdf
  # - Une liste d'URLs (éventuellement une seule) avec plus de contrôle sur le titre et la couleur du bouton de lien :
  urls:
    - url: /pdfs/publis/mantra.pdf # URL du lien
      title: Papier # Titre du lien
      style: primary # Style bootstrap du bouton (default : gris, primary (par defaut) : bleu foncé, info : bleu clair, success: vert, warning : orange, danger : rouge)
    - url: http://... # URL du lien
      title: Demo video # Titre du lien
      style: info # Style bootstrap du bouton (default : gris, primary (par defaut) : bleu foncé, info : bleu clair, success: vert, warning : orange, danger : rouge)
    # ...
  # Entrée BibTex (optionnel)
  bibtex: |
    @inproceedings{mantraICCV15,
      Author = {Thibaut Durand and Nicolas Thome and Matthieu Cord},
      Title = {MANTRA: Minimum Maximum Latent Structural SVM for Image Classification and Ranking},
      booktitle = {IEEE International Conference on Computer Vision (ICCV)},
      Year = {2015}
    }
  # Descriptions manuelles (optionnelles et remplace infos ci-dessus):
  # Description manuelle complète de la publication, si indiqué, seul le titre est affiché suivi de cette description en HTML (optionnel)
  full-raw-desc: >
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc a nulla faucibus, efficitur dolor non, sollicitudin justo. Aliquam a sem nec diam faucibus vulputate quis lacinia justo. Proin vestibulum fermentum sapien, quis convallis nibh condimentum ut. Vivamus laoreet lorem vel lorem gravida tempus. In hac habitasse platea dictumst.
  # Description manuelle de la publication, si indiqué, seul le titre et l'auteur sont affichés suivi de cette description en HTML (optionnel)
  raw-desc: >
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc a nulla faucibus, efficitur dolor non, sollicitudin justo. Aliquam a sem nec diam faucibus vulputate quis lacinia justo. Proin vestibulum fermentum sapien, quis convallis nibh condimentum ut. Vivamus laoreet lorem vel lorem gravida tempus. In hac habitasse platea dictumst.
```

### Format YAML pour les projets

Les fichiers de données YAML contenant les projets doivent contenir une liste de projets où chaque entrée sera structurée comme suit :

```yaml
- title: VISIIR
  date: 2013/01/10
  # Texte de description du projet en HTML si besoin de mise en forme
  desc: VIsual Seek for Interactive Image Retrieval (VISIIR) is a project aiming at exploring new methods for semantic image annotation.
  # URL de l'image de description du projet (optionnel mais conseillé)
  image: images/projects/visiir.png
  # URLs du projet (optionnel), avec au choix :
  # - Une URL seule direct :
  url: http://visiir.lip6.fr
  # - Une liste d'URLs (éventuellement une seule) avec plus de contrôle sur le titre et la couleur du bouton de lien :
  urls:
    - url: http://... # URL du lien
      title: Site du projet # Titre du lien
      style: default # Style bootstrap du bouton (default : gris, primary (par defaut) : bleu foncé, info : bleu clair, success: vert, warning : orange, danger : rouge)
    - url: http://... # URL du lien
      title: Site du projet # Titre du lien
      style: default # Style bootstrap du bouton (default : gris, primary (par defaut) : bleu foncé, info : bleu clair, success: vert, warning : orange, danger : rouge)
    # ...
```
