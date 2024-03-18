# Stage 1: Build Python dependencies for arm64 architecture
FROM python:3.10-slim-buster AS builder-arm64

WORKDIR /src

COPY ./analytics .

# Install Python dependencies for arm64 architecture
RUN apt-get update && apt-get install -y --no-install-recommends \
    libc6:arm64 \
    && pip install --no-cache-dir -r requirements.txt \
    && rm -rf requirements.txt

# Final Stage: Create the arm64 architecture image
FROM python:3.10-slim-buster

WORKDIR /src

COPY --from=builder-arm64 /src /src

# Switch to a non-root user
USER nobody

CMD python app.py