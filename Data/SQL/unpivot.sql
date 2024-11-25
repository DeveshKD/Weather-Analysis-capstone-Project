CREATE VIEW humidity_unpivoted AS (
	SELECT datetime, 'Vancouver' as city, Vancouver as humidity FROM humidity
UNION ALL
SELECT datetime, 'Portland', Portland FROM humidity
UNION ALL
SELECT datetime, 'San Francisco', `San Francisco` FROM humidity
UNION ALL
SELECT datetime, 'Seattle', Seattle FROM humidity
UNION ALL
SELECT datetime, 'Los Angeles', `Los Angeles` FROM humidity
UNION ALL
SELECT datetime, 'San Diego', `San Diego` FROM humidity
UNION ALL
SELECT datetime, 'Las Vegas', `Las Vegas` FROM humidity
UNION ALL
SELECT datetime, 'Phoenix', Phoenix FROM humidity
UNION ALL
SELECT datetime, 'Albuquerque', Albuquerque FROM humidity
UNION ALL
SELECT datetime, 'Denver', Denver FROM humidity
UNION ALL
SELECT datetime, 'San Antonio', `San Antonio` FROM humidity
UNION ALL
SELECT datetime, 'Dallas', Dallas FROM humidity
UNION ALL
SELECT datetime, 'Houston', Houston FROM humidity
UNION ALL
SELECT datetime, 'Kansas City', `Kansas City` FROM humidity
UNION ALL
SELECT datetime, 'Minneapolis', Minneapolis FROM humidity
UNION ALL
SELECT datetime, 'Saint Louis', `Saint Louis` FROM humidity
UNION ALL
SELECT datetime, 'Chicago', Chicago FROM humidity
UNION ALL
SELECT datetime, 'Nashville', Nashville FROM humidity
UNION ALL
SELECT datetime, 'Indianapolis', Indianapolis FROM humidity
UNION ALL
SELECT datetime, 'Atlanta', Atlanta FROM humidity
UNION ALL
SELECT datetime, 'Detroit', Detroit FROM humidity
UNION ALL
SELECT datetime, 'Jacksonville', Jacksonville FROM humidity
UNION ALL
SELECT datetime, 'Charlotte', Charlotte FROM humidity
UNION ALL
SELECT datetime, 'Miami', Miami FROM humidity
UNION ALL
SELECT datetime, 'Pittsburgh', Pittsburgh FROM humidity
UNION ALL
SELECT datetime, 'Toronto', Toronto FROM humidity
UNION ALL
SELECT datetime, 'Philadelphia', Philadelphia FROM humidity
UNION ALL
SELECT datetime, 'New York', `New York` FROM humidity
UNION ALL
SELECT datetime, 'Montreal', Montreal FROM humidity
UNION ALL
SELECT datetime, 'Boston', Boston FROM humidity
UNION ALL
SELECT datetime, 'Beersheba', Beersheba FROM humidity
UNION ALL
SELECT datetime, 'Tel Aviv District', `Tel Aviv District` FROM humidity
UNION ALL
SELECT datetime, 'Eilat', Eilat FROM humidity
UNION ALL
SELECT datetime, 'Haifa', Haifa FROM humidity
UNION ALL
SELECT datetime, 'Nahariyya', Nahariyya FROM humidity
UNION ALL
SELECT datetime, 'Jerusalem', Jerusalem FROM humidity
);


