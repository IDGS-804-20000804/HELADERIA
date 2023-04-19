from db.db import get_connection 
from models.entities.User import User

@classmethod
class ModeloLogin():
    
    def inicio(self,db,user):
        cursor = get_connection()
        try:
            sql="SELECT id_ususario,email,password FROM usuario WHERE email = ´{}' AND estatus = 1".format(user.email)
            cursor.execute(sql)
            row = cursor.fetchone()
            if row != None:
                user = User(row[0],row[1], User.check_password(row[2],user.password), row[3])
                return user 
            else:
                return None 
        except Exception as ex:
            raise Exception(ex)