from flask import Blueprint, render_template, request, redirect, url_for



compras = Blueprint('compras', __name__)

@compras.route('/compras')
def compra():
     return render_template('compras.html')

# @empleados.route('/empleados',method=["POST"])
# def registro():
#      nombre = request.form["txtNombre"]
#      apaterno = request.form["txtApellidoPaterno"]
#      email = request.form["txtApellidoMaterno"]
#      nombre = request.form["txtTelefono"]
#      apaterno = request.form["txtApellidoPaterno"]
#      email = request.form["txtCorreo"]
#      nombre = request.form["txtCalle"]
#      apaterno = request.form["txtColonia"]
#      email = request.form["txtNumero"]
#      controller.controlador_alumnos.insertar_alumnos(nombre,apaterno,email)

 













# @students.route('/insert-student', methods=['GET', 'POST'])
# def insert_student():
#     create_form = StudentForm(request.form)
#     if (request.method == 'POST'):
#         insertStudent(create_form)
#         return redirect(url_for('students.index_students'))
#     return render_template('insert_student.html', form=create_form)


# @students.route('/update-student', methods=['GET', 'POST'])
# def update_student():
#     create_form = StudentForm(request.form)
#     if (request.method == 'GET'):
#         id = request.args.get('id')
#         response = setStudent(id, create_form)
#     if (request.method == 'POST'):
#         updateStudent(create_form.id.data, create_form)
#         return redirect(url_for('students.index_students'))
#     return render_template('update_student.html', form=response)


# @students.route('/delete-student', methods=['GET', 'POST'])
# def delete_student():
#     create_form = StudentForm(request.form)
#     if (request.method == 'GET'):
#         id = request.args.get('id')
#         response = setStudent(id, create_form)
#     if (request.method == 'POST'):
#         deleteStudent(create_form.id.data, create_form)
#         return redirect(url_for('students.index_students'))
#     return render_template('delete_student.html', form=response)
