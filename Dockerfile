ARG PYTHON_VERSION=3.12
FROM python:${PYTHON_VERSION}-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app.py .
RUN useradd --create-home appuser && chown -R appuser /app
USER appuser

EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["app.py"]