from wtforms import Form, StringField, IntegerField, validators,RadioField, SelectField

class compra(Form):
    opciones = [("1", ""), 
                ("2", ""), 
                ]

    id_compra = IntegerField('idCompra')
    provedor = SelectField("Unidad de Medida", choices=opciones, validators=[validators.DataRequired()])
    materiaPrima = StringField('Materia Prima', [
        validators.DataRequired(message='Este campo es requerido')])
    cantidad = StringField('Cantidad', [
        validators.DataRequired(message='Este campo es requerido')])
    precio = StringField('Precio', [
        validators.DataRequired(message='Este campo es requerido')])
    fechaCaducidad  = StringField('Fecha Caducidad ', [
        validators.DataRequired(message='Este campo es requerido')])
