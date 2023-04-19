from flask import Blueprint, render_template, request, redirect, url_for,Request,flash
from flask_wtf.csrf import CSRFProtect
from db.db import get_connection 
from models.logi.ModeloLogin import ModeloLogin
from models.entities.User import User 


main = Blueprint('main', __name__ )


@main.route('/main')

def mains():
    return render_template('inicio.html')

