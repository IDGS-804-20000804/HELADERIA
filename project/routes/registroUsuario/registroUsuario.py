from flask import Blueprint, render_template, request, redirect, url_for
from werkzeug.security import check_password_hash,generate_password_hash
from controllers.cliente.cliente_Controllers import insertar_cliente
from flask_wtf.csrf import CSRFProtect
from models.login.forms import LoginForm

# csrf = CSRFProtect()
registroUsuario = Blueprint('registroUsuario', __name__ , url_prefix='/security')


@registroUsuario.route('/registro',methods=['GET','POST'])
def registro():
     create_form = LoginForm()
     return render_template('/security/registro.html', form=create_form)

@registroUsuario.route('/login_post_registro',methods=['GET','POST'])
def logins_recarga():
    if request.method == 'POST':
        nombre = request.form.get('txtNombre', '')
        apaterno = request.form.get('txtApaterno', '')
        amaterno = request.form.get('txtAmaterno', '')
        telefono = request.form.get('txtTelefono', '')
        codigo_postal = request.form.get('txtCodigo_postal', '')
        numero_interior = request.form.get('txtNumero_interior', '')
        numero_exterior = request.form.get('txtNumero_exterior', '')
        calle = request.form.get('txtCalle', '')
        colonia = request.form.get('txtColonia', '')
        correo = request.form.get('txtCorreo', '')
        password = request.form.get('txtPassword', '')
        if (nombre  == '') or (apaterno  == '') or (amaterno  == '') or (telefono  == '') or (codigo_postal  == '') or (numero_exterior  == '') or (calle  == '') or (colonia  == '') or (correo  == '') or (password  == ''):
            create_form = LoginForm()
            return render_template('/security/registro.html',
                                    nombre = nombre,
                                    apaterno = apaterno,
                                    amaterno = amaterno,
                                    telefono = telefono,
                                    codigo_postal = codigo_postal,
                                    numero_interior = numero_interior,
                                    numero_exterior = numero_exterior,
                                    calle = calle,
                                    colonia = colonia,
                                    correo = correo,
                                    password = '',
                                    form=create_form)
        insertar_cliente(nombre,apaterno,amaterno,telefono,codigo_postal,numero_interior,numero_exterior,calle,colonia,correo,generate_password_hash(password))
        return render_template('/security/login.html')
