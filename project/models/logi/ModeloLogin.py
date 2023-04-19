from db.db import get_connection 
from models.entities.User import User,UserDatos


class ModeloLogin():
    @classmethod
    def inicio(self, db, user):
        conexion = get_connection()
        try:
            with conexion.cursor() as cursor:
                sql = "SELECT id_usuario,correo,contrasenia FROM usuario WHERE correo = '{}' AND estatus = 1".format(user.correo)
                cursor.execute(sql)
                row = cursor.fetchone()
                if row != None:
                    user = User(row[0], row[1], User.check_password(row[2], user.contrasenia))
                    # sql2 = "CALL obtener_info_usuario({})".format(idUsuario)
                    # cursor.execute(sql2)
                    # row2 = cursor.fetchall()
                    return user #, row2  # Devolver también la variable row2
                else:
                    return None  # Devolver None para ambos valores
        except Exception as ex:
            raise Exception(ex)

class ModeloLogins():
    @classmethod
    def get_by_id(self, db, id_usuario):
        conexion = get_connection()
        try:
            with conexion.cursor() as cursor:
                sql = "CALL obtener_info_usuario({})".format(id_uuario)
                cursor.execute(sql)
                row = cursor.fetchone()
                if row != None:
                    logged_user = UserDatos(row[0],row[1],row[2],None,row[4])
                    # sql2 = "CALL obtener_info_usuario({})".format(idUsuario)
                    # cursor.execute(sql2)
                    # row2 = cursor.fetchall()
                    return logged_user #, row2  # Devolver también la variable row2
                else:
                    return None  # Devolver None para ambos valores
        except Exception as ex:
            raise Exception(ex)












# class ModeloLogin():
#     @classmethod
#     def inicio(self,db,user):
#         conexion = get_connection()
#         row2 = None  # Asigna un valor predeterminado
#         try:
#               with conexion.cursor() as cursor:
#                 sql="SELECT id_usuario,correo,contrasenia FROM usuario WHERE correo = '{}' AND estatus = 1".format(user.correo)
#                 cursor.execute(sql)
#                 row = cursor.fetchone()
#                 if row != None:
#                     idUsuario = row[0]
#                     user = User(row[0],row[1], User.check_password(row[2],user.contrasenia))
#                     sql2 ="CALL obtener_info_usuario({})".format(idUsuario)
#                     cursor.execute(sql2)
#                     row2 = cursor.fetchone()

#                     return user , row2
#                 else:
#                     return None 
#         except Exception as ex:
#             raise Exception(ex)

# class ModeloLogin():
#     @classmethod
#     def inicio(self,db,user):
#         conexion = get_connection()
#         try:
#               with conexion.cursor() as cursor:
#                 sql="SELECT id_usuario,correo,contrasenia FROM usuario WHERE correo = '{}' AND estatus = 1".format(user.correo)
#                 cursor.execute(sql)
#                 row = cursor.fetchone()
#                 if row != None:
#                     idUsuario = row[0]
#                     user = User(row[0],row[1], User.check_password(row[2],user.contrasenia))
#                     sql2 ="CALL obtener_info_usuario({})".format(idUsuario)
#                     cursor.execute(sql2)
#                     row2 = cursor.fetchall()

#                     return user , row2
#                 else:
#                     return None 
#         except Exception as ex:
#             raise Exception(ex)