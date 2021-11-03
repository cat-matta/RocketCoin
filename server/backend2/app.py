from flask import Flask, Blueprint
from flask_cors import CORS
from auth import get_transactions, new_transaction
import json
import flask





app = Flask(__name__)
CORS(app)


@app.route('/new', methods=['GET','POST'])
def new_trans():
    # t = User().SignUp()
    # print(t)
    
    return new_transaction()

@app.route('/showall')
def show_all():
	return get_transactions()