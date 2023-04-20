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
    card_number = StringField('Número de Tarjeta', [validators.InputRequired()])
    card_name = StringField('Nombre del Titular', [validators.InputRequired(), validators.Length(min=3, max=35)])
    card_exp_month = IntegerField('Mes de expiración', [validators.InputRequired(), validators.NumberRange(min=1, max=12)])
    card_exp_year = IntegerField('Año de expiracion', [validators.InputRequired(), validators.NumberRange(min=2022, max=2050)])
    card_cvv = StringField('CVV', [validators.InputRequired(), validators.Length(min=3, max=4)])
    