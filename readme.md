# :book: Appunti AESO

Questo repository contiene gli **appunti di AESO** (o altro nome del corso) generati con **MkDocs** e il tema **Material
for MkDocs**.

## :rocket: Visualizza gli Appunti

Gli appunti sono disponibili online su **GitHub Pages** al seguente link:

:arrow_right: **[Vai agli appunti](https://firi0n.github.io/appunti-AESO/)**

## :books: Struttura

-   Il sito è generato con [MkDocs](https://www.mkdocs.org/)
-   Il tema utilizzato è [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/)
-   Il contenuto è scritto in **Markdown**, con supporto per **LaTeX**, **Mermaid** e **syntax highlighting**

## :hammer_and_wrench: Come avviare il progetto in locale

Se vuoi modificare o visualizzare gli appunti in locale, esegui questi comandi:

```sh
# Installa MkDocs e il tema Material
pip install mkdocs-material

# Avvia il server locale
mkdocs serve
```

## :whale2: Avviare il progetto con Docker

Questo repository include un `Dockerfile` per eseguire MkDocs con il tema Material.

### Come usare il Dockerfile

```sh
    # Clonare il repository
    git clone https://github.com/Firi0n/appunti-AESO.git
    cd appunti-AESO

    # Costruire l'immagine Docker
    docker build -t mkdocs-site .

    # Eseguire il container
    docker run --rm -p 8000:8000 mkdocs-site
```

## :globe_with_meridians: Accedere al sito

Apri il browser e vai a `http://localhost:8000`
