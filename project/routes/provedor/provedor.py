from flask import Blueprint, render_template, request, redirect, url_for
from db.db import get_connection
from models.proveedor.proveedor_Forms import Proveedor
from controllers.proveedor.proveedor_Controllers import obtener_proveedor, obtener_proveedor_por_id
from flask_wtf.csrf import CSRFProtect

# csrf = CSRFProtect()
provedor = Blueprint('provedor', __name__ )

@provedor.route('/provedor', methods=["POST", "GET"])
def provedores():
     if request.method == 'POST':
        # Aquí puedes agregar la lógica para procesar los datos enviados en la solicitud POST
        create_form = Proveedor(request.form)
      #   id_unidadMedida= ''
      #   nombre = create_form.nombre.data
      #   unidadMedida = create_form.unidadMedida.data
        # De cualquier modo, y si todo fue bien, redireccionar
     #    return redirect(url_for('materiaPrima.materiaPrima'))
     else:
        create_form = Proveedor()
        pro = obtener_proveedor()
        print(pro)
        return render_template('provedor.html', form=create_form, proveedor=pro)
     
@provedor.route("/provedorModificar",methods=['GET','POST'])
def modificar():
   create_fprm=Proveedor(request.form)
   if request.method=='GET':
      id=request.args.get('id')
      emp=obtener_proveedor_por_id(id)
      create_fprm.id_proveedor.data=request.args.get('id')
      create_fprm.id_persona.data=emp[0][11]
      create_fprm.nombre.data=emp[0][2]
      create_fprm.apaterno.data=emp[0][3]
      create_fprm.amaterno.data=emp[0][4]
      create_fprm.telefono.data=emp[0][5] 
      create_fprm.codigo_postal.data=emp[0][6] 
      create_fprm.calle.data=emp[0][9] 
      create_fprm.colonia.data=emp[0][10]   
      create_fprm.numero_exterior.data=emp[0][7]   
      create_fprm.numero_interior.data=emp[0][8]   
      create_fprm.correo.data=emp[0][1]   
      emp = obtener_proveedor()
      print(emp)
   return render_template('provedorModificar.html', form= create_fprm, proveedor=emp)
