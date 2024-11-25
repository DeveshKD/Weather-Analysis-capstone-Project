SELECT * FROM humidity_unpivoted;
SELECT * FROM pressure_unpivoted;
SELECT * FROM temperature_unpivoted;
SELECT * FROM weather_description_unpivoted;
SELECT * FROM wind_direction_unpivoted;
select * from wind_speed_unpivoted;
select city,avg(avg_humidity) from shortened_humidity group by 1;

-- TEST QUERIES
SELECT 
    w.datetime,
    w.city,
    w.humidity,
    d.Country,
    d.Latitude,
    d.Longitude
FROM humidity_unpivoted w
JOIN city_attributes d ON w.city = d.city
order by 1;

SELECT 
    pa.datetime,
    pa.City,
    pa.pressure,
    wsa.wind_speed
FROM 
    pressure_unpivoted pa
JOIN 
    city_attributes ca ON pa.city = ca.City
JOIN 
    wind_speed_unpivoted wsa ON pa.city = wsa.city;
    
    
-- -----------------------------Question 1-----------------------------------------

WITH latitude_extreme_cities AS (
    SELECT 
        ca.City,
        ca.Country,
        ca.Latitude,
        ca.Longitude,
        ta.avg_temperature,
        ha.avg_humidity,
        wsa.avg_wind_speed,
        CASE
            WHEN ca.Latitude <= 27 THEN 'Near Minimum Latitude'
            WHEN ca.Latitude >= 47 THEN 'Near Maximum Latitude'
            ELSE 'Mid-Range Latitude'
        END AS latitude_band
    FROM 
        city_attributes ca
    LEFT JOIN 
        shortened_temperature ta ON ca.City = ta.city
    LEFT JOIN 
        shortened_humidity ha ON ca.City = ha.city
    LEFT JOIN 
        shortened_wind_speed wsa ON ca.City = wsa.city
)

-- Analyze climate patterns by latitude band
SELECT 
    latitude_band,
    COUNT(DISTINCT City) AS city_count,
    AVG(avg_temperature) AS avg_temperature,
    AVG(avg_humidity) AS avg_humidity,
    AVG(avg_wind_speed) AS avg_wind_speed
FROM 
    latitude_extreme_cities
GROUP BY 
    latitude_band
ORDER BY 
    latitude_band;

SELECT 
    ca.City,
    ca.Latitude,
    avg(ta.avg_temperature),
    avg(ha.avg_humidity),
    avg(pa.avg_pressure)
FROM 
    city_attributes ca
JOIN 
    shortened_temperature ta ON ca.City = ta.city
JOIN 
    shortened_humidity ha ON ca.City = ha.city
JOIN 
    shortened_pressure pa ON ca.City = pa.city
WHERE 
    ca.Latitude > 45
GROUP BY 
	1,2
ORDER BY 
    2 DESC;



-- -----------------------------Question 2-----------------------------------------
WITH latitude_longitude_bins AS (
    SELECT 
        City,
        ROUND(Latitude, 0.01) AS lat_bin,
        ROUND(Longitude, 0.01) AS lon_bin -- Group longitude into whole numbers
    FROM 
        city_attributes
)
SELECT 
    lat_bin,
    lon_bin,
    COUNT(City) AS city_count,
    GROUP_CONCAT(City) AS cities_in_cluster
FROM 
    latitude_longitude_bins
GROUP BY 
    lat_bin, lon_bin
HAVING 
    city_count > 1 -- Only consider clusters with more than 1 city
ORDER BY 
    city_count DESC;




-- --------------------------------Question 3-----------------------------------------
Select 
	ca.City,
	ca.Latitude,
    ca.Longitude,
    AVG(t.temperature) as avg_temp,
    stddev(t.temperature) as temp_stddev
FROM
	temperature_unpivoted t
JOIN
	city_attributes ca ON t.city=ca.City
group by 
	1,2,3;
    
    
