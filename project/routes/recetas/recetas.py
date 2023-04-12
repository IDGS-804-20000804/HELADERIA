from flask import Blueprint, render_template, request, redirect, url_for
from db.db import get_connection
from flask_wtf.csrf import CSRFProtect
from models.receta.receta_Forms import receta
from controllers.receta.receta_Controllers import obtener_recetas, obtener_receta_por_id

recetas = Blueprint('recetas', __name__ )

@recetas.route('/recetas', methods=["POST", "GET"])
def Lreceta():
     if request.method == 'POST':
        # Aquí puedes agregar la lógica para procesar los datos enviados en la solicitud POST
        create_form = receta(request.form)
      #   id_unidadMedida= ''
      #   nombre = create_form.nombre.data
      #   unidadMedida = create_form.unidadMedida.data
        # De cualquier modo, y si todo fue bien, redireccionar
     #    return redirect(url_for('materiaPrima.materiaPrima'))
     else:
        create_form = receta()
        r = obtener_recetas()
        print(r)
        return render_template('recetas.html', form=create_form, receta=r)
     
@recetas.route("/recetasModificar",methods=['GET','POST'])
def modificar():
   create_fprm=receta(request.form)
   if request.method=='GET':
      id=request.args.get('id')
      emp=obtener_receta_por_id(id)
      create_fprm.id_Receta.data=request.args.get('id')
      create_fprm.nombre.data=emp[0][1]
      create_fprm.cantidad.data=emp[0][2]
      create_fprm.foto.data=emp[0][4]
      create_fprm.precio.data=emp[0][3] 
      emp = obtener_recetas()
      print(emp)
   return render_template('recetasModificar.html', form= create_fprm, receta=emp)
