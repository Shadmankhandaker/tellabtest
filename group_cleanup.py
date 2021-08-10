import json 
import pymongo
import datetime
from pymongo import MongoClient
from bson.objectid import ObjectId
from datetime import datetime, timedelta

try:
  connection = MongoClient()
  db = connection.pumpkin
  collection = db.tellabgroup
  now = datetime.now()
  print now
  collection.update({"end" : { "$lt": now }}, { "$set": { "status": "close" }}, upsert=False, multi=True)
except Exception as e:
  print e