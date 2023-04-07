from flask import Blueprint, render_template, redirect, url_for, request, flash
from db.db import get_connection
import models.forms as forms
from datetime import datetime


empleados= Blueprint('empleado', __name__)


@empleados.route("/empleado",methods=['GET', 'POST'])
def empleado():
    create_form=forms.Empleados(request.form)
    if request.method == 'POST':
        nombre=create_form.nombre.data,
        apaterno=create_form.apaterno.data,
        amaterno=create_form.amaterno.data,
        telefono=create_form.telefono.data,
        codigo_postal=create_form.codigo_postal.data,
        numero_exterior=create_form.numero_exterior.data,
        numero_interior=create_form.numero_interior.data,
        calle=create_form.calle.data,
        colonia=create_form.colonia.data,
        correo=create_form.correo.data,
        contrasenia=create_form.contrasenia.data
        estatus=1
        now = datetime.now()
        idEmpleado='@id_Empleado'
        idUsuario='@id_Usuario'
        idPersona='@id_Persona'
        try:
           connection=get_connection()
           with connection.cursor() as cursor:
                # cursor.execute('call insertar_empleado(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)', 
                #                (nombre,apaterno,amaterno,telefono,codigo_postal,numero_interior,numero_exterior,
                #                 calle,colonia,estatus,correo,contrasenia,now,0,0,0))
                cursor.callproc('insertar_empleado',(nombre,apaterno,amaterno,telefono,codigo_postal,numero_interior,numero_exterior,
                                calle,colonia,estatus,correo,contrasenia,now,idPersona,idEmpleado,idUsuario))
                connection.commit()
                connection.close()
                print('Se inserto Correctamente!')
        except Exception as ex:
            print('ERROR {}'.format(ex))

        # Redirige al usuario a la vista ABCompleto
        # return redirect(url_for('maestros.ABCompleto'))
    
    return render_template('empleados.html',form=create_form)