/*
Change the Year you're inserting based on what's in the flight_stage table
*/


insert into flight(
Year
,DAY_OF_MONTH
,DAY_OF_WEEK
,OP_UNIQUE_CARRIER
,OP_CARRIER_AIRLINE_ID
,OP_CARRIER
,TAIL_NUM
,OP_CARRIER_FL_NUM
,ORIGIN_AIRPORT_ID
,ORIGIN_AIRPORT_SEQ_ID
,ORIGIN
,DEST_AIRPORT_ID
,DEST_AIRPORT_SEQ_ID
,DEST
,DEP_TIME
,DEP_DEL15
,DEP_TIME_BLK
,ARR_TIME
,ARR_DEL15
,CANCELLED
,DIVERTED
,DISTANCE
,ORIGIN_Airport
,DEST_Airport
,OP_CARRIER_AIRLINE
)
select 
2020
,DAY_OF_MONTH
,DAY_OF_WEEK
,OP_UNIQUE_CARRIER
,OP_CARRIER_AIRLINE_ID
,OP_CARRIER
,TAIL_NUM
,OP_CARRIER_FL_NUM
,ORIGIN_AIRPORT_ID
,ORIGIN_AIRPORT_SEQ_ID
,ORIGIN
,DEST_AIRPORT_ID
,DEST_AIRPORT_SEQ_ID
,DEST
,DEP_TIME
,cast(DEP_DEL15 as int)
,DEP_TIME_BLK
,ARR_TIME
,cast(ARR_DEL15 as int)
,cast(CANCELLED as int)
,cast(DIVERTED as int)
,cast(DISTANCE as int)
, o.airport as ORIGIN_Airport
, d.airport as DEST_Airport
, a.airline as OP_CARRIER_AIRLINE

from flight_stage f
left join airport o on f.origin = o.iata
left join airport d on f.dest = d.iata
left join airline a on f.op_unique_carrier = a.iata








/*
truncate table flight_stage
truncate table flight;

select * from flight where year= 2020 limit 1000
select * from flight_stage where op_unique_carrier <> op_carrier limit 100
select distinct op_unique_carrier from flight_stage limit 100
select count(*) from flight_stage f left join airport a on f.origin = a.iata where a.airport is null
select count(*) from flight_stage f left join airline a on f.op_unique_carrier = a.iata where a.airline is null
select * from airport limit 1000



select distinct f.origin
from flight f 
left join airport a on f.origin = a.iata
where a.airport is null
union
select distinct f.dest
from flight f 
left join airport a on f.dest = a.iata
where a.airport is null

select count(*) from flight where OP_CARRIER_AIRLINE is null

select OP_CARRIER_AIRLINE,count(*) from flight  group by OP_CARRIER_AIRLINE

select distinct dep_time from flight_stage
*/
