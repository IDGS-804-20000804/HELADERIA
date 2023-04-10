from db.db import get_connection 



def obtener_almacen():
    # Obtener conexión a la base de datos
    conexion = get_connection()
    almacen = []
    try:
        with conexion.cursor() as cursor:
            # Ejecutar una consulta SELECT para obtener los datos de la vista
            cursor.execute('SELECT * FROM vista_almacen')
            almacen = cursor.fetchall()
        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al obtener almacen: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()
        return almacen