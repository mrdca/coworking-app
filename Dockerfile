# Stage 1: Build Python dependencies for arm64 architecture
FROM arm64v8/python:3.10-slim-buster AS builder-arm64

WORKDIR /src

COPY ./analytics .

# Install Python dependencies for arm64 architecture
RUN apt-get update && apt-get install -y --no-install-recommends \
    && pip install --no-cache-dir -r requirements.txt \
    && rm -rf requirements.txt

USER nobody

CMD python app.py