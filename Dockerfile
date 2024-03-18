# Stage 1: Build Python dependencies for x86 architecture
FROM python:3.10-slim-buster AS builder-x86

WORKDIR /src

COPY ./analytics .

# Install Python dependencies for x86 architecture
RUN pip install --no-cache-dir -r requirements.txt \
    && rm -rf requirements.txt

# Stage 2: Build Python dependencies for arm64 architecture
FROM --platform=linux/arm64 python:3.10-slim-buster AS builder-arm64

WORKDIR /src

COPY ./analytics .

# Install Python dependencies for arm64 architecture
RUN pip install --no-cache-dir -r requirements.txt \
    && rm -rf requirements.txt

# Final Stage: Create a multi-architecture image
FROM --platform=linux/amd64,linux/arm64 python:3.10-slim-buster

WORKDIR /src

COPY --from=builder-x86 /src /src
COPY --from=builder-arm64 /src /src

# Switch to a non-root user
USER nobody

CMD python app.py