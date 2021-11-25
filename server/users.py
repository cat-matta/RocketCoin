from flask import jsonify, request, session, redirect
import auth as db
import uuid


class User:
    def __init__(self):
        self.IsLoggedIn = False
    def SignUp(self):
        print("Information sent to sign up:\t", request.form)
        user = {
            "_id": uuid.uuid4().hex,
            "username": request.form.get('username'),
            "email": request.form.get('email'),
            "name": request.form.get('name'),
            "password": request.form.get('password')
        }
        if db.userpass.find_one({"email": user["email"]}) or db.userpass.find_one({"username": user["username"]}):
            print("This username or email already exist\n")
            return jsonify({"error": "Sorry, this email is already in use"}), 400
        else:
            db.userpass.insert_one(
                {"_id": user["_id"],
                 "username": user["username"].lower(),
                 "email": user["email"].lower(),
                 "name": user["name"],
                 "password": user["password"]
                 }
            )
            db.userinfo.insert_one(
                 {"_id": user["_id"],
                 "username": user["username"].lower(),
                 "email": user["email"].lower(),
                 "name": user["name"],
                 "password": user["password"]
                 }
            )
            print("User has been added to database!\n")
            return jsonify({"Success": "You have been added into our system"}), 200

    def LogIn(self):
        print("Information sent to login:\t",request.form)
        user = {

            "username": request.form.get('user'),
            "password": request.form.get('password')
        }
        validate = db.userpass.find_one({"username": user["username"]})
        if(validate == None):
            print("Username not found!\n")
            return jsonify({"error": "Wrong Email or Password"}), 400
        else:
            print("FOUND IT\n")
            IsLoggedIn = True
            if(validate["password"] == user["password"] and validate["username"] == user["username"].lower()):
                print("Valid username and pass!\n")
                self.IsLoggedIn = True
                return jsonify({"Success": "You have logged into our system", "name": validate["name"]}), 200
            else:
                print("Wrong user or pass\n")
                return jsonify({"error": "Wrong Email or Password"}), 400
    
            
        