SELECT 
    CASE 
        WHEN ca.Latitude BETWEEN -90 AND -60 THEN 'Very High South'
        WHEN ca.Latitude BETWEEN -60 AND -30 THEN 'High South'
        WHEN ca.Latitude BETWEEN -30 AND 0 THEN 'South'
        WHEN ca.Latitude BETWEEN 0 AND 30 THEN 'North'
        WHEN ca.Latitude BETWEEN 30 AND 60 THEN 'High North'
        WHEN ca.Latitude BETWEEN 60 AND 90 THEN 'Very High North'
        ELSE 'Unknown'
    END AS latitude_band,
    AVG(tu.temperature) AS avg_temperature,
    STDDEV(tu.temperature) AS temp_stddev,
    COUNT(DISTINCT ca.City) AS city_count
FROM 
    city_attributes ca
JOIN 
    temperature_unpivoted tu ON ca.City = tu.city
GROUP BY 
    latitude_band
ORDER BY 
    latitude_band;



-- --------------------------------Question 4-----------------------------------------
WITH rainy_weather AS (
    SELECT 
        City,
        EXTRACT(MONTH FROM datetime) AS month,
        COUNT(*) AS rainy_days
    FROM 
        weather_description_unpivoted
    WHERE 
        LOWER(weather_description) LIKE '%rain%' -- Matches descriptions with 'rain'
    GROUP BY 
        City, EXTRACT(MONTH FROM datetime)
),
city_rain_totals AS (
    SELECT 
        City,
        SUM(rainy_days) AS total_rainy_days
    FROM 
        rainy_weather
    GROUP BY 
        City
),
top_cities AS (
    SELECT 
        City
    FROM 
        city_rain_totals
    ORDER BY 
        total_rainy_days DESC
    LIMIT 3 -- Select the top 3 cities with the most rainy days
)
SELECT 
    rw.City,
    rw.month,
    rw.rainy_days
FROM 
    rainy_weather rw
JOIN 
    city_rain_totals ct ON rw.City = ct.City
JOIN 
    top_cities tc ON rw.City = tc.City
ORDER BY 
    rw.City, rw.month;
    
    
WITH rainy_weather AS (
    SELECT 
        City,
        EXTRACT(MONTH FROM datetime) AS month,
        COUNT(*) AS rainy_days
    FROM 
        weather_description_unpivoted
    WHERE 
        LOWER(weather_description) LIKE '%rain%' -- Matches descriptions with 'rain'
    GROUP BY 
        City, EXTRACT(MONTH FROM datetime)
),
city_rain_totals AS (
    SELECT 
        City,
        SUM(rainy_days) AS total_rainy_days, -- Total rainy days throughout the year
        AVG(rainy_days) AS avg_rainy_days    -- Average rainy days per month
    FROM 
        rainy_weather
    GROUP BY 
        City
),
rainy_weather_filtered AS (
    SELECT 
        rw.City,
        rw.month,
        rw.rainy_days,
        ct.total_rainy_days -- Include total yearly rainy days for each city
    FROM 
        rainy_weather rw
    JOIN 
        city_rain_totals ct ON rw.City = ct.City
    WHERE 
        rw.rainy_days > ct.avg_rainy_days -- Filter months with above-average rainy days
),
top_cities AS (
    SELECT 
        City
    FROM 
        city_rain_totals
    ORDER BY 
        total_rainy_days DESC -- Select the top 3 cities with the most rainy instances
    LIMIT 3
)
SELECT 
    rwf.City,
    rwf.total_rainy_days, -- Total yearly rainy days for the city
    rwf.month,
    rwf.rainy_days
FROM 
    rainy_weather_filtered rwf
JOIN 
    top_cities tc ON rwf.City = tc.City
ORDER BY 
    rwf.City, rwf.month;




-- --------------------------------Question 4 V2-----------------------------------------

SELECT 
    City,
    COUNT(*) AS total_rainy_occurrences
FROM 
    weather_description_unpivoted
WHERE 
    LOWER(weather_description) LIKE '%rain%' -- Matches descriptions with 'rain'
GROUP BY 
    City
ORDER BY 
    total_rainy_occurrences DESC
