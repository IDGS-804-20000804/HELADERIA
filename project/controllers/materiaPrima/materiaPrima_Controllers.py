from flask import Blueprint, render_template, redirect, url_for, request, flash
from db.db import get_connection
import models.materiaPrima.materiaPrima_Forms as forms
from datetime import datetime


materiaP= Blueprint('materiaPrima', __name__)

@materiaP.route('/materiaPrima')
def materiaPrima():
    create_form=forms.materiaPrima(request.form)
    return render_template('materiaPrima.html',form=create_form)
