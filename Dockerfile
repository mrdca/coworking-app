# Use the official Python image as base
FROM --platform=linux/arm64 python:3.10-slim-buster

WORKDIR /src

COPY ./analytics/requirements.txt requirements.txt

# Dependencies are installed during build time in the container itself so we don't have OS mismatch
RUN pip install -r requirements.txt

COPY ./analytics .
#checking codbuild automate

CMD python app.py