LIMIT 3; -- Top 3 cities with the most occurrences of rain


-- --------------------------------Question 5-----------------------------------------

WITH summarized_data AS (
    SELECT 
        h.city,
        h.avg_humidity,
        p.avg_pressure
    FROM 
        shortened_humidity h
    JOIN 
        shortened_pressure p ON h.city = p.city AND h.month = p.month
),
city_correlation AS (
    SELECT 
        city,
        COUNT(*) AS n,
        SUM(avg_humidity) AS sum_humidity,
        SUM(avg_pressure) AS sum_pressure,
        SUM(avg_humidity * avg_pressure) AS sum_humidity_pressure,
        SUM(avg_humidity * avg_humidity) AS sum_humidity_squared,
        SUM(avg_pressure * avg_pressure) AS sum_pressure_squared
    FROM 
        summarized_data
    GROUP BY 
        city
)
SELECT 
    city,
    ROUND(
        (n * sum_humidity_pressure - sum_humidity * sum_pressure) / 
        SQRT(
            (n * sum_humidity_squared - POW(sum_humidity, 2)) *
            (n * sum_pressure_squared - POW(sum_pressure, 2))
        ), 
        2
    ) AS correlation_coefficient
FROM 
    city_correlation
ORDER BY 
    correlation_coefficient DESC;
-- ------------------------------------------ V2 (for visual)------------------------------------------
SELECT 
        h.city,
        avg(h.avg_humidity),
        avg(p.avg_pressure)
    FROM 
        shortened_humidity h
    JOIN 
        shortened_pressure p ON h.city = p.city AND h.month = p.month
	group by 1;


-- --------------------------------Question 6-----------------------------------------

WITH coastal_wind_temp AS (
    SELECT 
        st.city,
        st.month,
        st.avg_temperature,
        swd.avg_wind_direction AS avg_wind_direction
    FROM 
        shortened_temperature st
    JOIN 
        shortened_wind_direction swd 
        ON st.city = swd.city AND st.month = swd.month
    WHERE 
        st.city IN ('Vancouver', 'Portland', 'San Francisco', 'Seattle', 'Los Angeles', 
                    'San Diego', 'Miami', 'Jacksonville', 'Boston', 
                    'Tel Aviv District', 'Haifa', 'Nahariyya')
),
stats AS (
    SELECT 
        city,
        COUNT(*) AS n,
        SUM(avg_temperature) AS sum_temp,
        SUM(avg_wind_direction) AS sum_wind,
        SUM(avg_temperature * avg_wind_direction) AS sum_temp_wind,
        SUM(POWER(avg_temperature, 2)) AS sum_temp_squared,
        SUM(POWER(avg_wind_direction, 2)) AS sum_wind_squared
    FROM 
        coastal_wind_temp
    GROUP BY 
        city
),
correlations AS (
    SELECT 
        city,
        (n * sum_temp_wind - sum_temp * sum_wind) /
        SQRT((n * sum_temp_squared - POWER(sum_temp, 2)) * 
             (n * sum_wind_squared - POWER(sum_wind, 2))) AS wind_temp_correlation
    FROM 
        stats
)
SELECT 
    city,
    ROUND(wind_temp_correlation, 2) AS wind_temp_correlation
FROM 
    correlations
ORDER BY 
    wind_temp_correlation DESC;


-- ------------------------------------------ V2 (for visual)------------------------------------------

SELECT 
        t.city,
        avg(t.avg_temperature),
        avg(wd.avg_wind_direction)
    FROM 
        shortened_temperature t
    JOIN 
        shortened_wind_direction wd ON t.city = wd.city AND t.month = wd.month
	where 
    t.city IN ('Vancouver', 'Portland', 'San Francisco', 'Seattle', 'Los Angeles', 
                    'San Diego', 'Miami', 'Jacksonville', 'Boston', 
                    'Tel Aviv District', 'Haifa', 'Nahariyya')
	group by 1;



-- --------------------------------Question 7-----------------------------------------

