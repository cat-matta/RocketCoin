from flask import jsonify, request, session, redirect
import auth as db
import uuid
# import pymongo
# import routes

class Transaction:
    def new_transaction(self):
        print("Information sent to sign up:\t", request.form)
        user = {
            "_id": uuid.uuid4().hex,
            "value": request.form.get('value'),
            "name": request.form.get('name'),
            }
        db.collection.insert_one({
                    "_id": user["_id"],
                    "value": float(user["value"]),
                    "name": user["name"],
                    # "category": user["category"]
                        })

        return jsonify({"Success": "Added to database"}), 200

    def get_transactions(self):
        vals = {}
        for document in db.collection.find({}):
            print(document)
            vals[document['name']] = document['value']
            # print(vals)
        return jsonify(vals)
# 
    def test(self):
        print('howdy')
        return "test success"


