CREATE VIEW shortened_humidity AS
SELECT 
    city,
    EXTRACT(MONTH FROM datetime) AS month,
    AVG(humidity) AS avg_humidity  -- Or any other aggregation
FROM 
    humidity_unpivoted
GROUP BY 
    city, EXTRACT(MONTH FROM datetime);


CREATE VIEW shortened_pressure AS
SELECT 
    city,
    EXTRACT(MONTH FROM datetime) AS month,
    AVG(pressure) AS avg_pressure  -- Or any other aggregation
FROM 
    pressure_unpivoted
GROUP BY 
    city, EXTRACT(MONTH FROM datetime);



CREATE VIEW shortened_temperature AS
SELECT 
    city,
    EXTRACT(MONTH FROM datetime) AS month,
    AVG(temperature) AS avg_temperature  -- Or any other aggregation
FROM 
    temperature_unpivoted
GROUP BY 
    city, EXTRACT(MONTH FROM datetime);


CREATE VIEW shortened_wind_direction AS
SELECT 
    city,
    EXTRACT(MONTH FROM datetime) AS month,
    AVG(wind_direction) AS avg_wind_direction  -- Or any other aggregation
FROM 
    wind_direction_unpivoted
GROUP BY 
    city, EXTRACT(MONTH FROM datetime);


CREATE VIEW shortened_weather_description AS
SELECT 
    city,
    EXTRACT(MONTH FROM datetime) AS month,
    GROUP_CONCAT(DISTINCT weather_description ORDER BY weather_description SEPARATOR ', ') AS weather_conditions
FROM 
    weather_description_unpivoted
GROUP BY 
    city, EXTRACT(MONTH FROM datetime);
    
    
    WITH extreme_weather AS (
    SELECT 
        ta.city,
        ta.temperature,
        sd.weather_conditions,
        ta.datetime,
        EXTRACT(MONTH FROM ta.datetime) AS month
    FROM 
        temperature_unpivoted ta
    JOIN 
        shortened_weather_description sd ON ta.city = sd.city AND EXTRACT(MONTH FROM ta.datetime) = sd.month
    WHERE 
        ta.temperature >= 308.15  -- Extreme heat: temperature >= 308.15 K (35°C)
    OR 
        ta.temperature <= 273.15  -- Extreme cold: temperature <= 273.15 K (0°C)
)
SELECT 
    city,
    month,
    COUNT(*) AS extreme_weather_events,  -- Count of extreme weather events
    SUM(CASE WHEN temperature >= 308.15 THEN 1 ELSE 0 END) AS extreme_heat_events,
    SUM(CASE WHEN temperature <= 273.15 THEN 1 ELSE 0 END) AS extreme_cold_events,
    MAX(weather_conditions) AS weather_conditions  -- Use MAX or any other aggregation for the weather conditions
FROM 
    extreme_weather
GROUP BY 
    city, month
ORDER BY 
    extreme_weather_events DESC;


CREATE VIEW shortened_wind_speed AS
SELECT 
    city,
    EXTRACT(MONTH FROM datetime) AS month,
    AVG(wind_speed) AS avg_wind_speed
FROM 
    wind_speed_unpivoted
GROUP BY 
    city, EXTRACT(MONTH FROM datetime);


select min(avg_wind_speed), max(avg_wind_speed) from shortened_wind_speed
