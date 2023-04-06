from db import *


def insertar_maestro(nombre,apellidoP,apellidoM,edad,materia):
    # Obtener conexión a la base de datos
    conexion = obtener_conexion()
    try:
        with conexion.cursor() as cursor:
            # Llamar al procedimiento almacenado pasando los parámetros necesarios
            cursor.callproc('insertar_maestro', [nombre,apellidoP,apellidoM,edad,materia])

        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al insertar alumno: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()