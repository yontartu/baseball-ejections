cat data/event_ingest.csv | psql baseball-ejections -c "COPY event_ingest_raw FROM stdin CSV;"
cat ejection_ingest_2000-2015.csv | psql baseball-ejections -c "COPY ejection_ingest_raw FROM stdin CSV HEADER;"

psql baseball-ejections -f populate_data_from_raw.sql
psql baseball-ejections -f populate_final_data_from_stage.sql