CREATE VIEW pressure_unpivoted AS (
	SELECT datetime, 'Vancouver' as city, Vancouver as pressure FROM pressure
UNION ALL
SELECT datetime, 'Portland', Portland FROM pressure
UNION ALL
SELECT datetime, 'San Francisco', `San Francisco` FROM pressure
UNION ALL
SELECT datetime, 'Seattle', Seattle FROM pressure
UNION ALL
SELECT datetime, 'Los Angeles', `Los Angeles` FROM pressure
UNION ALL
SELECT datetime, 'San Diego', `San Diego` FROM pressure
UNION ALL
SELECT datetime, 'Las Vegas', `Las Vegas` FROM pressure
UNION ALL
SELECT datetime, 'Phoenix', Phoenix FROM pressure
UNION ALL
SELECT datetime, 'Albuquerque', Albuquerque FROM pressure
UNION ALL
SELECT datetime, 'Denver', Denver FROM pressure
UNION ALL
SELECT datetime, 'San Antonio', `San Antonio` FROM pressure
UNION ALL
SELECT datetime, 'Dallas', Dallas FROM pressure
UNION ALL
SELECT datetime, 'Houston', Houston FROM pressure
UNION ALL
SELECT datetime, 'Kansas City', `Kansas City` FROM pressure
UNION ALL
SELECT datetime, 'Minneapolis', Minneapolis FROM pressure
UNION ALL
SELECT datetime, 'Saint Louis', `Saint Louis` FROM pressure
UNION ALL
SELECT datetime, 'Chicago', Chicago FROM pressure
UNION ALL
SELECT datetime, 'Nashville', Nashville FROM pressure
UNION ALL
SELECT datetime, 'Indianapolis', Indianapolis FROM pressure
UNION ALL
SELECT datetime, 'Atlanta', Atlanta FROM pressure
UNION ALL
SELECT datetime, 'Detroit', Detroit FROM pressure
UNION ALL
SELECT datetime, 'Jacksonville', Jacksonville FROM pressure
UNION ALL
SELECT datetime, 'Charlotte', Charlotte FROM pressure
UNION ALL
SELECT datetime, 'Miami', Miami FROM pressure
UNION ALL
SELECT datetime, 'Pittsburgh', Pittsburgh FROM pressure
UNION ALL
SELECT datetime, 'Toronto', Toronto FROM pressure
UNION ALL
SELECT datetime, 'Philadelphia', Philadelphia FROM pressure
UNION ALL
SELECT datetime, 'New York', `New York` FROM pressure
UNION ALL
SELECT datetime, 'Montreal', Montreal FROM pressure
UNION ALL
SELECT datetime, 'Boston', Boston FROM pressure
UNION ALL
SELECT datetime, 'Beersheba', Beersheba FROM pressure
UNION ALL
SELECT datetime, 'Tel Aviv District', `Tel Aviv District` FROM pressure
UNION ALL
SELECT datetime, 'Eilat', Eilat FROM pressure
UNION ALL
SELECT datetime, 'Haifa', Haifa FROM pressure
UNION ALL
SELECT datetime, 'Nahariyya', Nahariyya FROM pressure
UNION ALL
SELECT datetime, 'Jerusalem', Jerusalem FROM pressure
);


