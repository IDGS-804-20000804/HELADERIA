from flask import Blueprint, render_template, redirect, url_for, request, flash
from db.db import get_connection
import models.stock.stock_Forms as forms
from datetime import datetime


stockB= Blueprint('stock', __name__)

@stockB.route('/stock')
def stock():
    create_form=forms.stock(request.form)
    return render_template('stock.html',form=create_form)
