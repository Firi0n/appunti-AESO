<<<<<<< HEAD
FROM python:3.11-slim

# Imposta la directory di lavoro
WORKDIR /app

# Installa MkDocs e il tema Material
RUN pip install --no-cache-dir mkdocs mkdocs-material

# Copia i file del progetto
COPY . /app

# Espone la porta 8000 per il server di sviluppo
EXPOSE 8000

# Comando di default per avviare MkDocs
=======
# Use an official Python base image
FROM python:3.11-slim

# Set the working directory inside the container
WORKDIR /app

# Install MkDocs with Material theme
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
# COPY . /app

# Expose the default MkDocs port
EXPOSE 8000

# Default command to serve the site
>>>>>>> template/main
CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]
