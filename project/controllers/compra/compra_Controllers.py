from flask import Blueprint, render_template, redirect, url_for, request, flash
from db.db import get_connection
import models.compra.compra_Forms as forms
from datetime import datetime


# compraP= Blueprint('compras', __name__)

# @compraP.route('/compras')
# def compras():
#     create_form=forms.compra(request.form)
#     return render_template('compras.html',form=create_form)


def obtener_compras():
    # Obtener conexión a la base de datos
    conexion = get_connection()
    compras = []
    try:
        with conexion.cursor() as cursor:
            # Ejecutar una consulta SELECT para obtener los datos de la vista
            cursor.execute('SELECT * FROM vista_cargada_compra')
            compras = cursor.fetchall()
        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al obtener compras: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()
        return compras
    
def insertar_compra(arr_compra, id_Provedor, id_Empleado):
    # Obtener conexión a la base de datos
    conexion = get_connection()
    try:
        with conexion.cursor() as cursor:
            # Llamar al procedimiento almacenado pasando los parámetros necesarios
            cursor.callproc('insertar_compra', [arr_compra, id_Provedor, id_Empleado])

        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al insertar Compra: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()