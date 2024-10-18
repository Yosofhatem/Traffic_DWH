
CREATE DATABASE incidents_DW;
USE incidents_DW;

-- Dimension Tables
CREATE TABLE dim_date (
    Date_ID BIGINT PRIMARY KEY ,
    Date DATE NOT NULL,
    Day INT,
    Day_Name VARCHAR(20),
    Month INT,
    Month_Name VARCHAR(20),
    Quarter INT,
    Year INT
);

CREATE TABLE dim_time (
    Time_ID BIGINT PRIMARY KEY ,
    Time TIME,
    Hour INT,
    Minute INT,
    INDEX(Hour, Minute)  -- Composite index for faster time-based queries
);

CREATE TABLE dim_location (
    Location_ID BIGINT PRIMARY KEY ,
    Easting INT,
    Northing INT,
    Location VARCHAR(255),
    Local_Authority VARCHAR(50)
);

CREATE TABLE dim_severity (
    Severity_ID BIGINT PRIMARY KEY ,
    Severity VARCHAR(50)
);

CREATE TABLE dim_road_condition (
    Road_Condition_ID BIGINT PRIMARY KEY ,
    Road_Condition VARCHAR(50),
    weather VARCHAR(100),
    visibility VARCHAR(100),
    Speed_Limit INT
);

CREATE TABLE dim_crossing (
    Crossing_ID BIGINT PRIMARY KEY ,
    Crossing_Facility VARCHAR(100),
    Crossing_Control_Type VARCHAR(100)
);

-- Fact Table

CREATE TABLE fact_incidents (
    Incident_ID BIGINT PRIMARY KEY AUTO_INCREMENT,
    Police_Ref VARCHAR(20) NOT NULL UNIQUE,
    Date_ID BIGINT,
    Time_ID BIGINT,
    Severity_ID BIGINT,
    Location_ID BIGINT,
    Road_Condition_ID BIGINT,
    Crossing_ID BIGINT,
    Number_Of_Casualties INT,
    Number_Of_OAPs INT,
    Number_Of_Children INT,
    Cycles_Involved INT,
    P2W_Involved INT, 
    Pedestrians_Involved INT, 
    Motor_Vehicles_Involved INT,
    FOREIGN KEY (Date_ID) REFERENCES dim_date(Date_ID),
    FOREIGN KEY (Time_ID) REFERENCES dim_time(Time_ID),
    FOREIGN KEY (Severity_ID) REFERENCES dim_severity(Severity_ID),
    FOREIGN KEY (Location_ID) REFERENCES dim_location(Location_ID),
    FOREIGN KEY (Road_Condition_ID) REFERENCES dim_road_condition(Road_Condition_ID),
    FOREIGN KEY (Crossing_ID) REFERENCES dim_crossing(Crossing_ID)
);
