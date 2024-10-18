***Export monthly_incident_trends to MySQL RDS***

sqoop export \
--connect "jdbc:mysql://your-rds-host:3306/rds-mrs" \
--username root --password your_password \
--table monthly_incident_trends \
--export-dir /user/hive/warehouse/analysis_layer.db/monthly_incident_trends \
--input-fields-terminated-by '\001';
