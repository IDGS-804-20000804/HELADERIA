from wtforms import Form, StringField, IntegerField, validators,RadioField, SelectField

class MateriaPrima(Form):
    opciones = [("1", "1kg"), 
                ("2", "2kg"), 
                ("3", "3kg"),
                ("4", "4kg"),
                ("5", "5kg"),
                ("6", "6kg"),
                ("7", "7kg"),
                ("8", "8kg"),
                ("9", "9kg"),
                ("10", "10kg")
                ]

    id_unidadMedida = IntegerField('idUnidadDeMedida')
    nombre = StringField('Nombre', [
        validators.DataRequired(message='Este campo es requerido')])
    unidadMedida = SelectField("Unidad de Medida", choices=opciones, validators=[validators.DataRequired()])
