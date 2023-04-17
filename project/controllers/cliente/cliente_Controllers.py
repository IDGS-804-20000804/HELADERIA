from db.db import get_connection 



def obtener_clientes():
    # Obtener conexión a la base de datos
    conexion = get_connection()
    clientes = []
    try:
        with conexion.cursor() as cursor:
            # Ejecutar una consulta SELECT para obtener los datos de la vista
            cursor.execute('SELECT * FROM vista_cliente')
            clientes = cursor.fetchall()
        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al obtener clientes: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()
        return clientes
     
def insertar_cliente(nombre,apaterno,amaterno,telefono,codigo_postal,numero_interior,numero_exterior,calle,colonia,correo,contrasenia,id_Persona,id_Usuario,id_Cliente):
    # Obtener conexión a la base de datos
    conexion = get_connection()
    try:
        with conexion.cursor() as cursor:
            # Llamar al procedimiento almacenado pasando los parámetros necesarios
            cursor.callproc('insertar_cliente', [nombre,apaterno,amaterno,telefono,codigo_postal,numero_interior,numero_exterior,calle,colonia,correo,contrasenia,id_Persona,id_Usuario, id_Cliente])

        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al insertar Cliente: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()


def modificar_cliente(nombre,apaterno,amaterno,telefono,codigo_postal,numero_interior,numero_exterior,calle,colonia,correo,contrasenia,id_Persona,id_Usuario):
    # Obtener conexión a la base de datos
    conexion = get_connection()
    try:
        with conexion.cursor() as cursor:
            # Llamar al procedimiento almacenado pasando los parámetros necesarios
            cursor.callproc('actualizar_cliente', [nombre,apaterno,amaterno,telefono,codigo_postal,numero_interior,numero_exterior,calle,colonia,correo,contrasenia,id_Persona,id_Usuario])

        # Confirmar los cambios en la base de datos
        conexion.commit()
    except Exception as e:
        # Si hay algún error, imprimirlo en la consola
        print("Error al actualizar Cliente: ", e)
    finally:
        # Cerrar la conexión a la base de datos
        conexion.close()
# def insertar_empleado(nombre,apaterno,amaterno,telefono,codigo_postal,numero_interior,numero_exterior,calle,colonia,correo,contrasenia,rol,id_Empleado,id_Usuario,id_Persona):
#     # Obtener conexión a la base de datos
#     conexion = get_connection()
#     try:
#         with conexion.cursor() as cursor:
#             # Llamar al procedimiento almacenado pasando los parámetros necesarios
#             cursor.callproc('insertar_empleado', [nombre,apaterno,amaterno,telefono,codigo_postal,numero_interior,numero_exterior,calle,colonia,correo,contrasenia,rol,id_Empleado,id_Usuario,id_Persona])

#         # Confirmar los cambios en la base de datos
#         conexion.commit()
#     except Exception as e:
#         # Si hay algún error, imprimirlo en la consola
#         print("Error al insertar Mestro: ", e)
#     finally:
#         # Cerrar la conexión a la base de datos
#         conexion.close()
     
def obtener_cliente_por_id(id):
    # Obtener conexión a la base de datos
    conexion = get_connection()
    cliente = None
    try:
        with conexion.cursor() as cursor:
            # Llamar al procedimiento almacenado pasando los parámetros necesarios
            cursor.execute('CALL buscar_cliente_id(%s)',(id))
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

# def obtener_cliente_por_id():
#     create_fprm=Clientes(request.form)
#     id=request.args.get('id')
#     connection = get_connection()
#     try:
#         with connection.cursor() as cursor:
#             cursor.execute('CALL buscar_unMaestro(%s)',(id))
#             resultset = cursor.fetchall()
#             create_fprm.id.data=request.args.get('id')
#             create_fprm.nombre.data=resultset[0][1]
#             create_fprm.apaterno.data=resultset[0][2]
#             create_fprm.amaterno.data=resultset[0][3]
#             create_fprm.email.data=resultset[0][4]
#             create_fprm.curp.data=resultset[0][5]  
#             create_fprm.telefono.data=resultset[0][6]         
#     except Exception as ex:
#         print(ex)
#     finally:
#         connection.close()

#     if request.method=='POST':
#         id=create_fprm.id.data
#         nombre=create_fprm.nombre.data,
#         apaterno=create_fprm.apaterno.data,
#         amaterno=create_fprm.amaterno.data,
#         email=create_fprm.email.data,
#         curp=create_fprm.curp.data,
#         telefono=create_fprm.telefono.data
#         try:
#             connection=get_connection()
#             with connection.cursor() as cursor:
#                 cursor.execute('call modificar_unMaestro(%s,%s,%s,%s,%s,%s,%s)', (id, nombre, apaterno,amaterno, email, curp, telefono))
#             connection.commit()
#             connection.close()
#             flash('El registro con nombre {} se modifico correctamente!'.format(nombre))

#         except Exception as ex:
#            print('ERROR {}'.format(ex))
#         return redirect(url_for('maestros.ABCompleto'))
#     return render_template('modificarMaestros.html', form= create_fprm)


def eliminar_cliente_por_id(id):
    # Obtener conexión a la base de datos
    conexion = get_connection()
    cliente = None
    try:
        with conexion.cursor() as cursor:
            # Llamar al procedimiento almacenado pasando los parámetros necesarios
            cursor.execute('CALL eliminar_clientes(%s)', (id,))
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














# @empleados.route("/empleado",methods=['GET', 'POST'])
# def empleado():
#     create_form=forms.Empleados(request.form)
#     if request.method == 'POST':
#         nombre=create_form.nombre.data,
#         apaterno=create_form.apaterno.data,
#         amaterno=create_form.amaterno.data,
#         telefono=create_form.telefono.data,
#         codigo_postal=create_form.codigo_postal.data,
#         numero_exterior=create_form.numero_exterior.data,
#         numero_interior=create_form.numero_interior.data,
#         calle=create_form.calle.data,
#         colonia=create_form.colonia.data,
#         correo=create_form.correo.data,
#         contrasenia=create_form.contrasenia.data
#         estatus=1
#         now = datetime.now()
#         idEmpleado='@id_Empleado'
#         idUsuario='@id_Usuario'
#         idPersona='@id_Persona'
#         try:
#            connection=get_connection()
#            with connection.cursor() as cursor:
#                 # cursor.execute('call insertar_empleado(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)', 
#                 #                (nombre,apaterno,amaterno,telefono,codigo_postal,numero_interior,numero_exterior,
#                 #                 calle,colonia,estatus,correo,contrasenia,now,0,0,0))
#                 cursor.callproc('insertar_empleado',(nombre,apaterno,amaterno,telefono,codigo_postal,numero_interior,numero_exterior,
#                                 calle,colonia,estatus,correo,contrasenia,now,idPersona,idEmpleado,idUsuario))
#                 connection.commit()
#                 connection.close()
#                 print('Se inserto Correctamente!')
#         except Exception as ex:
#             print('ERROR {}'.format(ex))

#         # Redirige al usuario a la vista ABCompleto
#         # return redirect(url_for('maestros.ABCompleto'))
    
#     return render_template('empleados.html',form=create_form)