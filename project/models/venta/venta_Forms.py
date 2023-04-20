from flask_wtf import FlaskForm
from wtforms import StringField, IntegerField

from wtforms import Form, StringField, IntegerField, validators,RadioField, SelectField, DateField

class Venta(FlaskForm):
    opciones = [("1", ""), 
                ("2", ""), 
                ]

    id_envio = IntegerField('idEnvio')
    empleado = SelectField("Empleado", choices=opciones, validators=[validators.DataRequired()])
    fechaEnvio = DateField('Fecha de venta', [
        validators.DataRequired(message='Este campo es requerido')])
