from flask import Blueprint, render_template, request, redirect, url_for
from datetime import datetime
from models.empleados.Empleados import Empleados
from controllers.controllerEmpleado import obtener_empleados,insertar_empleado
import json


empleados = Blueprint('empleados', __name__)
@empleados.route('/empleados', methods=["POST", "GET"])
def empleado():
    if request.method == 'POST':
        # Aquí puedes agregar la lógica para procesar los datos enviados en la solicitud POST
        create_form = Empleados(request.form)
        nombre = create_form.nombre.data
        apaterno = create_form.apaterno.data
        amaterno = create_form.amaterno.data
        telefono = create_form.telefono.data
        codigo_postal = create_form.codigo_postal.data
        numero_exterior = create_form.numero_exterior.data
        numero_interior = create_form.numero_interior.data
        calle = create_form.calle.data
        colonia = create_form.colonia.data
        correo = create_form.correo.data
        contrasenia = create_form.contrasenia.data
        id_Empleado=''
        id_Usuario=''
        id_Persona=''
        rol1=request.form.get('cbox1')
        rol2=request.form.get('cbox2')
        rol3=request.form.get('cbox3')
        rol4=request.form.get('cbox4')
        rol5=request.form.get('cbox5')
        rol6=request.form.get('cbox6')
        rol7=request.form.get('cbox7')
        # Lógica para insertar empleado en la base de datos
        realizar_insercion(nombre, apaterno, amaterno, telefono, codigo_postal, numero_interior, numero_exterior, calle, colonia, correo, contrasenia, rol7,id_Empleado,id_Usuario,id_Persona)
        # De cualquier modo, y si todo fue bien, redireccionar
        return redirect(url_for('empleados.empleado'))
    else:
        create_form = Empleados()
        emp = obtener_empleados()
     
        return render_template('empleados.html', form=create_form, empleados=emp)



@empleados.route('/insertar_empleado', methods=["POST"])
def realizar_insercion():
    # Aquí puedes agregar la lógica para procesar los datos enviados en la solicitud POST
    nombre = request.form['nombre']
    apaterno = request.form['apaterno']
    amaterno = request.form['amaterno']
    telefono = request.form['telefono']
    codigo_postal = request.form['codigo_postal']
    numero_exterior = request.form['numero_exterior']
    numero_interior = request.form['numero_interior']
    calle = request.form['calle']
    colonia = request.form['colonia']
    correo = request.form['correo']
    contrasenia = request.form['contrasenia']
    rol1=request.form.get('cbox1')
    rol2=request.form.get('cbox2')
    rol3=request.form.get('cbox3')
    rol4=request.form.get('cbox4')
    rol5=request.form.get('cbox5')
    rol6=request.form.get('cbox6')
    rol7=request.form.get('cbox7')
    roles=list()
    roles=[rol1,rol2,rol3,rol4,rol5,rol6,rol7]
    arreglo=[elemento for elemento in roles if elemento is not None]
    print(arreglo)
    rol = []
    for cadena in arreglo:
        rol.append(int(cadena))
    print(rol)
    json_string = json.dumps(rol)

    id_Empleado=''
    id_Usuario=''
    id_Persona=''
    # Lógica para insertar empleado en la base de datos
    insertar_empleado(nombre, apaterno, amaterno, telefono, codigo_postal, numero_interior, numero_exterior, calle, colonia, correo, contrasenia, json_string,id_Empleado,id_Usuario,id_Persona)
    # De cualquier modo, y si todo fue bien, redireccionar
    return redirect(url_for('empleados.empleado'))







# @empleados.route('/empleados',methods=["POST","GET"])
# def empleado():
#      create_form = Empleados(request.form)
#      emp = obtener_empleados()
#      print(emp)
#      #Si el metodo es POST Se hara un insert 
#      return render_template('empleados.html',form=create_form,empleados=emp)

# def insertar_empleado():
#      if request.method == 'POST':
#           nombre=nombre.data,
#           apaterno=apaterno.data,
#           amaterno=amaterno.data,
#           telefono=telefono.data,
#           codigo_postal=codigo_postal.data,
#           numero_exterior=numero_exterior.data,
#           numero_interior=numero_interior.data,
#           calle=calle.data,
#           colonia=colonia.data,
#           correo=correo.data,
#           contrasenia=contrasenia.data
#           rol=rol.data
#           insertar_empleado(nombre,apaterno,amaterno,telefono,codigo_postal,numero_interior,numero_exterior,calle,colonia,correo,contrasenia,rol)
#           # De cualquier modo, y si todo fue bien, redireccionar
#           print(e)
          
#      return render_template('empleados.html')















# @empleados.route("/empleados",methods=['GET', 'POST'])
# def insetar():
#     create_form=Empleados(request.form)
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

# # @empleados.route('/empleados',method=["POST"])
# # def registro():
# #      nombre = request.form["txtNombre"]
# #      apaterno = request.form["txtApellidoPaterno"]
# #      email = request.form["txtApellidoMaterno"]
# #      nombre = request.form["txtTelefono"]
# #      apaterno = request.form["txtApellidoPaterno"]
# #      email = request.form["txtCorreo"]
# #      nombre = request.form["txtCalle"]
# #      apaterno = request.form["txtColonia"]
# #      email = request.form["txtNumero"]
# #      controller.controlador_alumnos.insertar_alumnos(nombre,apaterno,email)

 













# # @students.route('/insert-student', methods=['GET', 'POST'])
# # def insert_student():
# #     create_form = StudentForm(request.form)
# #     if (request.method == 'POST'):
# #         insertStudent(create_form)
# #         return redirect(url_for('students.index_students'))
# #     return render_template('insert_student.html', form=create_form)


# # @students.route('/update-student', methods=['GET', 'POST'])
# # def update_student():
# #     create_form = StudentForm(request.form)
# #     if (request.method == 'GET'):
# #         id = request.args.get('id')
# #         response = setStudent(id, create_form)
# #     if (request.method == 'POST'):
# #         updateStudent(create_form.id.data, create_form)
# #         return redirect(url_for('students.index_students'))
# #     return render_template('update_student.html', form=response)


# # @students.route('/delete-student', methods=['GET', 'POST'])
# # def delete_student():
# #     create_form = StudentForm(request.form)
# #     if (request.method == 'GET'):
# #         id = request.args.get('id')
# #         response = setStudent(id, create_form)
# #     if (request.method == 'POST'):
# #         deleteStudent(create_form.id.data, create_form)
# #         return redirect(url_for('students.index_students'))
# #     return render_template('delete_student.html', form=response)
