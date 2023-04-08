from wtforms import Form, StringField, IntegerField, validators,RadioField, SelectField, FileField

class receta(Form):
    id_Receta = IntegerField('idReceta')
    nombre = StringField('Nombre', [
        validators.DataRequired(message='Este campo es requerido')])
    cantidad = StringField('Cantidad', [
        validators.DataRequired(message='Este campo es requerido')])
    foto = FileField('Foto', [
        validators.DataRequired(message='Este campo es requerido')])
    precio=StringField('Precio', [
        validators.DataRequired(message='Este campo es requerido')])

