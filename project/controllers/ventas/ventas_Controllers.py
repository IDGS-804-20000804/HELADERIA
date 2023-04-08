from flask import Blueprint, render_template, redirect, url_for, request, flash
from db.db import get_connection
import models.receta.receta_Forms as forms


ventasB= Blueprint('ventas', __name__)


@ventasB.route('/ventas')
def ventas():
    return render_template('ventas.html')
