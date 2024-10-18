LOAD DATA INPATH '/user/hive/data/dim_crossing.csv' INTO TABLE dim_crossing;
LOAD DATA INPATH '/user/hive/data/dim_date.csv' INTO TABLE dim_date;
LOAD DATA INPATH '/user/hive/data/dim_location.csv' INTO TABLE dim_location;
LOAD DATA INPATH '/user/hive/data/dim_road_condition.csv' INTO TABLE dim_road_condition;
LOAD DATA INPATH '/user/hive/data/dim_severity.csv' INTO TABLE dim_severity;
LOAD DATA INPATH '/user/hive/data/dim_time.csv' INTO TABLE dim_time;
LOAD DATA INPATH '/user/hive/data/fact_incidents.csv' INTO TABLE fact_incidents;
