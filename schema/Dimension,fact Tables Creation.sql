-- Dimension Tables
CREATE DATABASE incidents_DW;
USE incidents_DW;

-- Date Dimension
CREATE TABLE dim_date (
    Date_ID INT PRIMARY KEY ,
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
    Time_ID INT PRIMARY KEY ,
    Time TIME,
    Hour INT,
    Minute INT,
    INDEX(Hour, Minute)  -- Composite index for faster time-based queries
);


-- Location Dimension
CREATE TABLE dim_location (
    Location_ID INT PRIMARY KEY ,
    Easting INT,
    Northing INT,
    Location VARCHAR(255),
    Local_Authority VARCHAR(50)
);


-- Severity Dimension
CREATE TABLE dim_severity (
    Severity_ID INT PRIMARY KEY ,
    Severity VARCHAR(50)
);


-- Road Condition Dimension
CREATE TABLE dim_road_condition (
    Road_Condition_ID INT PRIMARY KEY ,
    Road_Condition VARCHAR(50),
    Weather VARCHAR(100),
    Visibility VARCHAR(100),
    Speed_Limit INT
);


-- Crossing Dimension
CREATE TABLE dim_crossing (
    Crossing_ID INT PRIMARY KEY ,
    Crossing_Facility VARCHAR(100),
    Crossing_Control_Type VARCHAR(100)
);



-- Fact Table
CREATE TABLE fact_incidents (
    Incident_ID INT PRIMARY KEY AUTO_INCREMENT,
    Police_Ref VARCHAR(100) NOT NULL,
    Date_ID INT,
    Time_ID INT,
    Severity_ID INT,
    Location_ID INT,
    Road_Condition_ID INT,
    Crossing_ID INT,
    Number_Of_Casualties INT,
    Number_Of_OAPs INT,
    Number_Of_Children INT,
    Cycles_Involved INT,
    P2W_Involved INT,
    Pedestrians_Involved INT,
    Motor_Vehicles_Involved INT

);

