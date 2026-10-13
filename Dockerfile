# Old base image is intentional: this is a demo for vulnerability scanning.
# Dependencies are pinned old unless a business has its own overrides/<biz>/app/requirements.txt.
FROM python:3.9-slim-bullseye
LABEL org.opencontainers.image.source="https://github.com/yoshiki-doi/demo-biz-b"

WORKDIR /app
COPY --chmod=0644 app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY --chmod=0644 app/app.py .

RUN useradd -u 10001 -m appuser
USER 10001
ENV BUSINESS=b
EXPOSE 8080
CMD ["python", "app.py"]
