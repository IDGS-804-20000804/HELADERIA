import flask
from flask import redirect, url_for
from flask import Flask, render_template, Blueprint
from flask_wtf.csrf import CSRFProtect
from routes.login.login import login
from routes.clientes.clientes import clientes
from routes.login.login import main
from routes.empleados.empleados import empleados
from routes.materiaPrima.materiaPrima import materiaPrima
from routes.registroUsuario.registroUsuario import registroUsuario
from routes.venta.venta import venta
from routes.provedor.provedor import provedor
from routes.recetas.recetas import recetas
from routes.compras.compras import compras
from routes.envio.envio import envio
from routes.almacen.almacen import almacen
from routes.recetas.recetasModificar import recetasModificar
from flask_security import Security, SQLAlchemyUserDatastore
from models.usuario.usuario import Usuario
from models.rol.rol import Rol
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SECRET_KEY'] = 'DDBHF17I3I2OREBF'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:1029384756-MySQL_root@127.0.0.1/gelatos'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SECURITY_UNAUTHORIZED_VIEW'] = '/login'
app.config['SECURITY_ROLES_ACCEPTED'] = ['Administrador','Cliente','Vendedor','Repartidor','Comprador','Gerente','Productor']
app.config['DEBUG'] = True
csrf = CSRFProtect(app)


db = SQLAlchemy(app)
user_datastore = SQLAlchemyUserDatastore(db, Usuario, Rol)
security = Security(app, user_datastore)

def jinja2_enumerate(iterable, start=0):
    return enumerate(iterable, start=start)

app.jinja_env.globals.update(enumerate=jinja2_enumerate)

app.register_blueprint(materiaPrima)
app.register_blueprint(empleados)
app.register_blueprint(registroUsuario)
app.register_blueprint(login)
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

@app.route('/login',methods=['GET','POST'])
def login_redirect():
    print('/////////')
    return redirect(url_for('login.login_view'))

# with app.app_context():
#     sql_alchemy.create_all()
    
# app.register_blueprint(routes_app_students)
# app.register_blueprint(routes_app_teachers)


if __name__ == '__main__':
    app.run()