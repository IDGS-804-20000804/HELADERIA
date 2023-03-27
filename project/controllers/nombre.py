# from ..models.Student import sql_alchemy, Students


# def setStudent(id, create_form):
#     student = sql_alchemy.session.query(
#         Students).filter(Students.id == id).first()
#     create_form.id.data = student.id
#     create_form.nombre.data = student.nombre
#     create_form.apellidos.data = student.apellidos
#     create_form.estatura.data = student.estatura
#     create_form.edad.data = student.edad
#     create_form.correo.data = student.correo

#     return create_form


# def updateStudent(id, create_form):
#     student = sql_alchemy.session.query(
#         Students).filter(Students.id == id).first()
#     student.nombre = create_form.nombre.data
#     student.apellidos = create_form.apellidos.data
#     student.estatura = create_form.estatura.data
#     student.edad = create_form.edad.data
#     student.correo = create_form.correo.data
#     sql_alchemy.session.add(student)
#     sql_alchemy.session.commit()


# def deleteStudent(id, create_form):
#     student = sql_alchemy.session.query(
#         Students).filter(Students.id == id).first()
#     student.nombre = create_form.nombre.data
#     student.apellidos = create_form.apellidos.data
#     student.estatura = create_form.estatura.data
#     student.edad = create_form.edad.data
#     student.correo = create_form.correo.data
#     sql_alchemy.session.delete(student)
#     sql_alchemy.session.commit()


# def insertStudent(create_form):
#     student = Students(nombre=create_form.nombre.data, apellidos=create_form.apellidos.data,
#                        estatura=create_form.estatura.data, edad=create_form.edad.data, correo=create_form.correo.data)
#     sql_alchemy.session.add(student)
#     sql_alchemy.session.commit()
