# Ejections

In sports competition, emotions tend to run high. Sometimes, a player or coach may become so incensed that they are removed from the game, ejected by officiating personnel. It is quite possible that such a change in the competitive dynamics would be likely to reduce a team’s performance in the short term: if a key player or manager is ejected from the match, a lesser athlete or coach may be required to fill this role temporarily. However, it is also theoretically possible for ejections to serve strategically beneficial purposes as well, especially ejections of managers or coaches: a manager might initiate an argument with an official with the objective of getting ejected in order to “fire up” his players and improve their performance for the remainder of the game. So, **do ejections improve or worsen a team’s performance in the short run?**

This project seeks to investigate this puzzle within the context of baseball. This research topic falls within the field of baseball analytics, and answering my research question would be of strategic interest to a team seeking to optimize its in-game performance. Depending on whether an ejection causes a team to perform better or worse, it may make sense for a manager to bite his tongue, rather than engaging an umpire in an argument. However, it may also be the case that the effect of an ejection on team performance is dependent on what role the individual plays on the team or how much he contributes to the team’s success. 

* Data: Play-by-play data from 16 MLB seasons (2000 through 2015). Link to data source: [Retrosheet play-by-play data](http://www.retrosheet.org/eventfile.htm). 
* Next steps: Finish loading data into a PostgreSQL database, and generate summary statistics such as means difference of runs scored/allowed comparing before versus after an ejection.

## Set-Up Instructions

##### Prerequisites

*  
*
*

Borrowed heavily from bedward's code for [setting up a Postgres database](https://github.com/bedwards/baseball_analysis/tree/master/retrosheet).

##### 1. Download raw play-by-play data from Retrosheet

`bash download_raw_data.sh`

##### 2. Generate one CSV containing all ejection records

`python generate_ejection_data.py`

##### 3. Initialize `baseball-ejections` database and set up schemas

`bash initialize_database.sh`

##### 4. Prepare event data using Retrosheet's `BEVENT.exe` tool (after first navigating to the `/data` directory with the TEAM files and coping `prepare_event_data.sh` to this folder)

`cd /path/to/data/`
`mv ../prepare_event_data.sh prepare_event_data.sh`
`bash prepare_event_data.sh`

##### 5. Import `event_ingest.csv` and `ejection_ingest.csv` data, and insert data into `event_ejection_stage` and `event_final` tables

`bash import_ ...`



##### 6. Update with missing ejection data for 7 team-seasons, and update with 2016 event and ejection data









##### 1. Start with the original bedwards tables for ingesting raw data using BEVENT.exe, **event_ingest** 

##### 2. In Jupyter, using the gen_ejection_data function, create a flat file of ejections data (something like **ejection_ingest.csv**) to pull into Postgres (as **ejection_ingest**)
	* Using the updated version of the function, this will recode the event_tx_ej column to correctly exclude any “NP” records
	* See bedwards’ code for how to do insert data from CSV into Postgres: `copy ejections_stage from ‘/full/path/to/ejections_ingest.csv’ csv;`

##### 3. Create **event_ejection_stage** table: 
    * Initialize a blank table with the right variable types.
    * Insert ejection records from **ejection_ingest**.
    * Insert event records from **event_ingest**.

##### 4. Create **event_final** table:
    * Initialize a blank table with the right variable types.
    * Insert all records (event records and ejections records) from **event_ejection_stage**, adding two new calculated fields with window functions:
    	* event_uid
        * event_id


## Resources

* The [Retrosheet Event File documentation](http://www.retrosheet.org/eventfile.htm) is very helpful for decoding pitch sequence or event text codes.

## Notes

* Synthetic controls: talk with Chris about other identification strategies
* Update with 2016 data
* Update 
* Preliminary steps: download BEVENT.exe, install wine using homebrew
* download BEVENT.EXE: 
	* wget http://www.retrosheet.org/bevent.zip -P data/
	* unzip 'data/bevent.zip' -d data/
* put prepare_event_data.sh, bevent.exe, teamfiles and eventfiles in the same director!!!
* http://www.pitchbypitch.com/tag/bevent/












