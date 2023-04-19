from wtforms import Form, StringField, IntegerField, validators,RadioField, SelectField

class MateriaPrima(Form):
    opciones = [("", "Selecciona la unidad de medida"), ('Kilogramos', "Kilogramos"), 
                ("Gramos", "Gramos"), 
                ("Litros", "Litros"),
                ("Mililitros", "Mililitros"),
                ("Saco", "Saco"),
                ("Bolsa", "Bolsa"),
                ("Paquete", "Paquete"),
                ("Cartón", "Cartón"),
                ("Frasco", "Frasco"),
                ("Unidad", "Unidad")
                ]
    opcionesGuardar = [("", "Selecciona la unidad de medida"), ('1', "Kilogramos"), 
                ('2', "Gramos"), 
                ('3', "Litros"),
                ('4', "Mililitros"),
                ('5', "Saco"),
                ('6', "Bolsa"),
                ('7', "Paquete"),
                ('8', "Cartón"),
                ('9', "Frasco"),
                ('10', "Unidad")
                ]

    id_unidadMedida = IntegerField('idUnidadDeMedida')
    nombre = StringField('Nombre', [
        validators.DataRequired(message='Este campo es requerido')])
    unidadMedida = SelectField("Unidad de Medida", choices=opciones, validators=[validators.DataRequired()])
    unidadMedidaGuardar = SelectField("Unidad de Medida", choices=opcionesGuardar, validators=[validators.DataRequired()])
