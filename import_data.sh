### DONE: 1, 3
#psql baseball-ejections-data -c "COPY event_ingest_raw FROM '/Users/danielgoodman/Box_Sync_OLD/GitHub/Springboard/Capstone_Project/Analysis/data/event_ingest.csv' CSV;"
#psql baseball-ejections-data -c "COPY ejection_ingest_raw FROM '/Users/danielgoodman/Box_Sync_OLD/GitHub/Springboard/Capstone_Project/Analysis/ejection_ingest_2000-2015.csv' CSV HEADER;"
#psql baseball-ejections-data -f populate_data_from_raw.sql 

psql baseball-ejections-data -f populate_final_data_from_stage.sql


#psql baseball-ejections-data -c "DROP TABLE ejection_ingest_raw"
#psql baseball-ejections-data -c "DROP TABLE event_ingest_raw"
