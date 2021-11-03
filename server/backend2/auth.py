import pymongo
import dns
import uuid
from flask import request, jsonify

# load_dotenv()

# Mongo_URI = os.getenv('')
client = pymongo.MongoClient("mongodb+srv://catm:9ZUPwpRnnczh094l@cluster0.bazp3.mongodb.net/test?retryWrites=true&w=majority")

# client = pymongo.MongoClient('mongodb+srv://<NAME>:<PASS>@cluster0.bxtpa.mongodb.net/myFirstDatabase?retryWrites=true&w=majority')

db = client.get_database("rocket-coin")## Access our collection
collection = db['transactions'] ## This is for authentication




def new_transaction():
        # print("Information sent to sign up:\t", request.form)
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



def get_transactions():
    vals = {}
    for document in db.collection.find():
        # print(document)
        vals[document['name']] = document['value']
    return jsonify(vals)


# print(get_transactions())