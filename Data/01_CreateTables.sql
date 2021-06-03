

/*

Drop table if exists airport;
Drop table if exists airline;
Drop table if exists flight_stage;
Drop table if exists flight;

*/


CREATE TABLE airport (
    IATA varchar(100) PRIMARY KEY
   , ICAO varchar(100) 
   , Airport varchar(1000)
   , Location 	  VARCHAR(1000)  
   , Timezone varchar(100)
   , Season	varchar(100)
);

CREATE TABLE airline (
    IATA varchar(5) PRIMARY KEY
   , ICAO varchar(5)
   , Airline 	  VARCHAR(1000)  
	
);

CREATE TABLE flight_stage (
DAY_OF_MONTH int
,DAY_OF_WEEK int
,OP_UNIQUE_CARRIER varchar(1000)
,OP_CARRIER_AIRLINE_ID int
,OP_CARRIER varchar(1000)
,TAIL_NUM varchar(1000)
,OP_CARRIER_FL_NUM int
,ORIGIN_AIRPORT_ID int 
,ORIGIN_AIRPORT_SEQ_ID int
,ORIGIN varchar(1000)
,DEST_AIRPORT_ID int
,DEST_AIRPORT_SEQ_ID int
,DEST varchar(1000)
,DEP_TIME varchar(10)
,DEP_DEL15 numeric
,DEP_TIME_BLK varchar(1000)
,ARR_TIME varchar(10)
,ARR_DEL15 numeric
,CANCELLED numeric
,DIVERTED numeric
,DISTANCE numeric

);

CREATE TABLE flight(
FlightID Serial PRIMARY KEY
,DAY_OF_MONTH int
,DAY_OF_WEEK int
,OP_UNIQUE_CARRIER varchar(1000)
,OP_CARRIER_AIRLINE_ID int
,OP_CARRIER varchar(1000)
,TAIL_NUM varchar(1000)
,OP_CARRIER_FL_NUM int
,ORIGIN_AIRPORT_ID int 
,ORIGIN_AIRPORT_SEQ_ID int
,ORIGIN varchar(1000)
,DEST_AIRPORT_ID int
,DEST_AIRPORT_SEQ_ID int
,DEST varchar(1000)
,DEP_TIME varchar(10)
,DEP_DEL15 int
,DEP_TIME_BLK varchar(1000)
,ARR_TIME varchar(10)
,ARR_DEL15 int
,CANCELLED int
,DIVERTED int
,DISTANCE int

,ORIGIN_Airport varchar(1000)
,DEST_Airport varchar(1000)
,OP_CARRIER_AIRLINE	 varchar(1000)
,YEAR int	
);

