CREATE DATABASE IF NOT EXISTS incidents_dw;

USE incidents_dw;

CREATE TABLE dim_crossing (
    crossing_id BIGINT,
    crossing_facility STRING,
    crossing_control_type STRING
) ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',' 
STORED AS TEXTFILE;

CREATE TABLE dim_date (
    date_id BIGINT,
    date_value DATE,
    day INT,
    day_name STRING,
    month INT,
    month_name STRING,
    quarter INT,
    year INT
) ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',' 
STORED AS TEXTFILE;

CREATE TABLE dim_location (
    location_id BIGINT,
    easting INT,
    northing INT,
    location STRING,
    local_authority STRING
) ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',' 
STORED AS TEXTFILE;

CREATE TABLE dim_road_condition (
    road_condition_id BIGINT,
    road_condition STRING,
    weather STRING,
    visibility STRING,
    speed_limit INT
) ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',' 
STORED AS TEXTFILE;

CREATE TABLE dim_severity (
    severity_id BIGINT,
    severity STRING
) ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',' 
STORED AS TEXTFILE;

CREATE TABLE dim_time (
    time_id BIGINT,
    time_value STRING,
    hour INT,
    minute INT
) ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',' 
STORED AS TEXTFILE;

CREATE TABLE fact_incidents (
    incident_id BIGINT,
    police_ref STRING,
    date_id BIGINT,
    time_id BIGINT,
    severity_id BIGINT,
    location_id BIGINT,
    road_condition_id BIGINT,
    crossing_id BIGINT,
    number_of_casualties INT,
    number_of_oaps INT,
    number_of_children INT,
    cycles_involved INT,
    p2w_involved INT,
    pedestrian_involved INT,
    motor_vehicles_involved INT
) ROW FORMAT DELIMITED 
FIELDS TERMINATED BY ',' 
STORED AS TEXTFILE;
