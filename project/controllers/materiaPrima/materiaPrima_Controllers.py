from flask import Blueprint, render_template, redirect, url_for, request, flash
from db.db import get_connection
import models.materiaPrima.materiaPrima_Forms as forms
from datetime import datetime


materiaP= Blueprint('materiaPrima', __name__)

# @materiaP.route('/materiaPrima')
# def materiaPrima():
#     create_form=forms.materiaPrima(request.form)
#     return render_template('materiaPrima.html',form=create_form)

def obtener_materia_prima():
    # Obtener conexión a la base de datos
    conexion = get_connection()
    materiaP = []
    try:
        with conexion.cursor() as cursor:
            # Ejecutar una consulta SELECT para obtener los datos de la vista
            cursor.execute('SELECT * FROM vista_materia_prima')
            materiaP = cursor.fetchall()
        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al obtener materiaP: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()
        return materiaP
    
def obtener_materiaP_por_id(id):
    # Obtener conexión a la base de datos
    conexion = get_connection()
    materiaPrima = None
    try:
        with conexion.cursor() as cursor:
            # Llamar al procedimiento almacenado pasando los parámetros necesarios
            cursor.execute('CALL buscar_materia_prima_id(%s)',(id))
            materiaPrima = cursor.fetchall()
        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al consultar materia prima: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()
        return materiaPrima
    
def insertar_materiaPrima(nombre,unidadMedida):
    # Obtener conexión a la base de datos
    conexion = get_connection()
    try:
        with conexion.cursor() as cursor:
            # Llamar al procedimiento almacenado pasando los parámetros necesarios
            cursor.callproc('insertar_materia_prima', [nombre,unidadMedida])

        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al insertar Meteria Prima: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()

def eliminar_materiaP_por_id(id):
    # Obtener conexión a la base de datos
    conexion = get_connection()
    cliente = None
    try:
        with conexion.cursor() as cursor:
            # Llamar al procedimiento almacenado pasando los parámetros necesarios
            cursor.execute('CALL eliminar_materia_prima(%s)', (id,))
            cliente = cursor.fetchall()
        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al consultar cliente: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()
        return cliente
    
def modificar_materiaP(id_MateriaPrima,nombre,estatus,unidadMedida):
    # Obtener conexión a la base de datos
    conexion = get_connection()
    try:
        with conexion.cursor() as cursor:
            # Llamar al procedimiento almacenado pasando los parámetros necesarios
            cursor.callproc('actualizar_materia_prima', [id_MateriaPrima,nombre,estatus,unidadMedida])

        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al actualizar Materia PrIMA: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()