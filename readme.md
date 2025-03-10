# :rocket: MkDocs Setup

This repository provides a basic setup for [MkDocs](https://www.mkdocs.org/) with a simple
[Docker](https://www.docker.com/) setup and includes a GitHub Action for automatic deployment to GitHub Pages.

## :pushpin: MkDocs Configuration

This setup uses the [Material for MkDocs](https://squidfunk.github.io/mkdocs-material/) theme.

The content is written in **Markdown**, with support for:

-   :writing_hand: **LaTeX** for mathematical equations
-   :bar_chart: **Mermaid** for diagrams and flowcharts
-   :computer: **Syntax highlighting** for code blocks

## :sparkles: Enhancements

This setup includes two key improvements:

-   :white_check_mark: **Justified text alignment**: Ensures a cleaner and more professional look across all pages.
-   :repeat: **Sequential navigation buttons**: Automatically added at the bottom of each page, allowing users to move
    forward and backward between chapters effortlessly.

## :hammer_and_wrench: Basic Functionality

-   :page_facing_up: Add new documentation pages by creating `.md` files inside the `docs/` folder.

-   :wrench: Modify the `mkdocs.yml` configuration file with your site name and define your pages in the `nav` section:

    ```yaml
    nav:
        - Page Name: path/to/page.md
    ```

    The path should be relative to the `docs/` directory.

### :open_file_folder: Folder Structure

The `docs/` folder contains the documentation files, organized as follows:

```
docs/
│-- index.md  # Home page
|-- overrides/
|   |-- main.html
|   |-- main.css
│-- src/  # Folder for images and other resources
```

Each `.md` file represents a documentation page. You can structure the content as needed by adding subfolders and
additional Markdown files.

The `src/` folder is intended for storing images and other resource files that may be referenced within the
documentation.

## :trophy: Best Practices

To ensure a high-quality documentation experience, follow these best practices:

-   :memo: **Write clear and concise content**: Keep sentences short and avoid unnecessary complexity.
-   :mag: **Use consistent formatting**: Headers, bullet points, and code blocks should follow a uniform style.
-   :link: **Use internal links**: Connect related pages using Markdown links to enhance navigation.
-   :framed_picture: **Optimize images**: Keep image sizes reasonable and use compressed formats to improve loading
    times.
-   :book: **Organize content logically**: Structure sections and pages in a way that makes sense for users.
-   :white_check_mark: **Test locally before deploying**: Run `mkdocs serve` to preview changes before pushing them
    live.

## :gear: Advanced Customization

For advanced customization, refer to the
[Material for MkDocs documentation](https://squidfunk.github.io/mkdocs-material/creating-your-site/#advanced-configuration).

## :rocket: GitHub Pages Deployment

To deploy your site using GitHub Pages:

1. **Create a new repository using this template**:

    - Click the **"Use this template"** button at the top of this repository.
    - Name your new repository.

2. **Enable GitHub Pages** in the repository settings by selecting `GitHub Actions` as the source:
    - Go to **Settings > Pages**
    - Under **Build and deployment**, select **GitHub Actions**
    - Save the settings

Once set up, GitHub Actions will automatically deploy your site from the `main` branch.  
Your site will be available at:  
:point_right: `https://<your-username>.github.io/<repository-name>/`

## :inbox_tray: Installation

In all cases first steps are:

```sh
# Clone the repository
git clone https://github.com/Firi0n/MKDocs-setup.git

# Enter it
cd MKDocs-setup
```

### :desktop_computer: Local setup

Before proceeding, ensure you have Python and pip installed on your system. You can check by running:

```sh
python --version
pip --version
```

If not installed, refer to the official [Python installation guide](https://www.python.org/downloads/) to set them up.

```sh
# Install dependencies
pip install -r requirements.txt

# Start the local server
mkdocs serve
```

### :whale: Docker setup

The repository supports two usage modes with Docker:

1. **Using the local directory** (recommended for development)
2. **Copying the directory into the container** (useful for more isolated environments)

#### :rocket: Running MkDocs with the local directory

This option mounts the working directory into the container, allowing live modifications without needing to rebuild the
image:

```sh
# Build the Docker image
docker build -t mkdocs-site .

# Run the container
docker run -p 8000:8000 -v $(pwd):/app mkdocs-site
```

If on Windows, use `{}` instead of `()` for `pwd`.

#### :package: Running MkDocs by copying files into the container

If you prefer a more isolated environment, you can copy the files into the container. To do this, locate the
corresponding `COPY` instruction in the Dockerfile, remove the comment symbol (`#`), and then:

```sh
# Build the Docker image
docker build -t mkdocs-site .

# Run the container
docker run -p 8000:8000 mkdocs-site
```

### :globe_with_meridians: Access the Site

Open your browser and go to `http://localhost:8000`
