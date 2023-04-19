from wtforms import Form, StringField, IntegerField, validators,RadioField, SelectField, DateField

class compra(Form):

    id_compra = IntegerField('idCompra')
    cantidad = StringField('Cantidad', [
        validators.DataRequired(message='Este campo es requerido')])
    precio = StringField('Precio', [
        validators.DataRequired(message='Este campo es requerido')])
    fechaCaducidad  = DateField('Fecha Caducidad ', [
        validators.DataRequired(message='Este campo es requerido')])
