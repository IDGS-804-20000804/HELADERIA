from flask import Blueprint, render_template, request, redirect, url_for
import models.materiaPrima.materiaPrima_Forms as forms

from flask_wtf.csrf import CSRFProtect

# csrf = CSRFProtect()
materiaPrima = Blueprint('materiaPrima', __name__ )

@materiaPrima.route('/materiaPrima')
def materiasPrimas():
     create_form=forms.materiaPrima(request.form)
     return render_template('materiaPrima.html',form=create_form)

