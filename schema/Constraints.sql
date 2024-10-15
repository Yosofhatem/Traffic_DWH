ALTER TABLE dim_date MODIFY Date_ID INT PRIMARY KEY;

ALTER TABLE dim_time MODIFY Time_ID INT PRIMARY KEY;

ALTER TABLE dim_location MODIFY Location_ID INT PRIMARY KEY;

ALTER TABLE dim_severity MODIFY Severity_ID INT PRIMARY KEY;

ALTER TABLE dim_road_condition MODIFY Road_Condition_ID INT PRIMARY KEY;

ALTER TABLE dim_crossing MODIFY Crossing_ID INT PRIMARY KEY;



ALTER TABLE fact_incidents MODIFY Date_ID INT ;
ALTER TABLE fact_incidents MODIFY Time_ID INT ;
ALTER TABLE fact_incidents MODIFY Severity_ID INT ;
ALTER TABLE fact_incidents MODIFY Location_ID INT ;
ALTER TABLE fact_incidents MODIFY Road_Condition_ID INT ;
ALTER TABLE fact_incidents MODIFY Crossing_ID INT ;



ALTER TABLE fact_incidents 
    ADD CONSTRAINT fk_date_id FOREIGN KEY (Date_ID) REFERENCES dim_date(Date_ID),
    ADD CONSTRAINT fk_time_id FOREIGN KEY (Time_ID) REFERENCES dim_time(Time_ID),
    ADD CONSTRAINT fk_severity_id FOREIGN KEY (Severity_ID) REFERENCES dim_severity(Severity_ID),
    ADD CONSTRAINT fk_location_id FOREIGN KEY (Location_ID) REFERENCES dim_location(Location_ID),
    ADD CONSTRAINT fk_road_condition_id FOREIGN KEY (Road_Condition_ID) REFERENCES dim_road_condition(Road_Condition_ID),
    ADD CONSTRAINT fk_crossing_id FOREIGN KEY (Crossing_ID) REFERENCES dim_crossing(Crossing_ID);
