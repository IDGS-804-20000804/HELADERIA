from flask import Blueprint, render_template, request, redirect, url_for

from flask_wtf.csrf import CSRFProtect


envio = Blueprint('envio', __name__ )


@envio.route('/envio')
def envios():
    
     return render_template('envio.html')

