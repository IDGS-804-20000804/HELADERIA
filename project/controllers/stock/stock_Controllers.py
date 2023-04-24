from db.db import get_connection 
from flask import Flask, flash, Markup
import json
import ast

def obtener_stock():
    # Obtener conexión a la base de datos
    conexion = get_connection()
    try:
        with conexion.cursor() as cursor:
            cursor.callproc('consultar_recetas_posibles_tabla')
            results = cursor.fetchone()
            conexion.commit()
        resultados_finales = obtener_stock_nombres_ids(results)
        return resultados_finales
    except Exception as e:
        print("Error al consultar stock: ", e)
    finally:
        conexion.close()

def obtener_stock_nombres_ids(result):
    # Obtener conexión a la base de datos
    conexion = get_connection()
    try:
        string = str(result)
        ids = string.replace("[","").replace("]","").replace("',","").replace("'","")
        with conexion.cursor() as cursor:
            cursor.execute(f'SELECT * FROM receta WHERE id_receta IN {ids}')
            results = cursor.fetchall()  # Fetch all rows
            conexion.commit()
        return results
    except Exception as e:
        print("Error al consultar stock: ", e)
    finally:
        conexion.close()



# def consultar_recetas_posibles(id):
#     # Conexión a la base de datos
    
#     conexion = get_connection()
#     stock = None
#     try:
#         with conexion.cursor() as cursor:
#             # Llamar al procedimiento almacenado pasando los parámetros necesarios
#             cursor.callproc('consultar_recetas_posibles')
#             results = cursor.fetchone()
#             ids = json.loads(results[0])
#         # Confirmar los cambios en la base de datos
#         conexion.commit()
#         return ids
#     except Exception as e:
#         # Si hay algún error, imprimirlo en la consola
#         print("Error al consultar stock: ", e)
#     finally:
#         # Cerrar la conexión a la base de datos
#         conexion.close()
        # return stock
    
def consultar_recetas_posibles():
    # Obtener conexión a la base de datos
    conexion = get_connection()
    stock = []
    try:
        with conexion.cursor() as cursor:
            # Ejecutar una consulta SELECT para obtener los datos de la vista
            cursor.callproc('consultar_recetas_posibles_tabla')
            stock = cursor.fetchone()
        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al obtener stock: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()
        return stock
    

    # Obtener conexión a la base de datos
    # conexion = get_connection()
    # try:
    #     with conexion.cursor() as cursor:
    #         # Llamar al procedimiento almacenado pasando los parámetros necesarios
    #         cursor.callproc('consultar_recetas_posibles_tabla')

    #     # Confirmar los cambios en la base de datos
    #     conexion.commit()
    # except Exception as e:
    #     # Si hay algún error, imprimirlo en la consola
    #     print("Error al consultar Stock: ", e)
    # finally:
    #     # Cerrar la conexión a la base de datos
    #     conexion.close()



def insertar_stock(caducidad, precio, idreceta):
    # Obtener conexión a la base de datos
    conexion = get_connection()
    try:
        with conexion.cursor() as cursor:
            # Llamar al procedimiento almacenado pasando los parámetros necesarios
            cursor.callproc('insertar_stock', [caducidad, precio, idreceta])

        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al insertar Stock: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()