import flask
from flask import Flask, render_template
from flask_wtf.csrf import CSRFProtect
from db.config import DevelopmentConfig


from controllers.empleados import empleados

app=flask.Flask(__name__)
app.config['DEBUG']=True
app.config.from_object(DevelopmentConfig)
csrf = CSRFProtect()

@app.route('/')
def index():
    return render_template('index.html')
# with app.app_context():
#     sql_alchemy.create_all()
    
# app.register_blueprint(routes_app_students)
# app.register_blueprint(routes_app_teachers)
app.register_blueprint(empleados)


@app.route('/login')
def login():
    return render_template('login.html')

@app.route('/registro')
def registro():
    return render_template('registro.html')

@app.route('/main')
def main():
    return render_template('inicio.html')

# @app.route('/empleados')
# def empleados():
#     return render_template('empleados.html')

@app.route('/clientes')
def clientes():
    return render_template('clientes.html')

@app.route('/materiaPrima')
def materiaPrima():
    return render_template('materiaPrima.html')

@app.route('/recetas')
def recetas():
    return render_template('recetas.html')

@app.route('/ventas')
def ventas():
    return render_template('ventas.html')

@app.route('/compras')
def compras():
    return render_template('compras.html')

@app.route('/provedor')
def provedor():
    return render_template('provedor.html')

@app.route('/envio')
def envio():
    return render_template('envio.html')

@app.route('/stock')
def stock():
    return render_template('stock.html')


if __name__=='__main__':
    csrf.init_app(app)
    app.run(port=3000)
