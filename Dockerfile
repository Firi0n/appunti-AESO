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
CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]
