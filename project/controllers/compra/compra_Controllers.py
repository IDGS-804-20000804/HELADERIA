from flask import Blueprint, render_template, redirect, url_for, request, flash
from db.db import get_connection
import models.compra.compra_Forms as forms
from datetime import datetime


compraP= Blueprint('compras', __name__)

@compraP.route('/compras')
def compras():
    create_form=forms.compra(request.form)
    return render_template('compras.html',form=create_form)