# import flask
# from flask import Flask, render_template
# from .models.Student import sql_alchemy
# from .db.config import DevelopmentConfig
# from flask_wtf.csrf import CSRFProtect
# from .routes.students.routes import students as routes_app_students
# from .routes.teachers.routes import teachers as routes_app_teachers

# app = flask.Flask(__name__)
# app.config['DEBUG'] = True
# app.config.from_object(DevelopmentConfig)
# csrf = CSRFProtect()
# csrf.init_app(app)
# sql_alchemy.init_app(app)

# with app.app_context():
#     sql_alchemy.create_all()
    
# app.register_blueprint(routes_app_students)
# app.register_blueprint(routes_app_teachers)

# @app.route('/')
# def index():
#     return render_template('index.html')
