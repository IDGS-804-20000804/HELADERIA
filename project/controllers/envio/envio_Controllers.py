from flask import Blueprint, render_template, redirect, url_for, request, flash
from db.db import get_connection
import models.envio.envio_Forms as forms
from datetime import datetime


envioP= Blueprint('envio', __name__)

@envioP.route('/envio')
def envio():
    create_form=forms.envio(request.form)
    return render_template('envio.html',form=create_form)