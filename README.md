# Weather Data Analysis Project 🌦️

## Overview
This project explores and analyzes weather patterns for multiple cities worldwide, using structured and normalized datasets. The focus includes understanding temperature trends, humidity levels, wind patterns, and their relationships with weather-related events. The project also incorporates techniques to handle wide data formats, transform them into usable forms, and extract meaningful insights.

## Objectives
- Analyze weather trends across different cities, including temperature, humidity, and wind patterns.
- Identify and assess extreme weather conditions like storms, hurricanes, and their potential impact.
- Evaluate anomalies in weather data to understand unusual patterns.
- Visualize and communicate findings through graphs and dashboards.

## Significance
Weather data plays a crucial role in decision-making for environmental planning, disaster management, and sustainable urban development. By uncovering trends and anomalies, this project contributes to understanding the dynamic nature of climatic conditions and their implications for society.

---

## Features
- **Data Transformation:** Unpivoting wide datasets for normalized and scalable analysis.
- **Trend Analysis:** Examines patterns in temperature, humidity, and wind across time and geography.
- **Anomaly Detection:** Highlights deviations from typical weather norms.
- **Impact Assessment:** Explores correlations between weather patterns and severe weather-related events.
- **Visualizations:** Presents insights through intuitive graphs and dashboards.

---

## Data Dictionary
### Base Tables
- **`temperature`**: Contains temperature readings for cities.
- **`humidity`**: Includes humidity data for cities.
- **`wind_speed`**: Holds wind speed measurements.
- **`wind_direction`**: Captures wind direction data.
- **`weather_description`**: Provides descriptive weather conditions.

### Unpivoted Tables
- **`temperature_unpivoted`**: City-based temperature data in long format.
- **`humidity_unpivoted`**: City-based humidity data in long format.
- **`wind_speed_unpivoted`**: City-based wind speed data in long format.
- **`wind_direction_unpivoted`**: City-based wind direction data in long format.
- **`weather_description_unpivoted`**: Detailed weather conditions in long format.

### Shortened Tables
- **`shortened_temperature`**: Aggregated monthly average temperatures per city.
- **`shortened_humidity`**: Aggregated monthly average humidity levels per city.
- **`shortened_wind_speed`**: Aggregated monthly average wind speeds per city.
- **`shortened_wind_direction`**: Aggregated monthly average wind directions per city.

---

## Tools & Technologies
- **Database**: SQL for data querying and transformation.
- **Visualization**: Microsoft Excel, Power BI for interactive dashboards.
- **Programming**: Python (optional for advanced analysis).
- **Version Control**: Git & GitHub for project tracking and collaboration.

---

## Key Insights
- Identified anomalies in temperature and humidity levels across various cities.
- Explored the impact of wind speed and direction on weather-related events in coastal cities.
- Highlighted city clusters with similar latitude and longitude values for spatial analysis.
- Developed intuitive dashboards to showcase findings and trends effectively.

---
## Usage Instructions
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/weather-data-analysis.git
   cd weather-data-analysis
