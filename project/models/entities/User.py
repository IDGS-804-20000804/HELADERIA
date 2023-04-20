from werkzeug.security import check_password_hash,generate_password_hash
from flask_login import UserMixin

class User(UserMixin):
    def __init__(self,id_usuario,correo,contrasenia,estatus="",fecha_creacion="",fecha_actualizacion="") -> None:
        self.id_usuario = id_usuario
        self.correo=correo
        self.contrasenia = contrasenia
        self.estatus=estatus
        self.fecha_creacion=fecha_creacion
        self.fecha_actualizacion = fecha_actualizacion
    
    def get_id(self):
        return self.id_usuario
    
    @classmethod
    def check_password(self,hashed_password,contrasenia):
        return check_password_hash(hashed_password,contrasenia)

class UserDatos(UserMixin):
    def __init__(self,id_usuario,correo,contrasenia,estatus, roles):
        self.id_usuario = id_usuario
        self.correo=correo
        self.contrasenia = contrasenia
        self.estatus=estatus
        self.roles=roles

  
#rint(generate_password_hash("Hola"))