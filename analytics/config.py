import logging
import os

from flask import Flask
from flask_sqlalchemy import SQLAlchemy

db_username = "myuser"
db_password = "mypassword"
db_host = "postgresql-service"
db_port = "5433"
db_name = "mydatabase"

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = f"postgresql://{db_username}:{db_password}@{db_host}:{db_port}/{db_name}"


db = SQLAlchemy(app)

app.logger.setLevel(logging.DEBUG)
