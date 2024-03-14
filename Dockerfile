# Use the official Python image as base
FROM python:3.10-slim-buster

# Create a non-root user to run the application
RUN adduser --disabled-password --gecos '' myuser
USER myuser

# Set the working directory
WORKDIR /src

# Copy only the requirements file and install dependencies
COPY ./analytics/requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY ./analytics .

# Set the command to run the application
CMD ["python", "app.py"]