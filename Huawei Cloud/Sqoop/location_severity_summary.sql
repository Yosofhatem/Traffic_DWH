***Export location_severity_summary to MySQL RDS***

sqoop export \
--connect "jdbc:mysql://your-rds-host:3306/rds-mrs" \
--username root --password your_password \
--table location_severity_summary \
--export-dir /user/hive/warehouse/analysis_layer.db/location_severity_summary \
--input-fields-terminated-by '\001';
