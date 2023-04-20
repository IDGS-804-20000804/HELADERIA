from flask import Blueprint, render_template, request, redirect, url_for
from flask_login import LoginManager, login_user, logout_user, login_required
# import models.materiaPrima.materiaPrima_Forms as forms

from db.db import get_connection
from flask_wtf.csrf import CSRFProtect
from models.materiaPrima.materiaPrima_Forms import MateriaPrima
from controllers.materiaPrima.materiaPrima_Controllers import obtener_materia_prima, obtener_materiaP_por_id, insertar_materiaPrima, eliminar_materiaP_por_id, modificar_materiaP
from flask_security import roles_required, login_required
# csrf = CSRFProtect()
materiaPrima = Blueprint('materiaPrima', __name__ )

# @materiaPrima.route('/materiaPrima')
# def materiasPrimas():
#      create_form=forms.materiaPrima(request.form)
#      return render_template('materiaPrima.html',form=create_form)


@materiaPrima.route('/materiaPrima', methods=["POST", "GET"])
@login_required
def materiaP():
     if request.method == 'POST':
        # Aquí puedes agregar la lógica para procesar los datos enviados en la solicitud POST
        create_form = MateriaPrima(request.form)
      #   id_unidadMedida= ''
      #   nombre = create_form.nombre.data
      #   unidadMedida = create_form.unidadMedida.data
        # De cualquier modo, y si todo fue bien, redireccionar
        return redirect(url_for('materiaPrima.materiaPrima'))
     else:
        create_form = MateriaPrima()
        mp = obtener_materia_prima()
        print(mp)
        return render_template('materiaPrima.html', form=create_form, materiaPrima=mp)

@materiaPrima.route("/materiaPrimaModificar",methods=['GET','POST'])
def modificar():
   create_fprm=MateriaPrima(request.form)
   emp = obtener_materia_prima()
   if request.method=='GET':
      id=request.args.get('id')
      emp=obtener_materiaP_por_id(id)
      create_fprm.id_unidadMedida.data=request.args.get('id')
      create_fprm.nombre.data=emp[0][1]
      create_fprm.unidadMedida.data=emp[0][2]
     
   if request.method=='POST':
        id_unidadMedida=create_fprm.id_unidadMedida.data
        nombre=create_fprm.nombre.data 
        unidadM=create_fprm.unidadMedida.data  
        estatus=1
        if(unidadM=='Kilogramos'):
            unidadMedida=1
            modificar_materiaP(id_unidadMedida,nombre, estatus, unidadMedida)
        if(unidadM=='Gramos'):
            unidadMedida=2
            modificar_materiaP(id_unidadMedida,nombre, estatus, unidadMedida)
        if(unidadM=='Litros'):
            unidadMedida=3
            modificar_materiaP(id_unidadMedida,nombre, estatus, unidadMedida)
        if(unidadM=='Mililitros'):
            unidadMedida=4
            modificar_materiaP(id_unidadMedida,nombre, estatus, unidadMedida)
        if(unidadM=='Saco'):
            unidadMedida=5
            modificar_materiaP(id_unidadMedida,nombre, estatus, unidadMedida)
        if(unidadM=='Bolsa'):
            unidadMedida=6
            modificar_materiaP(id_unidadMedida,nombre, estatus, unidadMedida)
        if(unidadM=='Paquete'):
            unidadMedida=7
            modificar_materiaP(id_unidadMedida,nombre, estatus, unidadMedida)
        if(unidadM=='Cartón'):
            unidadMedida=8
            modificar_materiaP(id_unidadMedida,nombre, estatus, unidadMedida)
        if(unidadM=='Frasco'):
            unidadMedida=9
            modificar_materiaP(id_unidadMedida,nombre, estatus, unidadMedida)
        if(unidadM=='Unidad'):
            unidadMedida=10
            modificar_materiaP(id_unidadMedida,nombre, estatus, unidadMedida)
        return redirect(url_for('materiaPrima.materiaP'))
   return render_template('materiaPrimaModificar.html', form= create_fprm, materiaPrima=emp)

@materiaPrima.route('/insertar_materiaPrima', methods=["POST"])
def realizar_insercion():
    # Aquí puedes agregar la lógica para procesar los datos enviados en la solicitud POST
    nombre = request.form['nombre']
    apaterno = request.form['unidadMedidaGuardar']
    
    # Lógica para insertar empleado en la base de datos
    insertar_materiaPrima(nombre, apaterno)
    # De cualquier modo, y si todo fue bien, redireccionar
    return redirect(url_for('materiaPrima.materiaP'))

@materiaPrima.route('/materiaPEliminar', methods=['GET', 'POST'])
def eliminar_cliente():
    create_fprm = MateriaPrima(request.form)
    emp = obtener_materia_prima()
    if request.method == 'GET':
        # id = request.args.get('id')
        create_fprm.id_unidadMedida.data=request.args.get('id')
    if request.method == 'POST':
        id=create_fprm.id_unidadMedida.data
        eliminar_materiaP_por_id(id)  
        # emp = obtener_empleados() # Comenta esta línea si no la necesitas
        return redirect(url_for('materiaPrima.materiaP'))
    return render_template('materiaPrimaEliminar.html', form=create_fprm, materiaPrima=emp)
