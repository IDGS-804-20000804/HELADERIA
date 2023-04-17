from flask import Blueprint, render_template, request, redirect, url_for,Request,flash
from flask_wtf.csrf import CSRFProtect
from db.db import get_connection 

from models.logi import ModeloLogin
from models.entities import User

login = Blueprint('login', __name__, url_prefix='/security')
main = Blueprint('main',__name__, url_prefix='/security')



@login.route('/login',methods=['GET','POST'])
def logins():
    db = get_connection() 
    if request.method == 'POST':
        # print(request.form['email'])
        # print(request.form['password'])
        user = User(0,request.form['email'],request.form['password'],1)
        logued_user = ModeloLogin.inicio(db,user)
        if logued_user != None:
            if logued_user.password:
                return redirect(url_for('main'))
            else:
                flash("Contraseña Ivalida")
                return render_template('/security/login.html')
        else:
            flash("Usuario No Encontrado")
            return render_template('/security/login.html')
    else:
        return render_template('/security/login.html')


@main.route('/main')
def mains():
    return render_template('inicio.html')