WITH monthly_temperature_stats AS (
    SELECT 
        city,
        EXTRACT(MONTH FROM datetime) AS month,
        AVG(temperature) AS avg_temperature,
        STDDEV(temperature) AS temp_fluctuation
    FROM 
        temperature_unpivoted
    GROUP BY 
        city, EXTRACT(MONTH FROM datetime)
)
SELECT 
    month,
    ROUND(AVG(temp_fluctuation), 2) AS avg_temp_fluctuation,
    COUNT(DISTINCT city) AS cities_analyzed
FROM 
    monthly_temperature_stats
GROUP BY 
    month
ORDER BY 
    avg_temp_fluctuation DESC;

-- --------------------------------Question 8-----------------------------------------

WITH extreme_weather_events AS (
    SELECT 
        city,
        datetime,
        weather_description
    FROM 
        weather_description_unpivoted
    WHERE 
        weather_description LIKE '%thunderstorm%'  -- Thunderstorm conditions
        OR weather_description LIKE '%heavy rain%'  -- Heavy rain conditions
        OR weather_description LIKE '%rain%'  -- General rain conditions
        OR weather_description LIKE '%snow%'  -- Snow conditions
        OR weather_description LIKE '%tornado%'  -- Tornado conditions
        OR weather_description LIKE '%hurricane%'  -- Hurricane-related events, if applicable
        OR weather_description LIKE '%squalls%'  -- Squalls
        OR weather_description LIKE '%volcanic ash%'  -- Volcanic ash
        OR weather_description LIKE '%freezing rain%'  -- Freezing rain
)
-- Aggregating extreme weather events by city and date
SELECT 
    monthname(datetime) AS month,
    COUNT(*) AS extreme_weather_count
FROM 
    extreme_weather_events
GROUP BY 
    1
ORDER BY 
    2 DESC;



-- --------------------------------Question 9-----------------------------------------


WITH hemisphere_cities AS (
    SELECT 
        ca.city,
        latitude,
        avg_temperature,  -- Already aggregated temperature by city and month
        month
    FROM 
        shortened_temperature st
    JOIN 
        city_attributes ca ON st.city = ca.city
    WHERE 
        ca.latitude > 37.511965  -- Northern Hemisphere cities (latitude > median)
    OR 
        ca.latitude <= 37.511965  -- Southern Hemisphere cities (latitude <= median)
)
SELECT 
    CASE
        WHEN latitude > 37.511965 THEN 'Northern Hemisphere'
        ELSE 'Southern Hemisphere'
    END AS hemisphere,
    month,
    AVG(avg_temperature) AS avg_temperature
FROM 
    hemisphere_cities
GROUP BY 
    hemisphere, month
ORDER BY 
    hemisphere, month;


-- --------------------------------Question 10-----------------------------------------


    WITH extreme_weather AS (
    SELECT 
        ta.city,
        ta.temperature,
        ta.datetime,
        EXTRACT(MONTH FROM ta.datetime) AS month
    FROM 
        temperature_unpivoted ta
    WHERE 
        ta.temperature >= 308.15  -- Extreme heat: temperature >= 308.15 K (35°C)
    OR 
        ta.temperature <= 273.15  -- Extreme cold: temperature <= 273.15 K (0°C)
)
SELECT 
    city,
    SUM(CASE WHEN temperature >= 308.15 THEN 1 ELSE 0 END) AS extreme_heat_events,
    SUM(CASE WHEN temperature <= 273.15 THEN 1 ELSE 0 END) AS extreme_cold_events
FROM 
    extreme_weather
GROUP BY 
    city;




