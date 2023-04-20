from flask_sqlalchemy import SQLAlchemy
from flask_security import UserMixin, RoleMixin

from datetime import datetime
from flask_security import UserMixin

db = SQLAlchemy()

class Usuario(db.Model, UserMixin):
    id_usuario = db.Column(db.Integer, primary_key=True, autoincrement=True)
    correo = db.Column(db.String(255), nullable=False, unique=True)
    contrasenia = db.Column(db.String(255), nullable=False)
    estatus = db.Column(db.Boolean, default=True)
    fecha_creacion = db.Column(db.DateTime, default=datetime.utcnow())
    fecha_actualizacion = db.Column(db.DateTime, default=datetime.utcnow(), onupdate=datetime.utcnow())

user_roles = db.Table('rol_usuario',
                      db.Column('id_rol_usuario', db.Integer(), primary_key=True),
                      db.Column('fk_usuario', db.Integer(), db.ForeignKey('user.id_usuario')),
                      db.Column('fk_rol', db.Integer(), db.ForeignKey('role.id_rol')))
