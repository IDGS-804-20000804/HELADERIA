from flask import Blueprint, render_template, request, redirect, url_for, Request, flash, Flask
from flask_wtf.csrf import CSRFProtect
from db.db import get_connection 
from flask_login import LoginManager,login_user,logged_user,login_required

from models.logi.ModeloLogin import ModeloLogin
from models.entities.User import User 

login = Blueprint('login', __name__, url_prefix='/security')
# login_manager_app=LoginManager(login)

# @login.route('/login', methods=['GET', 'POST'])
# def logins():
#     if request.method == 'POST':
#         db = get_connection()
#         user = User(0, request.form['correo'], request.form['contrasenia'], 1)
#         logued_user = ModeloLogin.inicio(db, user)
#         if logued_user is not None:
#             if logued_user.contrasenia:
#                         login_user(logued_user)
#                         return redirect(url_for('main.mains'))
#             else:
#                 flash("Contraseña Inválida")
#                 return render_template('/security/login.html')
#         else:
#             flash("Usuario No Encontrado")
#             return render_template('/security/login.html')
#     else:
#         return render_template('/security/login.html')




# import flask
# from flask import Blueprint, render_template, request, redirect, url_for,Request,flash,Flask
# from flask_wtf.csrf import CSRFProtect
# from db.db import get_connection 
# from flask_login import login_user
# from models.logi.ModeloLogin import ModeloLogin
# from models.entities.User import User 
# from flask_login import LoginManager, login_user, logout_user, login_required


# login = Blueprint('login', __name__, url_prefix='/security')

# login_manager_app = LoginManager(login)






# @login_manager_app.user_loader
# def load_user(id_usuario):
#      return ModeloLogin.get_by_id(db,id_usuario)



# @login.route('/login',methods=['GET','POST'])
# def logins():
#     db = get_connection() 
#     if request.method == 'POST':
#         # print(request.form['email'])
#         # print(request.form['password'])
#         user = User(0,request.form['correo'],request.form['contrasenia'],1)
#         logued_user = ModeloLogin.inicio(db,user)

#         if logued_user != None:
#             if logued_user.contrasenia:
#                 login_user(logued_user)
#                 return redirect(url_for('main.mains'))
#             else:
#                 flash("Contraseña Ivalida")
#                 return render_template('/security/login.html')
#         else:
#             flash("Usuario No Encontrado")
#             return render_template('/security/login.html')
#     else:
#         return render_template('/security/login.html')

