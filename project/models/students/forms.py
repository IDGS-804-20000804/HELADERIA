from wtforms import Form, StringField, IntegerField, validators

class StudentForm(Form):
    id = IntegerField('id')
    nombre = StringField('nombre', [
        validators.DataRequired(message='You need to write something')
    ])
    apellidos = StringField('apellidos', [
        validators.DataRequired(message='You need to write something')
    ])
    estatura = StringField('estatura', [
        validators.DataRequired(message='You need to write something')
    ])
    edad = StringField('edad', [
        validators.DataRequired(message='You need to write something')
    ])
    correo = StringField('correo', [
        validators.DataRequired(message='You need to write something')
    ])

class TeacherForm(Form):
    id = IntegerField('id')
    nombre = StringField('nombre', [
        validators.DataRequired(message='You need to write something')
    ])
    apaterno = StringField('apaterno', [
        validators.DataRequired(message='You need to write something')
    ])
    amaterno = StringField('amaterno', [
        validators.DataRequired(message='You need to write something')
    ])
    curp = StringField('curp', [
        validators.DataRequired(message='You need to write something')
    ])
    rfc = StringField('rfc',  [
        validators.DataRequired(message='You need to write something')
    ])