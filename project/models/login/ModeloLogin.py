from db.db import get_connection 
from models.entities.User import User


class ModeloLogin():
    @classmethod
    def inicio(cls, correo, contrasenia):
        conexion = get_connection()
        try:
            with conexion.cursor() as cursor:
                sql="SELECT id_usuario, correo, contrasenia FROM usuario WHERE correo = '{0}' AND estatus = 1 AND contrasenia = '{1}'".format(correo, contrasenia)
                cursor.execute(sql)
                row = cursor.fetchone()
                if row != None:
                    user = User(row[0], row[1], None)
                    return user 
                else:
                    return None 
        except Exception as ex:
            raise Exception(ex)