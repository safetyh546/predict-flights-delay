#################################################
# import dependencies
#################################################

from matplotlib import style
import matplotlib.pyplot as plt
from pandas import DataFrame
import pandas as pd
import numpy as np
import pandas as pd
import datetime as dt
import sqlalchemy
import random
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy import create_engine, func, desc, distinct
from flask import Flask, jsonify, render_template
from config import password

#################################################
# Database Setup
#################################################
# create engine 
engine = create_engine(f'postgresql://awsreadonly:{password}@aws-pg-db001.cysszasaukhk.us-east-2.rds.amazonaws.com:5432/postgres')
connection = engine.connect()

# reflect an existing database into a new model
Base = automap_base()
# reflect the tables
Base.prepare(engine, reflect=True)

# Save references to each table
flight = Base.classes.flight
airport = Base.classes.airport_top30
#top_tags = Base.classes.top_tags

#################################################
# Flask Setup
#################################################
app = Flask(__name__)
app.config['JSON_SORT_KEYS'] = False

@app.route("/")
@app.route("/Index")
def Index():
    return render_template("Index.html")

@app.route("/Model")
def Model():
    return render_template("Model.html")

@app.route("/Model2")
def Model2():
    return render_template("Model2.html")

@app.route("/Tableau")
def Tableau():
    return render_template("Tableau.html")

@app.route("/Tableau2")
def Tableau2():
    return render_template("Tableau2.html")

@app.route("/DataPage")
def DataPage():
    return render_template("DataPage.html")

@app.route("/Map")
def Map():
    return render_template("Map.html")

@app.route("/ContactUs")
def ContactUs():
    return render_template("contactus.html")
    
#, methods=['POST']
@app.route("/Results" )
def Results():
    """Renders the result  page."""
    random_bit = random.getrandbits(1) 

    if int(random_bit)== 1: 
        prediction ='you are likely to be delayed'
    else: 
        prediction ='You should be all good'
        return render_template("Results.html",
        
             prediction = prediction
             ) 




@app.route("/Flights/<Year>")
def Flights(Year):
    session = Session(engine)
    FlightCount = session.query(flight.op_carrier_airline,func.count(flight.flightid),func.sum(flight.arr_del15)).filter(flight.year == Year).filter(flight.cancelled == 0).filter(flight.diverted == 0).group_by(flight.op_carrier_airline).order_by(desc(func.count(flight.flightid))).all()
    Flight_Dict_list = []
    for b,ct,s in FlightCount:
        FlightDict = {}
        FlightDict["Airline"] = b
        FlightDict["FlightCount"] = ct
        FlightDict["PercentDelayed"] = round(float(s/ct)*100,2)
        Flight_Dict_list.append(FlightDict)
    session.close()  
    return jsonify(Flight_Dict_list)

@app.route("/Airlines")
def Airlines():
    session = Session(engine)
    Airline = session.query(flight.op_carrier_airline,flight.op_carrier).group_by(flight.op_carrier_airline,flight.op_carrier).order_by(flight.op_carrier_airline).all()
    Airline_Dict_list = []
    for a,c in Airline:
        AirlineDict = {}
        AirlineDict["Airline"] = a
        AirlineDict["Airlines Code"] = c
        Airline_Dict_list.append(AirlineDict)
    session.close()  
    return jsonify(Airline_Dict_list)

@app.route("/AirportDropDown")
def AirportDropDown():
    session = Session(engine)
    AP = session.query(airport.iata+"-"+airport.airport).order_by(airport.iata+"-"+airport.airport).all()
    AP_list = []
    for r in AP:
        AP_list.append(r[0])
    session.close()  

    return jsonify(AP_list)

@app.route("/AirlineDropDown")
def AirlineDropDown():
    session = Session(engine)
    AL = session.query(flight.op_carrier_airline).group_by(flight.op_carrier_airline).order_by(flight.op_carrier_airline).all()
    AL_list = []
    for a in AL:
        AL_list.append(a[0])
    session.close()  

    return jsonify(AL_list)



# @app.route('/results/<Airline>/<Time>') 
# def results(Airline,Time): 
#     """Renders the result  page."""
#     random_bit = random.getrandbits(1) 

#     if int(random_bit)== 1: 
#         prediction ='you are likely to be delayed'
#     else: 
#         prediction ='You should be all good'
#     return prediction               
#     # return render_template("results.html",
            
#     #          prediction = prediction
#     #          ) 

# @app.route('/Results', methods=['GET', 'POST'])
# def Results():
#     random_bit = random.getrandbits(1) 
#     Airline = 'Southwest Airline'
#     Origin = 'ATL'
#     Destination = 'DFW'


#     if Flask.request.method == 'GET':
#         return(Flask.render_template('Model.html'))
#     if Flask.request.method == 'POST':
#         if int(random_bit)== 1: 
#             prediction ='you are likely to be delayed'
#         else:
#             prediction ='You should be all good'
#             return jsonify(Airline)
#         # return Flask.render_template('Model.html',
#         #                              original_input={'Airline':Airline,
#         #                                              'Origin Airport':Origin,
#         #                                              'Destination Airport':Destination},
#         #                              result=prediction,
#         #                              )

if __name__ == "__main__":
    app.run(debug=True)        