from wtforms import Form, StringField, IntegerField, validators,RadioField,BooleanField
from wtforms.validators import DataRequired, Length,Email,Regexp
class Empleados(Form):
    opciones_tolerancia = [(1, "Vendedor"), 
                           (2, "Repartidor"), 
                           (3, "Comprador"),
                           (4, "Cliente"),
                           (5, "Gerente"),
                           (6, "Productor"),
                           ]
    id_persona = IntegerField('idPersona')
    id_empleado = IntegerField('idEmpleado')
    id_usuario = IntegerField('idPersona')
    nombre = StringField('Nombre', [
        validators.DataRequired(message='Este campo es requerido'),
        validators.Length(min=4, max=15, message='Este campo debe tener entre 4 y 15 caracteres'),
        validators.Regexp('^[a-zA-Z ]+$', message='Este campo solo debe contener letras y espacios')
    ])
    apaterno = StringField('Apellido Paterno', [
        validators.DataRequired(message='Este campo es requerido'),
        validators.Length(min=4, max=15, message='Este campo debe tener entre 4 y 15 caracteres'),
        validators.Regexp('^[a-zA-Z ]+$', message='Este campo solo debe contener letras y espacios')
    ])
    amaterno = StringField('Apellido Materno', [
        validators.DataRequired(message='Este campo es requerido'),
        validators.Length(min=4, max=15, message='Este campo debe tener entre 4 y 15 caracteres'),
        validators.Regexp('^[a-zA-Z ]+$', message='Este campo solo debe contener letras y espacios')
    ])
    telefono = StringField('Teléfono', [
        validators.DataRequired(message='Este campo es requerido'),
        validators.Length(min=10, max=10, message='El número de teléfono debe tener 10 dígitos'),
        validators.Regexp('^[0-9]+$', message='El número de teléfono debe contener sólo dígitos')
    ])
    codigo_postal = StringField('Código Postal', [
        validators.DataRequired(message='Este campo es requerido'),
        validators.Length(min=5, max=5, message='El código postal debe tener 5 dígitos'),
        validators.Regexp('^[0-9]+$', message='El código postal debe contener sólo dígitos')
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
    rol = RadioField("Rol", choices=opciones_tolerancia, validators=[validators.DataRequired()])
    cbox1 = BooleanField('1')
    cbox2 = BooleanField('2')
    cbox3 = BooleanField('3')
    cbox4 = BooleanField('4')
    cbox5 = BooleanField('5')
    cbox6 = BooleanField('6')
    cbox7 = BooleanField('7')


class FormularioChecklist(Form):
    cbox1 = BooleanField('Administrador')
    cbox2 = BooleanField('Cliente')
    cbox3 = BooleanField('Vendedor')
    cbox4 = BooleanField('Repartidor')
    cbox5 = BooleanField('Comprador')
    cbox6 = BooleanField('Gerente')
    cbox7 = BooleanField('Productor')

formulario = FormularioChecklist()
   