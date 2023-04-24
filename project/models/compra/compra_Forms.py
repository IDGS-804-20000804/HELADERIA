from wtforms import Form, StringField, IntegerField, validators,RadioField, SelectField, DateField

class compra(Form):

    id_compra = IntegerField('idCompra')
    cantidad = StringField('Cantidad', [
        validators.DataRequired(message='Este campo es requerido'),
        validators.Regexp('^[0-9]+(\.[0-9]{1,2})?$', message="Ingrese un número válido.")
    ])
    precio = StringField('Precio', [
        validators.DataRequired(message='Este campo es requerido'),
        validators.Regexp('^[0-9]+(\.[0-9]{1,2})?$', message="Ingrese un número válido.")
    ])
    fechaCaducidad  = DateField('Fecha Caducidad ', [
        validators.DataRequired(message='Este campo es requerido')])