CREATE VIEW temperature_unpivoted AS (
	SELECT datetime, 'Vancouver' as city, Vancouver as temperature FROM temperature
UNION ALL
SELECT datetime, 'Portland', Portland FROM temperature
UNION ALL
SELECT datetime, 'San Francisco', `San Francisco` FROM temperature
UNION ALL
SELECT datetime, 'Seattle', Seattle FROM temperature
UNION ALL
SELECT datetime, 'Los Angeles', `Los Angeles` FROM temperature
UNION ALL
SELECT datetime, 'San Diego', `San Diego` FROM temperature
UNION ALL
SELECT datetime, 'Las Vegas', `Las Vegas` FROM temperature
UNION ALL
SELECT datetime, 'Phoenix', Phoenix FROM temperature
UNION ALL
SELECT datetime, 'Albuquerque', Albuquerque FROM temperature
UNION ALL
SELECT datetime, 'Denver', Denver FROM temperature
UNION ALL
SELECT datetime, 'San Antonio', `San Antonio` FROM temperature
UNION ALL
SELECT datetime, 'Dallas', Dallas FROM temperature
UNION ALL
SELECT datetime, 'Houston', Houston FROM temperature
UNION ALL
SELECT datetime, 'Kansas City', `Kansas City` FROM temperature
UNION ALL
SELECT datetime, 'Minneapolis', Minneapolis FROM temperature
UNION ALL
SELECT datetime, 'Saint Louis', `Saint Louis` FROM temperature
UNION ALL
SELECT datetime, 'Chicago', Chicago FROM temperature
UNION ALL
SELECT datetime, 'Nashville', Nashville FROM temperature
UNION ALL
SELECT datetime, 'Indianapolis', Indianapolis FROM temperature
UNION ALL
SELECT datetime, 'Atlanta', Atlanta FROM temperature
UNION ALL
SELECT datetime, 'Detroit', Detroit FROM temperature
UNION ALL
SELECT datetime, 'Jacksonville', Jacksonville FROM temperature
UNION ALL
SELECT datetime, 'Charlotte', Charlotte FROM temperature
UNION ALL
SELECT datetime, 'Miami', Miami FROM temperature
UNION ALL
SELECT datetime, 'Pittsburgh', Pittsburgh FROM temperature
UNION ALL
SELECT datetime, 'Toronto', Toronto FROM temperature
UNION ALL
SELECT datetime, 'Philadelphia', Philadelphia FROM temperature
UNION ALL
SELECT datetime, 'New York', `New York` FROM temperature
UNION ALL
SELECT datetime, 'Montreal', Montreal FROM temperature
UNION ALL
SELECT datetime, 'Boston', Boston FROM temperature
UNION ALL
SELECT datetime, 'Beersheba', Beersheba FROM temperature
UNION ALL
SELECT datetime, 'Tel Aviv District', `Tel Aviv District` FROM temperature
UNION ALL
SELECT datetime, 'Eilat', Eilat FROM temperature
UNION ALL
SELECT datetime, 'Haifa', Haifa FROM temperature
UNION ALL
SELECT datetime, 'Nahariyya', Nahariyya FROM temperature
UNION ALL
SELECT datetime, 'Jerusalem', Jerusalem FROM temperature
);



CREATE VIEW weather_description_unpivoted AS (
	SELECT datetime, 'Vancouver' as city, Vancouver as weather_description FROM weather_description
UNION ALL
SELECT datetime, 'Portland', Portland FROM weather_description
UNION ALL
SELECT datetime, 'San Francisco', `San Francisco` FROM weather_description
UNION ALL
SELECT datetime, 'Seattle', Seattle FROM weather_description
UNION ALL
SELECT datetime, 'Los Angeles', `Los Angeles` FROM weather_description
UNION ALL
SELECT datetime, 'San Diego', `San Diego` FROM weather_description
UNION ALL
SELECT datetime, 'Las Vegas', `Las Vegas` FROM weather_description
UNION ALL
SELECT datetime, 'Phoenix', Phoenix FROM weather_description
UNION ALL
SELECT datetime, 'Albuquerque', Albuquerque FROM weather_description
UNION ALL
SELECT datetime, 'Denver', Denver FROM weather_description
UNION ALL
SELECT datetime, 'San Antonio', `San Antonio` FROM weather_description
UNION ALL
SELECT datetime, 'Dallas', Dallas FROM weather_description
UNION ALL
SELECT datetime, 'Houston', Houston FROM weather_description
UNION ALL
SELECT datetime, 'Kansas City', `Kansas City` FROM weather_description
UNION ALL
SELECT datetime, 'Minneapolis', Minneapolis FROM weather_description
UNION ALL
SELECT datetime, 'Saint Louis', `Saint Louis` FROM weather_description
UNION ALL
SELECT datetime, 'Chicago', Chicago FROM weather_description
UNION ALL
SELECT datetime, 'Nashville', Nashville FROM weather_description
UNION ALL
SELECT datetime, 'Indianapolis', Indianapolis FROM weather_description
UNION ALL
SELECT datetime, 'Atlanta', Atlanta FROM weather_description
UNION ALL
SELECT datetime, 'Detroit', Detroit FROM weather_description
UNION ALL
SELECT datetime, 'Jacksonville', Jacksonville FROM weather_description
UNION ALL
SELECT datetime, 'Charlotte', Charlotte FROM weather_description
UNION ALL
SELECT datetime, 'Miami', Miami FROM weather_description
UNION ALL
SELECT datetime, 'Pittsburgh', Pittsburgh FROM weather_description
UNION ALL
SELECT datetime, 'Toronto', Toronto FROM weather_description
UNION ALL
SELECT datetime, 'Philadelphia', Philadelphia FROM weather_description
UNION ALL
SELECT datetime, 'New York', `New York` FROM weather_description
UNION ALL
SELECT datetime, 'Montreal', Montreal FROM weather_description
UNION ALL
SELECT datetime, 'Boston', Boston FROM weather_description
UNION ALL
SELECT datetime, 'Beersheba', Beersheba FROM weather_description
UNION ALL
SELECT datetime, 'Tel Aviv District', `Tel Aviv District` FROM weather_description
UNION ALL
SELECT datetime, 'Eilat', Eilat FROM weather_description
UNION ALL
SELECT datetime, 'Haifa', Haifa FROM weather_description
UNION ALL
SELECT datetime, 'Nahariyya', Nahariyya FROM weather_description
UNION ALL
SELECT datetime, 'Jerusalem', Jerusalem FROM weather_description
);


