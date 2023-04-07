from wtforms import Form, StringField, IntegerField, validators

class Empleados(Form):
    id_persona = IntegerField('idPersona')
    id_empleado = IntegerField('idEmpleado')
    id_usuario = IntegerField('idPersona')
    nombre = StringField('Nombre', [
        validators.DataRequired(message='Este campo es requerido')])
    apaterno = StringField('Apellido Paterno', [
        validators.DataRequired(message='Este campo es requerido')])
    amaterno = StringField('Apellido Materno', [
        validators.DataRequired(message='Este campo es requerido')])
    telefono = StringField('Teléfono', [
        validators.DataRequired(message='Este campo es requerido')])
    codigo_postal = StringField('Código Postal', [
        validators.DataRequired(message='Este campo es requerido')])
    numero_interior = StringField('Número Interior', [
        validators.DataRequired(message='Este campo es requerido')])
    numero_exterior = StringField('Número exterior', [
        validators.DataRequired(message='Este campo es requerido')])
    calle = StringField('Calle', [
        validators.DataRequired(message='Este campo es requerido')])
    colonia = StringField('Colonia', [
        validators.DataRequired(message='Este campo es requerido')])
    correo = StringField('Correo', [
        validators.DataRequired(message='Este campo es requerido')])
    contrasenia = StringField('Contraseña', [
        validators.DataRequired(message='Este campo es requerido')])
   
    

# class TeacherForm(Form):
#     id = IntegerField('id')
#     nombre = StringField('nombre', [
#         validators.DataRequired(message='You need to write something')
#     ])
#     apaterno = StringField('apaterno', [
#         validators.DataRequired(message='You need to write something')
#     ])
#     amaterno = StringField('amaterno', [
#         validators.DataRequired(message='You need to write something')
#     ])
#     curp = StringField('curp', [
#         validators.DataRequired(message='You need to write something')
#     ])
#     rfc = StringField('rfc',  [
#         validators.DataRequired(message='You need to write something')
#     ])