from flask import Blueprint, render_template, request, redirect, url_for
from models.clientes.clientes import Clientes
from controllers.cliente.cliente_Controllers import obtener_clientes, obtener_cliente_por_id
from models.clientes.clientes import Clientes
from db.db import get_connection 


clientes = Blueprint('clientes', __name__)


@clientes.route('/clientes', methods=["POST", "GET"])
def cliente():
     if request.method == 'POST':
        # Aquí puedes agregar la lógica para procesar los datos enviados en la solicitud POST
        create_form = Clientes(request.form)
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
        rol = create_form.rol.data
        id_Cliente=''
        id_Usuario=''
        id_Persona=''
        # Lógica para insertar empleado en la base de datos
     #    realizar_insercion(nombre, apaterno, amaterno, telefono, codigo_postal, numero_interior, numero_exterior, calle, colonia, correo, contrasenia, rol,id_Empleado,id_Usuario,id_Persona)
        # De cualquier modo, y si todo fue bien, redireccionar
     else:
        create_form = Clientes()
        emp = obtener_clientes()
        print(emp)
        return render_template('clientes.html',form=create_form, clientes=emp)
     


# @clientes.route("/clientesModificar",methods=['GET','POST'])
# def modificar():
#     create_fprm=Clientes(request.form)
#     if request.method=='GET':
#       id=request.args.get('id')
#       emp=obtener_cliente_por_id(id)
#       create_fprm.id_cliente.data=request.args.get('id')
#       create_fprm.nombre.data=emp[0][1]        
#     return render_template('modificarMaestros.html', form= create_fprm)

# @clientes.route("/clientesModificar",methods=['GET','POST'])
# def modificar():
#    create_fprm=Clientes(request.form)
#    if request.method=='GET':
#       id=request.args.get('id')
#       connection = get_connection()
#       try:
#          with connection.cursor() as cursor:
#             cursor.execute('CALL buscar_cliente_id(%s)',(id))
#             resultset = cursor.fetchall()
#             create_fprm.id_cliente.data=request.args.get('id')
#             create_fprm.nombre.data=resultset[0][1]
#             create_fprm.apaterno.data=resultset[0][2]
#             create_fprm.amaterno.data=resultset[0][3]       
#             create_form = Clientes()
#             emp = obtener_clientes()
#             print(emp)
#       except Exception as ex:
#          print(ex)
#       finally:
#          connection.close()
#       return render_template('clientesModificar.html', form= create_fprm,clientes=emp)
#    return render_template('clientesModificar.html', form= create_fprm, clientes=emp)
@clientes.route("/clientesModificar",methods=['GET','POST'])
def modificar():
   create_fprm=Clientes(request.form)
   if request.method=='GET':
      id=request.args.get('id')
      emp=obtener_cliente_por_id(id)
      create_fprm.id_cliente.data=request.args.get('id')
      create_fprm.id_persona.data=emp[0][13]
      create_fprm.id_usuario.data=emp[0][14]
      create_fprm.nombre.data=emp[0][1]
      create_fprm.apaterno.data=emp[0][2]
      create_fprm.amaterno.data=emp[0][3]
      create_fprm.telefono.data=emp[0][4] 
      create_fprm.calle.data=emp[0][8] 
      create_fprm.colonia.data=emp[0][9]   
      create_fprm.numero_exterior.data=emp[0][6]   
      create_fprm.numero_interior.data=emp[0][7]   
      create_fprm.correo.data=emp[0][10]   
      create_fprm.contrasenia.data=emp[0][11]          
      emp = obtener_clientes()
      print(emp)
   return render_template('clientesModificar.html', form= create_fprm, clientes=emp)
