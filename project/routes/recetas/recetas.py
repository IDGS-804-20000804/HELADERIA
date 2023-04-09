from flask import Blueprint, render_template, request, redirect, url_for


recetas = Blueprint('recetas', __name__ )

@recetas.route('/recetas')
def receta():
     
     return render_template('recetas.html')

