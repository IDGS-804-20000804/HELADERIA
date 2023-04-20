from flask_wtf import FlaskForm
from wtforms import Form, StringField, IntegerField, validators, RadioField, SelectField, DateField

class LoginForm(FlaskForm):
     numeroCelular = StringField('numeroCel', [
         validators.DataRequired(message='You need to write something')
    ])