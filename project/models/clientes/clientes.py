from wtforms import Form, StringField, IntegerField, validators

class Clientes(Form):
    id_persona = IntegerField('idPersona')
    id_empleado = IntegerField('idCliente')
    id_usuario = IntegerField('idUsuario')
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
   