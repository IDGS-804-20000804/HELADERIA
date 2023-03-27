from flask_sqlalchemy import SQLAlchemy
import datetime

sql_alchemy = SQLAlchemy()

class Students(sql_alchemy.Model):
    __tablename__ = 'students'
    id = sql_alchemy.Column(sql_alchemy.Integer, primary_key=True)
    nombre = sql_alchemy.Column(sql_alchemy.String(100), nullable=False)
    apellidos = sql_alchemy.Column(sql_alchemy.String(100), nullable=False)
    estatura = sql_alchemy.Column(sql_alchemy.String(100), nullable=False)
    edad = sql_alchemy.Column(sql_alchemy.String(100), nullable=False)
    correo = sql_alchemy.Column(sql_alchemy.String(100), unique=True)
    creation_date = sql_alchemy.Column(sql_alchemy.DateTime, default=datetime.datetime.now)
