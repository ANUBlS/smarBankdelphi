FROM python:3.12-slim
ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY app ./app
COPY fixtures ./fixtures
RUN useradd -r -u 10001 sb && mkdir -p /data && chown sb /data
USER sb
ENV AUDIT_DB_PATH=/data/smartbank-web.sqlite
EXPOSE 8000
HEALTHCHECK --interval=30s --timeout=5s CMD python -c "import urllib.request;urllib.request.urlopen('http://127.0.0.1:8000/health')"
# single worker: sessions (and their Oracle connections) live in this process
# ONE worker only, on purpose: each logged-in user's Oracle session (Delphi: one TOracleSession per client), its open
# transaction, and AZIPS form state for Azipsnew and the Pascal interpreter all live in this process's memory (app/sessions.py).
# A second worker would not see them. Do not raise --workers; scale with more CPU per container, not with workers.
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--workers", "1", "--proxy-headers"]
