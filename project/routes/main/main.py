from flask import Blueprint, render_template, request, redirect, url_for,Request,flash
from flask_wtf.csrf import CSRFProtect
from db.db import get_connection 
from models.logi.ModeloLogin import ModeloLogin
from models.entities.User import User 
from flask_security import current_user

main = Blueprint('main', __name__ )


@main.route('/main')

def mains():
    user_id = current_user.id_usuario
    db = get_connection()
    print(user_id)
    id_usuario = user_id
    Datos = ModeloLogin.get_by_id(db, id_usuario)
    print(Datos)
    return render_template('inicio.html')

