FROM python:3.10-slim-buster

USER root

WORKDIR /src

COPY ./analytics .

# Dependencies are installed during build time in the container itself so we don't have OS mismatch
RUN pip install --no-cache-dir -r requirements.txt \
    && rm -rf requirements.txt

# Switch back to a non-root user
USER nobody

CMD python app.py
