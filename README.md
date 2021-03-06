# Ejections

In sports competition, emotions tend to run high. Sometimes, a player or coach may become so incensed that they are removed from the game, ejected by officiating personnel. It is quite possible that such a change in the competitive dynamics would be likely to reduce a team’s performance in the short term: if a key player or manager is ejected from the match, a lesser athlete or coach may be required to fill this role temporarily. However, it is also theoretically possible for ejections to serve strategically beneficial purposes as well, especially ejections of managers or coaches: a manager might initiate an argument with an official with the objective of getting ejected in order to “fire up” his players and improve their performance for the remainder of the game. So, **do ejections improve or worsen a team’s performance in the short run?**

This project seeks to investigate this puzzle within the context of baseball. This research topic falls within the field of baseball analytics, and answering my research question would be of strategic interest to a team seeking to optimize its in-game performance. Depending on whether an ejection causes a team to perform better or worse, it may make sense for a manager to bite his tongue, rather than engaging an umpire in an argument. However, it may also be the case that the effect of an ejection on team performance is dependent on what role the individual plays on the team or how much he contributes to the team’s success. 


## Set-Up Instructions

Borrowed heavily from bedward's code for [setting up a Postgres database](https://github.com/bedwards/baseball_analysis/tree/master/retrosheet).

##### Prerequisites

* BEVENT.EXE
* Postgres
* Homebrew and Wine

##### 1. Download raw play-by-play data from Retrosheet

```
$ bash download_raw_data.sh
```

##### 2. Generate one CSV containing all ejection records

```
$ python generate_ejection_data.py
```

##### 3. Prepare event data using Retrosheet's `BEVENT.EXE` tool (first navigating to the `data/` directory with the TEAM files and copying `prepare_event_data.sh` to this folder before executing this script in `/data`)

```
$ cd data/
$ wget http://www.retrosheet.org/bevent.zip
$ unzip bevent.zip
$ cp ../prepare_event_data.sh prepare_event_data.sh
$ bash prepare_event_data.sh
$ wc -l event_ingest.csv #3081570 rows 
```

##### 4. Initialize `baseball-ejections-data` database and set up schemas

```
$ bash initialize_database.sh
```

##### 5. Import `event_ingest.csv` and `ejection_ingest.csv` data into `_raw` and intermediate tables (`event` and `ejection`), and insert data into `event_ejection_stage` and `event_final` tables

```
$ bash import_data.sh
```

##### 6. Update with missing ejection data for 7 team-seasons, and update with 2016 event and ejection data

```
to do
```

## Resources

* The [Retrosheet Event File documentation](http://www.retrosheet.org/eventfile.htm) is very helpful for decoding pitch sequence or event text codes.
* Link to Retrosheet [play-by-play data](http://www.retrosheet.org/eventfile.htm). 

## Notes

* Explore synthetic controls, and other identification strategies.
* Generate summary statistics, for example means difference of runs scored/allowed comparing before versus after an ejection.
* Useful overview of how to use the [BEVENT.EXE tool](http://www.pitchbypitch.com/tag/bevent/).













