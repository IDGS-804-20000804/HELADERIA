import flask
from flask import Flask, render_template, Blueprint,request, redirect, url_for, Request, flash, Flask
from flask_wtf.csrf import CSRFProtect
from routes.clientes.clientes import clientes
from routes.empleados.empleados import empleados
from routes.materiaPrima.materiaPrima import materiaPrima
from routes.registroUsuario.registroUsuario import registroUsuario
from routes.venta.venta import venta
from routes.provedor.provedor import provedor
from routes.recetas.recetas import recetas
from routes.compras.compras import compras
from routes.envio.envio import envio
from routes.main.main import main
from routes.almacen.almacen import almacen
from routes.recetas.recetasModificar import recetasModificar
from routes.stock.stock import stock
from flask_login import login_required, current_user, UserMixin
from flask_login import LoginManager, login_user, logout_user, login_required
from models.entities.User import UserDatos
from db.db import get_connection 

from models.entities.User import User 
from models.login.ModeloLogin import ModeloLogin

app = Flask(__name__)
csrf = CSRFProtect(app)


login_manager_app=LoginManager(app)

app.config['DEBUG'] = True
app.config['SECRET_KEY'] = 'DDBHF17I3I2OREBF'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:12345678@127.0.0.1/gelatos'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SECURITY_ROLES_ACCEPTED'] = ['Administrador','Cliente','Vendedor','Repartidor','Comprador','Gerente','Productor']


def jinja2_enumerate(iterable, start=0):
    return enumerate(iterable, start=start)

app.jinja_env.globals.update(enumerate=jinja2_enumerate)
app.register_blueprint(materiaPrima)
app.register_blueprint(empleados)
app.register_blueprint(registroUsuario)
app.register_blueprint(clientes)
app.register_blueprint(main)
app.register_blueprint(venta)
app.register_blueprint(provedor)
app.register_blueprint(recetas)
app.register_blueprint(compras)
app.register_blueprint(envio)
app.register_blueprint(almacen)
app.register_blueprint(recetasModificar)
app.register_blueprint(stock)

@app.route('/')
def index():
    return render_template('index.html')


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        db = get_connection()
        user = User(0, request.form['correo'], request.form['contrasenia'], 1)
        logged_user = ModeloLogin.inicio(db, user)
       
        if logged_user is not None:
            if logged_user.contrasenia:
                        login_user(logged_user)
                        return redirect(url_for('main.mains'))
            else:
                flash("Contraseña Inválida")
                return render_template('/security/login.html')
        else:
            flash("Usuario No Encontrado")
            return render_template('/security/login.html')
    else:
        return render_template('/security/login.html')

@app.route("/logout")
def logout():
    logout_user()
    return redirect('/')

def status_401(error):
    return redirect(url_for('index'))

def status_404(error):
    return "<h1> Pagina no Encontrada<h1>",404

@login_manager_app.user_loader
def load_user(id_usuario):
    db = get_connection()
    return ModeloLogin.get_by_id(db, id_usuario)

if __name__ == '__main__':
    
    app.register_error_handler(401,status_401)
    app.register_error_handler(404,status_404)
    app.run()