from flask import Blueprint, render_template, redirect, url_for, request, flash
from db.db import get_connection
import models.receta.receta_Forms as forms


recetaB= Blueprint('recetas', __name__)
def obtener_recetas():
    # Obtener conexión a la base de datos
    conexion = get_connection()
    receta = []
    try:
        with conexion.cursor() as cursor:
            # Ejecutar una consulta SELECT para obtener los datos de la vista
            cursor.execute('SELECT * FROM vista_receta')
            receta = cursor.fetchall()
        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al obtener receta: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()
        return receta
    
def obtener_receta_por_id(id):
    # Obtener conexión a la base de datos
    conexion = get_connection()
    receta = None
    try:
        with conexion.cursor() as cursor:
            # Llamar al procedimiento almacenado pasando los parámetros necesarios
            cursor.execute('CALL buscar_receta_id(%s)',(id))
            receta = cursor.fetchall()
        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al consultar receta: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()
        return receta
    
def insertar_receta(nombre,cantidad, precio, ruta_imagen,arr_receta):
    # Obtener conexión a la base de datos
    conexion = get_connection()
    try:
        with conexion.cursor() as cursor:
            # Llamar al procedimiento almacenado pasando los parámetros necesarios
            cursor.callproc('insertar_receta', [nombre,cantidad, precio, ruta_imagen,arr_receta])

        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al insertar Receta: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()

def eliminar_receta_por_id(id):
    # Obtener conexión a la base de datos
    conexion = get_connection()
    receta = None
    try:
        with conexion.cursor() as cursor:
            # Llamar al procedimiento almacenado pasando los parámetros necesarios
            cursor.execute('CALL eliminar_receta(%s)', (id,))
            receta = cursor.fetchall()
        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al consultar receta: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()
        return receta