from flask import Blueprint, render_template, request, redirect, url_for,Request,flash
from flask_wtf.csrf import CSRFProtect
from db.db import get_connection 
from controllers.cliente.cliente_Controllers import insertar_cliente
from models.login.ModeloLogin import ModeloLogin
from models.login.forms import LoginForm
from models.entities.User import User 
from flask_security import login_required

login = Blueprint('login', __name__, url_prefix='/security')
main = Blueprint('main',__name__)


@login.route('/login_post_registro',methods=['GET','POST'])
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
                                    password = password,
                                    form=create_form)
        insertar_cliente(nombre,apaterno,amaterno,telefono,codigo_postal,numero_interior,numero_exterior,calle,colonia,correo,password)
        return render_template('/security/login.html')


@login.route('/login',methods=['GET','POST'])
def login_view():
    db = get_connection()
    create_form = LoginForm()
    if request.method == 'POST':
        correo = request.form.get('correo', '')
        contrasenia = request.form.get('contrasenia', '')
        if (correo  == '') or (contrasenia  == ''):
            return render_template('/security/login.html',
                                    form=create_form)
        logued_user = ModeloLogin.inicio(correo, contrasenia)
        if logued_user != None:
            return redirect(url_for('main.mains'))
        else:
            flash("Correo o contraseña no coincide")
            return render_template('/security/login.html',
                                form=create_form)
    return render_template('/security/login.html',
                                    form=create_form)

@main.route('/main',methods=['GET','POST'])
@login_required
def mains():
    return render_template('inicio.html')