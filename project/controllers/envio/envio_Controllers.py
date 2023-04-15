from flask import Blueprint, render_template, redirect, url_for, request, flash
from db.db import get_connection
import models.envio.envio_Forms as forms
from datetime import datetime


envioP= Blueprint('envio', __name__)

@envioP.route('/envio')
def obtener_envio():
     # Obtener conexión a la base de datos
    conexion = get_connection()
    envio = []
    try:
        with conexion.cursor() as cursor:
            # Ejecutar una consulta SELECT para obtener los datos de la vista
            cursor.execute('SELECT * FROM vista_envio')
            envio = cursor.fetchall()
        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al obtener envio: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()
        return envio