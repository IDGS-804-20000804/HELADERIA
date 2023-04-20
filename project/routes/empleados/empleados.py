from flask import Blueprint, render_template, request, redirect, url_for
from datetime import datetime
from models.empleados.Empleados import Empleados
from controllers.controllerEmpleado import obtener_empleados,insertar_empleado, obtener_empleado_por_id, eliminar_empleado_por_id, modificar_empleado
import json
from flask import jsonify
# from flask_login import login_required
from flask_security import roles_required, login_required

empleados = Blueprint('empleados', __name__)
@empleados.route('/empleados', methods=["POST", "GET"])
@login_required
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

@empleados.route("/empleadosModificar",methods=['GET','POST'])
def modificar():
   create_fprm=Empleados(request.form)
   if request.method=='GET':
      id=request.args.get('id')
      emp=obtener_empleado_por_id(id)
      create_fprm.id_empleado.data=request.args.get('id')
      create_fprm.id_usuario.data=emp[0][13]
      create_fprm.id_persona.data=emp[0][14]
      create_fprm.nombre.data=emp[0][1]
      create_fprm.apaterno.data=emp[0][2]
      create_fprm.amaterno.data=emp[0][3]
      create_fprm.telefono.data=emp[0][4] 
      create_fprm.calle.data=emp[0][8] 
      create_fprm.codigo_postal.data=emp[0][5] 
      create_fprm.colonia.data=emp[0][9]   
      create_fprm.numero_exterior.data=emp[0][6]   
      create_fprm.numero_interior.data=emp[0][7]   
      create_fprm.correo.data=emp[0][10]   
      create_fprm.contrasenia.data=emp[0][11]   
      rol=emp[0][12]
      datos_json = json.loads(rol)
      for valor in datos_json:
        if valor == 1:
            create_fprm.cbox1.data = True
        elif valor == 2:
            create_fprm.cbox2.data = True
        elif valor == 3:
            create_fprm.cbox3.data = True
        elif valor == 4:
            create_fprm.cbox4.data = True
        elif valor == 5:
            create_fprm.cbox5.data = True
        elif valor == 6:
            create_fprm.cbox6.data = True
        elif valor == 7:
            create_fprm.cbox7.data = True
      print(rol)    
      emp = obtener_empleados()
   if request.method=='POST':
        id_Persona=create_fprm.id_persona.data
        id_Usuario=create_fprm.id_usuario.data
        nombre=create_fprm.nombre.data,
        apaterno=create_fprm.apaterno.data,
        amaterno=create_fprm.amaterno.data,
        telefono=create_fprm.telefono.data
        calle=create_fprm.calle.data
        colonia=create_fprm.colonia.data 
        codigo_postal=create_fprm.codigo_postal.data 
        numero_exterior=create_fprm.numero_exterior.data  
        numero_interior=create_fprm.numero_interior.data  
        correo=create_fprm.correo.data   
        contrasenia=create_fprm.contrasenia.data
        # cbox1=create_fprm.cbox1.data
        # cbox2=create_fprm.cbox2.data
        # cbox3=create_fprm.cbox3.data
        # cbox4=create_fprm.cbox4.data
        # cbox5=create_fprm.cbox5.data
        # cbox6=create_fprm.cbox6.data
        # cbox7=create_fprm.cbox7.data
        # rol2=[cbox1, cbox2, cbox3, cbox4, cbox5, cbox6, cbox7]
        # print(rol2)
        seleccionados = []
        if create_fprm.cbox1.data:
            seleccionados.append('1')
        if create_fprm.cbox2.data:
            seleccionados.append('2')
        if create_fprm.cbox3.data:
            seleccionados.append('3')
        if create_fprm.cbox4.data:
            seleccionados.append('4')
        if create_fprm.cbox5.data:
            seleccionados.append('5')
        if create_fprm.cbox6.data:
            seleccionados.append('6')
        if create_fprm.cbox7.data:
            seleccionados.append('7')
        print(seleccionados)
        
        rol = []
        for cadena in seleccionados:
            rol.append(int(cadena))
        print(rol)
        json_string = json.dumps(rol)
        # print(rol2)
        # datos_json = json.dumps(rol2)  # convierte la lista rol2 en una cadena JSON
        # jsonRol=[]
        # for valor in datos_json:
        #     if valor == 1:
        #         create_fprm.cbox1.data = True
        #         jsonRol.append('1')
        #     elif valor == 2:
        #         create_fprm.cbox2.data = True
        #         jsonRol.append('2')
        #     elif valor == 3:
        #         create_fprm.cbox3.data = True
        #         jsonRol.append('3')
        #     elif valor == 4:
        #         create_fprm.cbox4.data = True
        #         jsonRol.append('4')
        #     elif valor == 5:
        #         create_fprm.cbox5.data = True
        #         jsonRol.append('5')
        #     elif valor == 6:
        #         create_fprm.cbox6.data = True
        #         jsonRol.append('6')
        #     elif valor == 7:
        #         create_fprm.cbox7.data = True
        #         jsonRol.append('7')
        # json_string = json.dumps(jsonRol)
        # datos_json_rol = json.loads(json_string)
        # print(datos_json_rol)
        datos_json_rol=[4,3]
        modificar_empleado(nombre,apaterno,amaterno,telefono,codigo_postal,numero_interior,numero_exterior,calle,colonia,correo,contrasenia,json_string,id_Persona,id_Usuario)
        return redirect(url_for('empleados.empleado'))
   return render_template('empleadosModificar.html', form= create_fprm, empleados=emp)

@empleados.route('/empleadosEliminar', methods=['GET', 'POST'])
def eliminar_empleado():
    create_fprm = Empleados(request.form)
    emp = obtener_empleados()
    if request.method == 'GET':
        # id = request.args.get('id')
        create_fprm.id_persona.data=request.args.get('id')
    if request.method == 'POST':
        id=create_fprm.id_persona.data
        eliminar_empleado_por_id(id)  
        # emp = obtener_empleados() # Comenta esta línea si no la necesitas
        return redirect(url_for('empleados.empleado'))
    return render_template('empleadosEliminar.html', form=create_fprm, empleados=emp)

# @empleados.route('/eliminar_empleado_ajax', methods=['POST'])
# def eliminar_empleado_ajax():
#     try:
#         id = request.form.get('id')
#         eliminar_empleado_por_id(id)
#         return jsonify({'status': 'OK'})
#     except Exception as e:
#         return jsonify({'status': 'ERROR', 'message': str(e)})

# @app.route('/editar_empleado/<id_empleado>', methods=['GET'])
# def editar_empleado(id_empleado):
#     # Obtener los datos del empleado con el id_empleado dado
#     empleado = obtener_empleado_por_id(id_empleado)

#     # Asignar los valores del empleado a las variables del formulario
#     form.nombre.data = empleado['nombre']
#     form.apaterno.data = empleado['apaterno']
#     form.amaterno.data = empleado['amaterno']
#     form.telefono.data = empleado['telefono']
#     form.numero_exterior.data = empleado['numero_exterior']
#     form.codigo_postal.data = empleado['codigo_postal']
#     form.calle.data = empleado['calle']
#     form.numero_interior.data = empleado['numero_interior']
#     form.colonia.data = empleado['colonia']
#     form.municipio.data = empleado['municipio']
#     form.estado.data = empleado['estado']
#     form.pais.data = empleado['pais']
    
#     # Renderizar la plantilla con los datos del empleado en los campos del formulario
#     return render_template('editar_empleado.html', form=form, empleados=empleado)


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
