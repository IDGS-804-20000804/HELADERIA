from wtforms import Form, StringField, IntegerField, validators, DateField, DecimalField
from datetime import datetime

class Stock(Form):
     id_stock = IntegerField('id_Stock')
     caducidad = DateField('Caducidad', format='%Y-%m-%d %H:%M:%S', default=datetime.now(),
                          validators=[validators.DataRequired(message='Este campo es requerido')])
     precio = DecimalField('Precio', [
         validators.DataRequired(message='Este campo es requerido')
     ])