### Ejections

In sports competition, emotions tend to run high. Sometimes, a player or coach may become so incensed that they are removed from the game, ejected by officiating personnel. It is quite possible that such a change in the competitive dynamics would be likely to reduce a team’s performance in the short term: if a key player or manager is ejected from the match, a lesser athlete or coach may be required to fill this role temporarily. However, it is also theoretically possible for ejections to serve strategically beneficial purposes as well, especially ejections of managers or coaches: a manager might initiate an argument with an official with the objective of getting ejected in order to “fire up” his players and improve their performance for the remainder of the game. So, **do ejections improve or worsen a team’s performance in the short run?**

This project seeks to investigate this puzzle within the context of baseball. This research topic falls within the field of baseball analytics, and answering my research question would be of strategic interest to a team seeking to optimize its in-game performance. Depending on whether an ejection causes a team to perform better or worse, it may make sense for a manager to bite his tongue, rather than engaging an umpire in an argument. However, it may also be the case that the effect of an ejection on team performance is dependent on what role the individual plays on the team or how much he contributes to the team’s success. 

* Data: Play-by-play data from 16 MLB seasons (2000 through 2015). Link to data source: [Retrosheet play-by-play data](http://www.retrosheet.org/eventfile.htm). 
* Next steps: Finish loading data into a PostgreSQL database, and generate summary statistics such as means difference of runs scored/allowed comparing before versus after an ejection.

### Set-up Instructions

Borrowed heavily from bedward's code for [setting up a Postgres database](https://github.com/yontartu/baseball_analysis/tree/master/retrosheet).
