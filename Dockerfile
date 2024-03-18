# Use the official Python image as base
FROM arm64v8/python:latest

WORKDIR /src

COPY ./analytics/requirements.txt requirements.txt

# Dependencies are installed during build time in the container itself so we don't have OS mismatch
RUN pip install -r requirements.txt

COPY ./analytics .
#checking codbuild automate

CMD python app.py