from flask import Flask, Blueprint
from flask_cors import CORS
import json
import auth
from users import User
from transactions import Transaction



app = Flask(__name__)
CORS(app)


@app.route('/')
def home():
    return Transaction().test()



@app.route("/new", methods=["GET", "POST"])
def new_trans():
    print("new transaction")
    # return 'new transaction'

    return Transaction().new_transaction()



@app.route("/showall")
def show_all():
    print("get old")
    # return 'get old'
    return Transaction().get_transactions()


# @app.route("/signup", methods=["GET", "POST"])
# def signup():
#     # t = User().SignUp()
#     # print(t)
#     # return 'new user'
#     # return User().SignUp()


# @app.route("/login", methods=["GET", "POST"])
# def login():
#     # t = User().LogIn()
#     # print(t)
#     # return 'login'
#     # return User().LogIn()