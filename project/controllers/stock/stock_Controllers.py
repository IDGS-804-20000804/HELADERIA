from db.db import get_connection 
from flask import Flask, flash, Markup
import json

def obtener_stock():
    # Obtener conexión a la base de datos
    conexion = get_connection()
    stock = None
    try:
        with conexion.cursor() as cursor:
            oids = 0  # Creamos una lista vacía para almacenar el resultado
            # Llamar al procedimiento almacenado pasando los parámetros necesarios
            print('11111111111')
            result_args = cursor.execute(f'CALL consultar_recetas_posibles({oids})')
            print('2222222222222')
            print(oids)
            print(result_args)
            print('3333333333333')
            # Retrieve JSON output
            user_details = result_args[1]
        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al consultar stock: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()
        return stock

    

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