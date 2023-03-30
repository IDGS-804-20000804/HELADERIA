import flask
from flask import Flask, render_template
from flask_wtf.csrf import CSRFProtect

app = flask.Flask(__name__)
app.config['DEBUG'] = True
csrf = CSRFProtect()
csrf.init_app(app)

# with app.app_context():
#     sql_alchemy.create_all()
    
# app.register_blueprint(routes_app_students)
# app.register_blueprint(routes_app_teachers)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login')
def login():
    return render_template('login.html')

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


if __name__=='__main__':
    csrf.init_app(app)
    app.run(port=3000)
