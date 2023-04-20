from datetime import datetime
from flask_sqlalchemy import SQLAlchemy
from flask_security import UserMixin, RoleMixin

db = SQLAlchemy()


class Rol(db.Model, RoleMixin):
    __tablename__ = 'roles'

    id_rol = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column('nombre', db.String(255), nullable=False)
    active = db.Column('estatus', db.Boolean, nullable=False, default=True)
    created_at = db.Column('fecha_creacion', db.DateTime, nullable=False, default=datetime.utcnow)
    updated_at = db.Column('fecha_actualizacion', db.DateTime, nullable=False, default=datetime.utcnow, onupdate=datetime.utcnow)

    def __str__(self):
        return self.name
