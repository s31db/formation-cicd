ARG PYTHON_VERSION=3.12
FROM python:${PYTHON_VERSION}-slim

# Correctifs de securite des paquets systeme publies apres l'image de base
RUN apt-get update && apt-get upgrade -y && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app.py .
RUN useradd --create-home appuser && chown -R appuser /app
USER appuser

EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["app.py"]