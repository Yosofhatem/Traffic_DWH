CREATE DATABASE IF NOT EXISTS analysis_layer;

--- 1. Yearly Incident Trends
CREATE TABLE analysis_layer.yearly_incident_trends AS
SELECT year, COUNT(incident_id) AS total_incidents
FROM incidents_dw.fact_incidents f
JOIN incidents_dw.dim_date d ON f.date_id = d.date_id
GROUP BY year;

--- 2. Monthly Incident Trends
CREATE TABLE analysis_layer.monthly_incident_trends AS
SELECT year, month, COUNT(incident_id) AS total_incidents
FROM incidents_dw.fact_incidents f
JOIN incidents_dw.dim_date d ON f.date_id = d.date_id
GROUP BY year, month
ORDER BY year, month;

--- 3. Location and Severity Summary
CREATE TABLE analysis_layer.location_severity_summary AS
SELECT l.location, s.severity, COUNT(f.incident_id) AS total_incidents
FROM incidents_dw.fact_incidents f
JOIN incidents_dw.dim_location l ON f.location_id = l.location_id
JOIN incidents_dw.dim_severity s ON f.severity_id = s.severity_id
GROUP BY l.location, s.severity;

--- 4. Casualties by Weather Condition
CREATE TABLE analysis_layer.casualties_by_weather AS
SELECT r.weather, SUM(f.number_of_casualties) AS total_casualties
FROM incidents_dw.fact_incidents f
JOIN incidents_dw.dim_road_condition r ON f.road_condition_id = r.road_condition_id
GROUP BY r.weather
ORDER BY total_casualties DESC;

