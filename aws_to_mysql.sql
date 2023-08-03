CREATE DATABASE gans_aws;
USE gans_aws;

-- create a new table (city) to contain the different cities' info
create table city(
				  city_id 		  int auto_increment,
                  city			  varchar(50),
                  country	 	  varchar(50),
                  population	  int,
                  latitude		  float,
                  longitude       float,
                  
				  primary key(city_id)
                  );

select * from city;

-- create another new table(weather) 
-- it contains the weather information from different cities
-- add a foreign key that is the primary key in weather table
create table weather(
					weather_id 		 int auto_increment,
					city_id 		 int,
                    Forecast_time 	 datetime,
					Weather_desc 	 varchar(50),
                    Temperature		 float,
                    Rain_probability float,
                    Humidity		 int,
                    
					primary key (weather_id),
					foreign key (city_id) references city(city_id)
                    );
select * from weather;



-- create airport_icao table to contant airport infomation
create table icao(
					city_id        int,
					icao		   varchar(25),
					airport_name   varchar(255),
                         
					primary key (icao),
					foreign key (city_id) references city(city_id)
				  );

-- add values in the airport_icao table
insert into icao(city_id,  icao   ,  airport_name)
values          (   1   ,  "EDDB" ,	 'Berlin Brandenburg Airport'     ),
				(   3   ,  "EDDK" ,	 'Cologne Bonn Airport'           );

select * from icao;



-- create another new table(flight_schedule) 
-- it contains the flights information at Berlin Brandenburg Airport
-- add a foreign key that is the primary key in airport_icao table
create table flight(
					flight_id 		 	 int auto_increment,
					arrival_icao 	 	 varchar(25),
					flight_number 	 	 varchar(50),
					airline 		 	 varchar(50),
					arrival_terminal 	 int,
					arrival_time_local 	 datetime,
					departure_icao 	 	 varchar(25),
					departure_city		 varchar(50),
					departure_time_local datetime,
					data_retrieved_on	 datetime,
                    
					primary key (flight_id),
					foreign key (arrival_icao) references icao(icao)
					);

select * from flight;