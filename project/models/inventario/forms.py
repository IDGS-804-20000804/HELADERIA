from wtforms import Form, StringField, IntegerField, validators

class inventarioForm(Form):
     id = IntegerField('id')
     nombre = StringField('nombre', [
         validators.DataRequired(message='You need to write something')
     ])
     apellidos = StringField('aPaterno', [
         validators.DataRequired(message='You need to write something')
     ])
     estatura = StringField('aMaterno', [
         validators.DataRequired(message='You need to write something')
     ])
     edad = StringField('Edad', [
         validators.DataRequired(message='You need to write something')
     ])
     correo = StringField('correo', [
         validators.DataRequired(message='You need to write something')
     ])
     numeroCelular = StringField('numeroCel', [
         validators.DataRequired(message='You need to write something')
    ])