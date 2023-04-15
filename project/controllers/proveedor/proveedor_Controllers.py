from flask import Blueprint, render_template, redirect, url_for, request, flash
from db.db import get_connection
import models.proveedor.proveedor_Forms as forms


proveedorB= Blueprint('provedor', __name__)

def obtener_proveedor(): # Obtener conexión a la base de datos
    conexion = get_connection()
    proveedor = []
    try:
        with conexion.cursor() as cursor:
            # Ejecutar una consulta SELECT para obtener los datos de la vista
            cursor.execute('SELECT * FROM vista_proveedor')
            proveedor = cursor.fetchall()
        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al obtener proveedor: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()
        return proveedor

def obtener_proveedor_por_id(id):
    # Obtener conexión a la base de datos
    conexion = get_connection()
    proveedor = None
    try:
        with conexion.cursor() as cursor:
            # Llamar al procedimiento almacenado pasando los parámetros necesarios
            cursor.execute('CALL buscar_proveedor_id(%s)',(id))
            proveedor = cursor.fetchall()
        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al consultar proveedor: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()
        return proveedor