-- --------------------------------Question 11-----------------------------------------


	WITH temperature_norms AS (
    -- Calculate average temperature and standard deviation for each city per month
    SELECT 
        city,
        EXTRACT(MONTH FROM datetime) AS month,
        AVG(temperature) AS avg_temperature,
        STDDEV(temperature) AS stddev_temperature
    FROM 
        temperature_unpivoted
    GROUP BY 
        city, EXTRACT(MONTH FROM datetime)
),
temperature_anomalies AS (
    -- Identify temperature anomalies (temperature > 1.5 stddev from the mean)
    SELECT 
        ta.city,
        ta.temperature,
        tn.avg_temperature,
        CASE 
            WHEN ta.temperature > (tn.avg_temperature + 1.5 * tn.stddev_temperature) THEN 'High Anomaly'
            WHEN ta.temperature < (tn.avg_temperature - 1.5 * tn.stddev_temperature) THEN 'Low Anomaly'
            ELSE 'Normal'
        END AS temperature_status
    FROM 
        temperature_unpivoted ta
    JOIN 
        temperature_norms tn ON ta.city = tn.city AND EXTRACT(MONTH FROM ta.datetime) = tn.month
)
SELECT 
    city,
    ROUND(AVG(avg_temperature), 2) AS avg_city_temperature,
    COUNT(CASE WHEN temperature_status IN ('High Anomaly', 'Low Anomaly') THEN 1 END) AS anomaly_count
FROM 
    temperature_anomalies
WHERE 
    temperature_status IN ('High Anomaly', 'Low Anomaly')
GROUP BY 
    city
ORDER BY 
    anomaly_count DESC;



-- --------------------------------Question 12-----------------------------------------


-- Analyze the impact of temperature on energy consumption patterns in cities. Are there noticeable trends or correlations?
-- since we dont have any data related to energy consumption ...
-- just map cities and their temps....
-- then i'll just interpret that the cities with extereme temps are likely to consume more electricity for heater or cooler or any other device to survive in that conditions

SELECT 
    city, 
    month, 
    avg_temperature,
    CASE 
        WHEN avg_temperature >= 303.15 THEN 'Extreme Heat'  -- 30°C in Kelvin
        WHEN avg_temperature <= 273.15 THEN 'Extreme Cold'  -- 0°C in Kelvin
        ELSE 'Normal'
    END AS temperature_flag
FROM 
    shortened_temperature  -- Using the existing shortened_temperature view
ORDER BY 
    city, month;


-- --------------------------------Question 13-----------------------------------------


SELECT 
    st.city,
    st.month,
    avg_temperature,
    CASE
        WHEN avg_temperature >= 308.15 THEN 'Extreme Heat'
        WHEN avg_temperature <= 273.15 THEN 'Extreme Cold'
        ELSE 'Normal'
    END AS temperature_category,
    avg_wind_speed,
    CASE
        WHEN avg_wind_speed <= 2.49 THEN 'Slow'
        WHEN avg_wind_speed > 2.49 AND avg_wind_speed <= 3.58 THEN 'Normal'
        WHEN avg_wind_speed > 3.58 THEN 'Fast'
        ELSE 'Unknown'
    END AS wind_speed_category
FROM 
    shortened_temperature st
JOIN 
    shortened_wind_speed sws ON st.city = sws.city AND st.month = sws.month
ORDER BY 
    city, month;


-- --------------------------------Question 14-----------------------------------------


SELECT 
    ws.city,
    ws.month,
    ws.avg_wind_speed,
    CASE
        WHEN ws.avg_wind_speed > 3.58 THEN 'Prone to Strong Winds'  -- Flag cities with high winds
        ELSE 'Normal Winds'
    END AS wind_risk_category,
    CASE
        WHEN ws.avg_wind_speed > 4 THEN 'Higher Risk of Natural Disasters (e.g., Storms, Hurricanes)'
        WHEN ws.avg_wind_speed BETWEEN 3 AND 4 THEN 'Increased Transportation Challenges'
        ELSE 'Normal Conditions'
    END AS potential_consequences,
    COUNT(CASE 
            WHEN wd.weather_description LIKE '%storm%' 
            OR wd.weather_description LIKE '%hurricane%' 
            OR wd.weather_description LIKE '%tornado%' 
            OR wd.weather_description LIKE '%squall%' 
            THEN 1 
            ELSE NULL 
        END) AS wind_related_disasters
FROM 
    shortened_wind_speed ws
