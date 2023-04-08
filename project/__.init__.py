import flask
from flask import Flask, render_template
from flask_wtf.csrf import CSRFProtect
from db.config import DevelopmentConfig

#Importaciones de los contraladores
from controllers.empleados import empleados
from controllers.materiaPrima.materiaPrima_Controllers import materiaP
from controllers.receta.receta_Controllers import recetaB
from controllers.ventas.ventas_Controllers import ventasB
from controllers.proveedor.proveedor_Controllers import proveedorB
from controllers.compra.compra_Controllers import compraP
from controllers.envio.envio_Controllers import envioP
from controllers.stock.stock_Controllers import stockB


app=flask.Flask(__name__)
app.config['DEBUG']=True
app.config.from_object(DevelopmentConfig)
csrf = CSRFProtect()

@app.route('/')
def index():
    return render_template('index.html')

#Llamada de blueprint para traer la información
app.register_blueprint(empleados)
app.register_blueprint(materiaP)
app.register_blueprint(recetaB)
app.register_blueprint(ventasB)
app.register_blueprint(proveedorB)
app.register_blueprint(compraP)
app.register_blueprint(envioP)
app.register_blueprint(stockB)


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

# @app.route('/materiaPrima')
# def materiaPrima():
#     return render_template('materiaPrima.html')

# @app.route('/recetas')
# def recetas():
#     return render_template('recetas.html')

# @app.route('/ventas')
# def ventas():
#     return render_template('ventas.html')

# @app.route('/compras')
# def compras():
#     return render_template('compras.html')

# @app.route('/provedor')
# def provedor():
#     return render_template('provedor.html')

# @app.route('/envio')
# def envio():
#     return render_template('envio.html')

# @app.route('/stock')
# def stock():
#     return render_template('stock.html')


if __name__=='__main__':
    csrf.init_app(app)
    app.run(port=3000)
