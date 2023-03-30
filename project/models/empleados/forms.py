from wtforms import Form, StringField, IntegerField, validators, SubmitField, Field, FormField, SelectField, RadioField
from wtforms import Form, validators
from flask_wtf import FlaskForm
from wtforms.fields import EmailField

class EmpleadoForm(Form):
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