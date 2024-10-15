-- Dimension Tables
CREATE DATABASE incidents_DW;
USE incidents_DW;

-- Date Dimension
CREATE TABLE dim_date (
    Date_ID bigint  ,
    Date DATE NOT NULL,
    Day INT,
    Day_Name VARCHAR(20),
    Month INT,
    Month_Name VARCHAR(20),
    Quarter INT,
    Year INT
);


-- Time Dimension
CREATE TABLE dim_time (
    Time_ID bigint ,
    Time TIME,
    Hour INT,
    Minute INT
);


-- Location Dimension
CREATE TABLE dim_location (
    Location_ID bigint   ,
    Easting INT,
    Northing INT,
    Location VARCHAR(255),
    Local_Authority VARCHAR(50)
);


-- Severity Dimension
CREATE TABLE dim_severity (
	Severity_ID bigint  ,
    Severity VARCHAR(50)
);


-- Road Condition Dimension
CREATE TABLE dim_road_condition (
	Road_Condition_ID bigint ,
    Road_Condition VARCHAR(50),
    Weather VARCHAR(100),
    Visibility VARCHAR(100),
    Speed_Limit INT
);


-- Crossing Dimension
CREATE TABLE dim_crossing (
	Crossing_ID bigint   ,
    Crossing_Facility VARCHAR(100),
    Crossing_Control_Type VARCHAR(100)
);



-- Fact Table
CREATE TABLE fact_incidents (
    Incident_ID INT PRIMARY KEY AUTO_INCREMENT,
    Police_Ref VARCHAR(100) NOT NULL,
    Date_ID bigint,
    Time_ID bigint,
    Severity_ID bigint,
    Location_ID bigint,
    Road_Condition_ID bigint,
    Crossing_ID bigint,
    Number_Of_Casualties INT,
    Number_Of_OAPs INT,
    Number_Of_Children INT,
    Cycles_Involved INT,
    P2W_Involved INT,
    Pedestrians_Involved INT,
    Motor_Vehicles_Involved INT

);



