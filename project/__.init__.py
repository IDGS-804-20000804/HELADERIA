import flask
from flask import Flask, render_template,Blueprint
from flask_wtf.csrf import CSRFProtect
from routes.empleados.empleados import empleados
from routes.materiaPrima.materiaPrima import materiaPrima

app = flask.Flask(__name__)
app.config['DEBUG'] = True
app.register_blueprint(materiaPrima)
app.register_blueprint(empleados)

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
