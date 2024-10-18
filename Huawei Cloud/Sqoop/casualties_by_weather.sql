***Export casualties_by_weather to MySQL RDS***

sqoop export \
--connect "jdbc:mysql://your-rds-host:3306/rds-mrs" \
--username root --password your_password \
--table casualties_by_weather \
--export-dir /user/hive/warehouse/analysis_layer.db/casualties_by_weather \
--input-fields-terminated-by '\001';
