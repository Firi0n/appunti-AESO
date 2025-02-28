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
CMD ["mkdocs", "serve", "-a", "0.0.0.0:8000"]
