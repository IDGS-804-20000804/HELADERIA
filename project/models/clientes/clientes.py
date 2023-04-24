from wtforms import Form, StringField, IntegerField, validators
from wtforms.validators import DataRequired, Length,Email,Regexp
class Clientes(Form):
    id_persona = IntegerField('idPersona')
    id_cliente = IntegerField('idCliente')
    id_usuario = IntegerField('idUsuario')
    nombre = StringField('Nombre', [
        DataRequired(message='Este campo es requerido'),
        Length(min=4, max=15, message='El nombre debe tener entre 4 y 15 caracteres')
    ])
    apaterno = StringField('Apellido Paterno', [
        DataRequired(message='Este campo es requerido'),
        Length(min=4, max=15, message='El apellido paterno debe tener entre 4 y 15 caracteres')
    ])
    amaterno = StringField('Apellido Materno', [
        DataRequired(message='Este campo es requerido'),
        Length(min=4, max=15, message='El apellido materno debe tener entre 4 y 15 caracteres')
    ])
    telefono = StringField('Teléfono', [
        DataRequired(message='Este campo es requerido'),
        Length(min=10, max=10, message='El número de teléfono debe tener 10 dígitos'),
        Regexp('^[0-9]+$', message='El número de teléfono debe contener sólo dígitos')
    ])
    codigo_postal = StringField('Código Postal', [
        DataRequired(message='Este campo es requerido'),
        Length(min=5, max=5, message='El código postal debe tener 5 dígitos'),
        Regexp('^\d{5}$', message='El código postal debe contener sólo 5 dígitos numéricos')
    ])
    numero_interior = StringField('Número Interior', [
        validators.DataRequired(message='Este campo es requerido')])
    numero_exterior = StringField('Número exterior', [
        validators.DataRequired(message='Este campo es requerido')])
    calle = StringField('Calle', [
        validators.DataRequired(message='Este campo es requerido')])
    colonia = StringField('Colonia', [
        validators.DataRequired(message='Este campo es requerido')])
    correo = StringField('Correo', [
        DataRequired(message='Este campo es requerido'),
        Email(message='Por favor ingrese un correo electrónico válido')
    ])
    contrasenia = StringField('Contraseña', [
        validators.DataRequired(message='Este campo es requerido')])
   