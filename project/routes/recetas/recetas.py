from flask import Blueprint, render_template, request, redirect, url_for
from db.db import get_connection
from flask_wtf.csrf import CSRFProtect
from models.receta.receta_Forms import receta
from controllers.receta.receta_Controllers import obtener_recetas, obtener_receta_por_id
from controllers.materiaPrima.materiaPrima_Controllers import obtener_materia_prima

recetas = Blueprint('recetas', __name__ )

# @recetas.route('/recetas', methods=["POST", "GET"])
# def Lreceta():
#      if request.method == 'POST':
#         # Aquí puedes agregar la lógica para procesar los datos enviados en la solicitud POST
#         create_form = receta(request.form)
        
      
#      else:
#         create_form = receta()
#         r = obtener_recetas()
#         print(r)
#         mp = obtener_materia_prima()
#         print(mp)
#         foto=create_form.foto.data
#         datosMateria=list()
#         nombre = create_form.cantidad.data
#         datosMateria.append(nombre)
#         return render_template('recetas.html', form=create_form, receta=r, materiaPrima=mp, foto=foto, datosMateria=datosMateria)
     
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


nombres = []

@recetas.route('/recetas', methods=['GET', 'POST'])
def index():
    create_form = receta()
    r = obtener_recetas()
    mp = obtener_materia_prima()
    if request.method == 'POST':
        materia_seleccionada = request.form['materia']
        cantidad = request.form['cantidad']
        nombres.append({'nombre': materia_seleccionada, 'cantidad': cantidad})
    else:
         create_form = receta()
         r = obtener_recetas()
         print(r)
    return render_template('recetas.html', nombres=nombres,form=create_form, receta=r,materiaPrima=mp)

@recetas.route('/remove/<int:index>')
def remove(index):
    create_form = receta()
    mp = obtener_materia_prima()
    r = obtener_recetas()
    nombres.pop(index)
    return render_template('recetas.html', nombres=nombres,form=create_form, receta=r,materiaPrima=mp)

