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