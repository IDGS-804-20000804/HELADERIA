import flask
from flask import Flask, render_template,Blueprint
from flask_wtf.csrf import CSRFProtect
from routes.login.login import login
from routes.clientes.clientes import clientes
from routes.empleados.empleados import empleados
from routes.materiaPrima.materiaPrima import materiaPrima
from routes.registroUsuario.registroUsuario import registroUsuario
from routes.ventas.ventas import ventas
from routes.provedor.provedor import provedor
from routes.recetas.recetas import recetas
from routes.compras.compras import compras
from routes.envio.envio import envio
from routes.main.main import main
from routes.almacen.almacen import almacen
from flask_login import login_required, current_user, UserMixin
from flask_login import LoginManager, login_user, logout_user, login_required
from models.entities.User import UserDatos
from models.logi.ModeloLogin import ModeloLogin


app = flask.Flask(__name__)
csrf = CSRFProtect(app)
app.secret_key = 'DDBHF17I3I2OREBF'


app.config['DEBUG'] = True




def jinja2_enumerate(iterable, start=0):
    return enumerate(iterable, start=start)

app.jinja_env.globals.update(enumerate=jinja2_enumerate)
app.register_blueprint(materiaPrima)
app.register_blueprint(empleados)
app.register_blueprint(registroUsuario)
app.register_blueprint(login)
app.register_blueprint(clientes)
app.register_blueprint(main)
app.register_blueprint(ventas)
app.register_blueprint(provedor)
app.register_blueprint(recetas)
app.register_blueprint(compras)
app.register_blueprint(envio)
app.register_blueprint(almacen)

@app.route('/')
def index():
    return render_template('index.html')




# with app.app_context():
#     sql_alchemy.create_all()
    
# app.register_blueprint(routes_app_students)
# app.register_blueprint(routes_app_teachers)



app.run()
