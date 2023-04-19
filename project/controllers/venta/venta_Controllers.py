from flask import Blueprint, render_template, redirect, url_for, request, flash
from db.db import get_connection
import models.receta.receta_Forms as forms


ventasB= Blueprint('venta', __name__)


@ventasB.route('/venta')
def obtener_venta():
    conexion = get_connection()
    venta = []
    try:
        with conexion.cursor() as cursor:
            cursor.execute('SELECT * FROM stock_en_venta')
            venta = cursor.fetchall()
        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al obtener venta: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()
        return venta

@ventasB.route('/venta')
def insertar_venta(arr_venta, fk_cliente):
    conexion = get_connection()
    venta = []
    try:
        with conexion.cursor() as cursor:
            cursor.execute(f'CALL insertar_venta("{arr_venta}", {fk_cliente});')
            venta = cursor.fetchall()
        conexion.commit()
    except Exception as e:
        print("Error al insertar venta: ", e)
    finally:
        conexion.close()
        return venta