LEFT JOIN 
    weather_description_unpivoted wd ON ws.city = wd.city AND ws.month = EXTRACT(MONTH FROM wd.datetime)
GROUP BY 
    ws.city, ws.month, ws.avg_wind_speed
ORDER BY 
    ws.avg_wind_speed DESC;



-- --------------------------------Question 15-----------------------------------------


WITH coastal_cities AS (
    SELECT 'Vancouver' AS city
    UNION ALL SELECT 'Portland'
    UNION ALL SELECT 'San Francisco'
    UNION ALL SELECT 'Seattle'
    UNION ALL SELECT 'Los Angeles'
    UNION ALL SELECT 'San Diego'
    UNION ALL SELECT 'Miami'
    UNION ALL SELECT 'Toronto'
    UNION ALL SELECT 'Montreal'
    UNION ALL SELECT 'Beersheba'
    UNION ALL SELECT 'Tel Aviv District'
    UNION ALL SELECT 'Eilat'
    UNION ALL SELECT 'Haifa'
    UNION ALL SELECT 'Nahariyya'
    UNION ALL SELECT 'Jerusalem'
),
weather_event AS (
    SELECT
        city,
        COUNT(*) AS event_count
    FROM
        weather_description_unpivoted
    WHERE
        weather_description LIKE '%storm%' 
        OR weather_description LIKE '%hurricane%'
        OR weather_description LIKE '%tornado%'
        OR weather_description LIKE '%squall%'
        OR weather_description LIKE '%wind%'
    GROUP BY 
        city
)
SELECT
    c.city,
    ws.month,
    ws.avg_wind_speed,
    we.event_count
FROM
    coastal_cities c
JOIN
    shortened_wind_speed ws ON c.city = ws.city
JOIN
    weather_event we ON c.city = we.city
ORDER BY
    ws.avg_wind_speed DESC;

WITH coastal_cities AS (
    SELECT 'Vancouver' AS city
    UNION ALL SELECT 'Portland'
    UNION ALL SELECT 'San Francisco'
    UNION ALL SELECT 'Seattle'
    UNION ALL SELECT 'Los Angeles'
    UNION ALL SELECT 'San Diego'
    UNION ALL SELECT 'Miami'
    UNION ALL SELECT 'Toronto'
    UNION ALL SELECT 'Montreal'
    UNION ALL SELECT 'Beersheba'
    UNION ALL SELECT 'Tel Aviv District'
    UNION ALL SELECT 'Eilat'
    UNION ALL SELECT 'Haifa'
    UNION ALL SELECT 'Nahariyya'
    UNION ALL SELECT 'Jerusalem'
),
weather_event AS (
    SELECT
        city,
        COUNT(*) AS event_count
    FROM
        weather_description_unpivoted
    WHERE
        LOWER(weather_description) LIKE '%storm%' 
        OR LOWER(weather_description) LIKE '%hurricane%'
        OR LOWER(weather_description) LIKE '%tornado%'
        OR LOWER(weather_description) LIKE '%squall%'
        OR LOWER(weather_description) LIKE '%wind%'
    GROUP BY 
        city
),
average_wind_speed AS (
    SELECT
        city,
        AVG(wind_speed) AS avg_wind_speed
    FROM
        wind_speed_unpivoted
    GROUP BY
        city
),
average_wind_direction AS (
    SELECT
        city,
        AVG(wind_direction) AS avg_wind_direction
    FROM
        wind_direction_unpivoted
    GROUP BY
        city
)
SELECT
    c.city,
    COALESCE(aws.avg_wind_speed, 0) AS avg_wind_speed,
    COALESCE(awd.avg_wind_direction, 0) AS avg_wind_direction,
    COALESCE(we.event_count, 0) AS event_count
FROM
    coastal_cities c
LEFT JOIN
    average_wind_speed aws ON c.city = aws.city
LEFT JOIN
    average_wind_direction awd ON c.city = awd.city
LEFT JOIN
    weather_event we ON c.city = we.city
ORDER BY
    avg_wind_speed DESC;

