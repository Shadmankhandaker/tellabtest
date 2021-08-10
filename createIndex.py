import json 
import pymongo
from pymongo import MongoClient

try:
  connection = MongoClient()
  db = connection.pumpkin
  collection = db.experiment_analytics
  collection.create_index("eid")
  
  collection = db.experiment_comments
  collection.create_index("experimentId")
  
  collection = db.experiment_dislikes
  collection.create_index("experimentId")
  
  collection = db.experiment_likes
  collection.create_index("experimentId")
  
  collection = db.experiment_published
  collection.create_index("paradigm")
  
  collection = db.experiment_saved
  collection.create_index("paradigm")
  
  collection = db.experiment_results
  collection.create_index([("experimentId", pymongo.ASCENDING),("participant", pymongo.ASCENDING)])
  
  collection = db.paradigm
  collection.create_index("shortname")
  
  collection = db.tellabgroup
  collection.create_index("owner")
  
  collection = db.user
  collection.create_index("username")
except Exception as e:
  print e
  
