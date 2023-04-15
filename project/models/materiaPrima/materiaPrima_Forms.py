from wtforms import Form, StringField, IntegerField, validators,RadioField, SelectField

class MateriaPrima(Form):
    opciones = [("Kilogramos", "Kilogramos"), 
                ("Litros", "Litros"), 
                ("Bolsa", "Bolsa"),
                ("Frasco", "Frasco"),
                ("Gramos", "Gramos"),
                ("Paquete", "Paquete"),
                ("Unidad", "Unidad")
                ]

    id_unidadMedida = IntegerField('idUnidadDeMedida')
    nombre = StringField('Nombre', [
        validators.DataRequired(message='Este campo es requerido')])
    unidadMedida = SelectField("Unidad de Medida", choices=opciones, validators=[validators.DataRequired()])
