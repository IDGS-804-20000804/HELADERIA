from db.db import get_connection 
from models.entities.User import User


class ModeloLogin():
    @classmethod
    def inicio(self,db,user):
        conexion = get_connection()
        try:
              with conexion.cursor() as cursor:
                sql="SELECT id_usuario,correo,contrasenia FROM usuario WHERE correo = '{}' AND estatus = 1".format(user.correo)
                cursor.execute(sql)
                row = cursor.fetchone()
                if row != None:
                    user = User(row[0],row[1], User.check_password(row[2],user.contrasenia))
                    return user 
                else:
                    return None 
        except Exception as ex:
            raise Exception(ex)