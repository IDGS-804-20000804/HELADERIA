from wtforms import Form, StringField, IntegerField, validators,RadioField, SelectField, DateField

class Envio(Form):
    opciones = [("1", ""), 
                ("2", ""), 
                ]

    id_envio = IntegerField('idEnvio')
    empleado = SelectField("Empleado", choices=opciones, validators=[validators.DataRequired()])
    fechaEnvio = DateField('Fecha de envio', [
        validators.DataRequired(message='Este campo es requerido')])
