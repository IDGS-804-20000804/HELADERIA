import controller.controlador_alumnos
import pymysql


def obtener_conexion():
    return pymysql.connect(host='localhost',
                                user='root',
                                password='vegetta777',
                                db='utl')
