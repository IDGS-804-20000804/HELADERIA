import flask
from flask import Flask, render_template,Blueprint
from flask_wtf.csrf import CSRFProtect
from routes.login.login import login
from routes.empleados.empleados import empleados
from routes.materiaPrima.materiaPrima import materiaPrima
from routes.registroUsuario.registroUsuario import registroUsuario
from routes.clientes.clientes import clientes



app = flask.Flask(__name__)
app.config['DEBUG'] = True
app.register_blueprint(materiaPrima)
app.register_blueprint(empleados)
app.register_blueprint(registroUsuario)
app.register_blueprint(login)
app.register_blueprint(clientes)
# csrf = CSRFProtect()
# csrf.init_app(app)

# with app.app_context():
#     sql_alchemy.create_all()
    
# app.register_blueprint(routes_app_students)
# app.register_blueprint(routes_app_teachers)

@app.route('/')
def index():
    return render_template('index.html')

app.run()




@app.route('/registro')
def registro():
    return render_template('registro.html')

@app.route('/main')
def main():
    return render_template('inicio.html')

@app.route('/empleados')
def empleados():
    return render_template('empleados.html')

@app.route('/clientes')
def clientes():
    return render_template('clientes.html')
