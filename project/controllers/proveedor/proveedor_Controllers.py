from flask import Blueprint, render_template, redirect, url_for, request, flash
from db.db import get_connection
import models.proveedor.proveedor_Forms as forms


proveedorB= Blueprint('provedor', __name__)

@proveedorB.route('/provedor')
def provedor():
    create_form=forms.receta(request.form)
    return render_template('provedor.html',form=create_form)