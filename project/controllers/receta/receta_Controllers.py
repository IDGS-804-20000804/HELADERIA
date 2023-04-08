from flask import Blueprint, render_template, redirect, url_for, request, flash
from db.db import get_connection
import models.receta.receta_Forms as forms


recetaB= Blueprint('recetas', __name__)

@recetaB.route('/recetas')
def receta():
    create_form=forms.receta(request.form)
    return render_template('recetas.html',form=create_form)