CREATE VIEW wind_direction_unpivoted AS (
	SELECT datetime, 'Vancouver' as city, Vancouver as wind_direction FROM wind_direction
UNION ALL
SELECT datetime, 'Portland', Portland FROM wind_direction
UNION ALL
SELECT datetime, 'San Francisco', `San Francisco` FROM wind_direction
UNION ALL
SELECT datetime, 'Seattle', Seattle FROM wind_direction
UNION ALL
SELECT datetime, 'Los Angeles', `Los Angeles` FROM wind_direction
UNION ALL
SELECT datetime, 'San Diego', `San Diego` FROM wind_direction
UNION ALL
SELECT datetime, 'Las Vegas', `Las Vegas` FROM wind_direction
UNION ALL
SELECT datetime, 'Phoenix', Phoenix FROM wind_direction
UNION ALL
SELECT datetime, 'Albuquerque', Albuquerque FROM wind_direction
UNION ALL
SELECT datetime, 'Denver', Denver FROM wind_direction
UNION ALL
SELECT datetime, 'San Antonio', `San Antonio` FROM wind_direction
UNION ALL
SELECT datetime, 'Dallas', Dallas FROM wind_direction
UNION ALL
SELECT datetime, 'Houston', Houston FROM wind_direction
UNION ALL
SELECT datetime, 'Kansas City', `Kansas City` FROM wind_direction
UNION ALL
SELECT datetime, 'Minneapolis', Minneapolis FROM wind_direction
UNION ALL
SELECT datetime, 'Saint Louis', `Saint Louis` FROM wind_direction
UNION ALL
SELECT datetime, 'Chicago', Chicago FROM wind_direction
UNION ALL
SELECT datetime, 'Nashville', Nashville FROM wind_direction
UNION ALL
SELECT datetime, 'Indianapolis', Indianapolis FROM wind_direction
UNION ALL
SELECT datetime, 'Atlanta', Atlanta FROM wind_direction
UNION ALL
SELECT datetime, 'Detroit', Detroit FROM wind_direction
UNION ALL
SELECT datetime, 'Jacksonville', Jacksonville FROM wind_direction
UNION ALL
SELECT datetime, 'Charlotte', Charlotte FROM wind_direction
UNION ALL
SELECT datetime, 'Miami', Miami FROM wind_direction
UNION ALL
SELECT datetime, 'Pittsburgh', Pittsburgh FROM wind_direction
UNION ALL
SELECT datetime, 'Toronto', Toronto FROM wind_direction
UNION ALL
SELECT datetime, 'Philadelphia', Philadelphia FROM wind_direction
UNION ALL
SELECT datetime, 'New York', `New York` FROM wind_direction
UNION ALL
SELECT datetime, 'Montreal', Montreal FROM wind_direction
UNION ALL
SELECT datetime, 'Boston', Boston FROM wind_direction
UNION ALL
SELECT datetime, 'Beersheba', Beersheba FROM wind_direction
UNION ALL
SELECT datetime, 'Tel Aviv District', `Tel Aviv District` FROM wind_direction
UNION ALL
SELECT datetime, 'Eilat', Eilat FROM wind_direction
UNION ALL
SELECT datetime, 'Haifa', Haifa FROM wind_direction
UNION ALL
SELECT datetime, 'Nahariyya', Nahariyya FROM wind_direction
UNION ALL
SELECT datetime, 'Jerusalem', Jerusalem FROM wind_direction
);



