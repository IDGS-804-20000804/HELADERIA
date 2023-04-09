from wtforms import Form, StringField, IntegerField, validators,RadioField, SelectField, DateField

class stock(Form):
    opciones = [("1", ""), 
                ("2", ""), 
                ]

    id_stock = IntegerField('idStock')
    receta = SelectField("Receta", choices=opciones, validators=[validators.DataRequired()])
    numReceta = StringField('Número de recetas ha realizar', [
        validators.DataRequired(message='Este campo es requerido')])