CREATE VIEW wind_speed_unpivoted AS (
	SELECT datetime, 'Vancouver' as city, Vancouver as wind_speed FROM wind_speed
UNION ALL
SELECT datetime, 'Portland', Portland FROM wind_speed
UNION ALL
SELECT datetime, 'San Francisco', `San Francisco` FROM wind_speed
UNION ALL
SELECT datetime, 'Seattle', Seattle FROM wind_speed
UNION ALL
SELECT datetime, 'Los Angeles', `Los Angeles` FROM wind_speed
UNION ALL
SELECT datetime, 'San Diego', `San Diego` FROM wind_speed
UNION ALL
SELECT datetime, 'Las Vegas', `Las Vegas` FROM wind_speed
UNION ALL
SELECT datetime, 'Phoenix', Phoenix FROM wind_speed
UNION ALL
SELECT datetime, 'Albuquerque', Albuquerque FROM wind_speed
UNION ALL
SELECT datetime, 'Denver', Denver FROM wind_speed
UNION ALL
SELECT datetime, 'San Antonio', `San Antonio` FROM wind_speed
UNION ALL
SELECT datetime, 'Dallas', Dallas FROM wind_speed
UNION ALL
SELECT datetime, 'Houston', Houston FROM wind_speed
UNION ALL
SELECT datetime, 'Kansas City', `Kansas City` FROM wind_speed
UNION ALL
SELECT datetime, 'Minneapolis', Minneapolis FROM wind_speed
UNION ALL
SELECT datetime, 'Saint Louis', `Saint Louis` FROM wind_speed
UNION ALL
SELECT datetime, 'Chicago', Chicago FROM wind_speed
UNION ALL
SELECT datetime, 'Nashville', Nashville FROM wind_speed
UNION ALL
SELECT datetime, 'Indianapolis', Indianapolis FROM wind_speed
UNION ALL
SELECT datetime, 'Atlanta', Atlanta FROM wind_speed
UNION ALL
SELECT datetime, 'Detroit', Detroit FROM wind_speed
UNION ALL
SELECT datetime, 'Jacksonville', Jacksonville FROM wind_speed
UNION ALL
SELECT datetime, 'Charlotte', Charlotte FROM wind_speed
UNION ALL
SELECT datetime, 'Miami', Miami FROM wind_speed
UNION ALL
SELECT datetime, 'Pittsburgh', Pittsburgh FROM wind_speed
UNION ALL
SELECT datetime, 'Toronto', Toronto FROM wind_speed
UNION ALL
SELECT datetime, 'Philadelphia', Philadelphia FROM wind_speed
UNION ALL
SELECT datetime, 'New York', `New York` FROM wind_speed
UNION ALL
SELECT datetime, 'Montreal', Montreal FROM wind_speed
UNION ALL
SELECT datetime, 'Boston', Boston FROM wind_speed
UNION ALL
SELECT datetime, 'Beersheba', Beersheba FROM wind_speed
UNION ALL
SELECT datetime, 'Tel Aviv District', `Tel Aviv District` FROM wind_speed
UNION ALL
SELECT datetime, 'Eilat', Eilat FROM wind_speed
UNION ALL
SELECT datetime, 'Haifa', Haifa FROM wind_speed
UNION ALL
SELECT datetime, 'Nahariyya', Nahariyya FROM wind_speed
UNION ALL
SELECT datetime, 'Jerusalem', Jerusalem FROM wind_speed
);

