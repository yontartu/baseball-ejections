--drop table if exists event_final;
--create table event_final(


--)

/*** STEP 1: Insert ejection_stage data into event_final ***/
/*** STEP 2: Insert event_stage date into event_final ***/

--drop table if exists event_test;

create table event_test(
  event_uid varchar(255),
  game_id varchar(12) not null,
  game_date date not null,
  game_year integer not null,
  game_month integer not null,
  game_day_of_month integer not null,
  game_number integer not null,
  home_team_id varchar(3) not null,
  away_team_id varchar(3),
  inn_ct integer not null,
  bat_home_id boolean not null,
  half_inning_id varchar(255) not null,
  outs_ct integer,
  balls_ct integer,
  strikes_ct integer,
  pitch_seq_tx varchar(255),
  away_score_ct integer,
  home_score_ct integer,
  runs integer,
  bat_id varchar(8) not null,
  bat_hand_cd hand_cd_type,
  resp_bat_id varchar(8),
  resp_bat_hand_cd hand_cd_type,
  pit_id varchar(8),
  pit_hand_cd hand_cd_type,
  resp_pit_id varchar(8),
  resp_pit_hand_cd hand_cd_type,
  pos2_fld_id varchar(8),
  pos3_fld_id varchar(8),
  pos4_fld_id varchar(8),
  pos5_fld_id varchar(8),
  pos6_fld_id varchar(8),
  pos7_fld_id varchar(8),
  pos8_fld_id varchar(8),
  pos9_fld_id varchar(8),
  base1_run_id varchar(8),
  base2_run_id varchar(8),
  base3_run_id varchar(8),
  event_tx varchar(255) not null,
  leadoff_fl boolean,
  ph_fl boolean,
  bat_fld_cd integer,
  bat_lineup_id integer,
  event_cd integer,
  bat_event_fl boolean,
  ab_fl boolean,
  h_fl integer,
  sh_fl boolean,
  sf_fl boolean,
  event_outs_ct integer,
  dp_fl boolean,
  tp_fl boolean,
  rbi_ct integer,
  wp_fl boolean,
  pb_fl boolean,
  fld_cd integer,
  battedball_cd battedball_cd_type,
  bunt_fl boolean,
  foul_fl boolean,
  battedball_loc_tx varchar(255),
  err_ct integer,
  err1_fld_cd integer,
  err1_cd err_cd_type,
  err2_fld_cd integer,
  err2_cd err_cd_type,
  err3_fld_cd integer,
  err3_cd err_cd_type,
  bat_dest_id integer,
  run1_dest_id integer,
  run2_dest_id integer,
  run3_dest_id integer,
  runs_scored integer,
  bat_play_tx varchar(255),
  run1_play_tx varchar(255),
  run2_play_tx varchar(255),
  run3_play_tx varchar(255),
  run1_sb_fl boolean,
  run2_sb_fl boolean,
  run3_sb_fl boolean,
  run1_cs_fl boolean,
  run2_cs_fl boolean,
  run3_cs_fl boolean,
  run1_pk_fl boolean,
  run2_pk_fl boolean,
  run3_pk_fl boolean,
  run1_resp_pit_id varchar(8),
  run2_resp_pit_id varchar(8),
  run3_resp_pit_id varchar(8),
  game_new_fl boolean,
  game_end_fl boolean,
  pr_run1_fl boolean,
  pr_run2_fl boolean,
  pr_run3_fl boolean,
  removed_for_pr_run1_id varchar(8),
  removed_for_pr_run2_id varchar(8),
  removed_for_pr_run3_id varchar(8),
  removed_for_ph_bat_id varchar(8),
  removed_for_ph_bat_fld_cd integer,
  po1_fld_cd integer,
  po2_fld_cd integer,
  po3_fld_cd integer,
  ass1_fld_cd integer,
  ass2_fld_cd integer,
  ass3_fld_cd integer,
  ass4_fld_cd integer,
  ass5_fld_cd integer,
  event_id integer,
  ej_code varchar(3),
  ejectee varchar(50),
  job_code varchar(2),
  ump_id varchar(50),
  reason varchar(255),
  event_id_new integer,
  event_uid_new varchar(255) 
);


--insert into event_test
--select 
  null as event_uid,
  game_id_ej,
  date(substring(game_id_ej from 4 for 8)) as game_date,
  substring(game_id_ej from 4 for 4)::integer as game_year,
  substring(game_id_ej from 8 for 2)::integer as game_month,
  substring(game_id_ej from 10 for 2)::integer as game_day_of_month,
  substring(game_id_ej from 12 for 1)::integer as game_number,
  substring(game_id_ej from 1 for 3) as home_team_id,
  null as away_team_id,
  inn_ct_ej::integer,
  bat_home_id_ej::boolean,
  game_id_ej || to_char(inn_ct_ej::integer, 'FM00') || bat_home_id_ej::integer as half_inning_id,
  outs_ct_ej::integer,
  null balls_ct,
  null strikes_ct,
  nullif(pitch_seq_tx_ej, ''),
  null as away_score_ct,
  null as home_score_ct,
  null as runs,
  bat_id_ej,
  null as bat_hand_cd,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  event_tx_ej,
  null,
  null,
  null,
  bat_lineup_id_ej,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  ej_code,
  ejectee,
  job_code,
  ump_id,
  reason,
  null,
  null
from 
  ejections_testing
where game_id_ej = 'CHN200005290' or game_id_ej = 'ATL200005210'
;


--insert into event_test
select
  game_id || to_char(event_id::integer, 'FM000') as event_uid,
  game_id,
  date(substring(game_id from 4 for 8)) as game_date,
  substring(game_id from 4 for 4)::integer as game_year,
  substring(game_id from 8 for 2)::integer as game_month,
  substring(game_id from 10 for 2)::integer as game_day_of_month,
  substring(game_id from 12 for 1)::integer as game_number,
  substring(game_id from 1 for 3) as home_team_id,
  away_team_id,
  inn_ct::integer,
  bat_home_id::boolean,
  game_id || to_char(inn_ct::integer, 'FM00') || bat_home_id as half_inning_id,
  outs_ct::integer,
  balls_ct::integer,
  strikes_ct::integer,
  nullif(pitch_seq_tx, ''),
  away_score_ct::integer,
  home_score_ct::integer,
  away_score_ct::integer + home_score_ct::integer as runs,
  bat_id,
  nullif(bat_hand_cd, '?')::hand_cd_type,
  resp_bat_id,
  nullif(resp_bat_hand_cd, '?')::hand_cd_type,
  pit_id,
  pit_hand_cd::hand_cd_type,
  resp_pit_id,
  resp_pit_hand_cd::hand_cd_type,
  pos2_fld_id,
  pos3_fld_id,
  pos4_fld_id,
  pos5_fld_id,
  pos6_fld_id,
  pos7_fld_id,
  pos8_fld_id,
  pos9_fld_id,
  nullif(base1_run_id, ''),
  nullif(base2_run_id, ''),
  nullif(base3_run_id, ''),
  event_tx,
  leadoff_fl::boolean,
  ph_fl::boolean,
  bat_fld_cd::integer,
  bat_lineup_id::integer,
  event_cd::integer,
  bat_event_fl::boolean,
  ab_fl::boolean,
  h_fl::integer,
  sh_fl::boolean,
  sf_fl::boolean,
  event_outs_ct::integer,
  dp_fl::boolean,
  tp_fl::boolean,
  rbi_ct::integer,
  wp_fl::boolean,
  pb_fl::boolean,
  fld_cd::integer,
  nullif(battedball_cd, '')::battedball_cd_type,
  bunt_fl::boolean,
  foul_fl::boolean,
  nullif(battedball_loc_tx, ''),
  err_ct::integer,
  err1_fld_cd::integer,
  err1_cd::err_cd_type,
  err2_fld_cd::integer,
  err2_cd::err_cd_type,
  err3_fld_cd::integer,
  err3_cd::err_cd_type,
  bat_dest_id::integer,
  run1_dest_id::integer,
  run2_dest_id::integer,
  run3_dest_id::integer,
  (bat_dest_id::integer > 3)::integer + (run1_dest_id::integer > 3)::integer + (run2_dest_id::integer > 3)::integer + (run3_dest_id::integer > 3)::integer as runs_scored,
  nullif(bat_play_tx, ''),
  nullif(run1_play_tx, ''),
  nullif(run2_play_tx, ''),
  nullif(run3_play_tx, ''),
  run1_sb_fl::boolean,
  run2_sb_fl::boolean,
  run3_sb_fl::boolean,
  run1_cs_fl::boolean,
  run2_cs_fl::boolean,
  run3_cs_fl::boolean,
  run1_pk_fl::boolean,
  run2_pk_fl::boolean,
  run3_pk_fl::boolean,
  nullif(run1_resp_pit_id, ''),
  nullif(run2_resp_pit_id, ''),
  nullif(run3_resp_pit_id, ''),
  game_new_fl::boolean,
  game_end_fl::boolean,
  pr_run1_fl::boolean,
  pr_run2_fl::boolean,
  pr_run3_fl::boolean,
  nullif(removed_for_pr_run1_id, ''),
  nullif(removed_for_pr_run2_id, ''),
  nullif(removed_for_pr_run3_id, ''),
  nullif(removed_for_ph_bat_id, ''),
  nullif(removed_for_ph_bat_fld_cd, '0')::integer,
  po1_fld_cd::integer,
  po2_fld_cd::integer,
  po3_fld_cd::integer,
  ass1_fld_cd::integer,
  ass2_fld_cd::integer,
  ass3_fld_cd::integer,
  ass4_fld_cd::integer,
  ass5_fld_cd::integer,
  event_id::integer
from
  event_ingest ev
where game_id = 'CHN200005290' or game_id = 'ATL200005210'
;

select * from event_test;

/* testing query */
select *
  , rank() over (partition by game_id order by half_inning_id, outs_ct, bat_lineup_id, balls_ct, ejectee) as event_id_newx 
  , game_id || to_char( (rank() over (partition by game_id order by half_inning_id, outs_ct, bat_lineup_id, balls_ct,   
  	ejectee))::integer,'FM000') as event_uid_newx
from event_test
order by event_uid_newx
;
-- 67 rows, now looks like i was able to successfully embed the "ejection events" into row sequence
-- Now: need to create a new event_id column, which will be used to create a new event_uid column (i.e. a record_id)



update event_test ev
set ej_code = (select ej_code from ejections2 ej where game_id = 'CHN200005290' or game_id = 'ATL200005210')
   	where ev.game_id = ej.game_id_ej
   	and ev.home_team_id = ej.home_team_id_ej
	and ev.inn_ct = ej.inn_ct_ej
	and ev.bat_home_id = ej.bat_home_id_ej
	and ev.bat_id = ej.bat_id_ej
	and ev.pitch_seq_tx = ej.pitch_seq_tx_ej
	and ev.event_tx = ej.event_tx_ej
;



/**************************************************************************************/
-- event_test_final
/**************************************************************************************/
--drop table if exists event_test_final;

create table event_test_final(
  event_uid varchar(255) primary key,
  game_id varchar(12) not null,
  game_date date not null,
  game_year integer not null,
  game_month integer not null,
  game_day_of_month integer not null,
  game_number integer not null,
  home_team_id varchar(3) not null,
  away_team_id varchar(3),
  inn_ct integer not null,
  bat_home_id boolean not null,
  half_inning_id varchar(255) not null,
  outs_ct integer,
  balls_ct integer,
  strikes_ct integer,
  pitch_seq_tx varchar(255),
  away_score_ct integer,
  home_score_ct integer,
  runs integer,
  bat_id varchar(8) not null,
  bat_hand_cd hand_cd_type,
  resp_bat_id varchar(8),
  resp_bat_hand_cd hand_cd_type,
  pit_id varchar(8),
  pit_hand_cd hand_cd_type,
  resp_pit_id varchar(8),
  resp_pit_hand_cd hand_cd_type,
  pos2_fld_id varchar(8),
  pos3_fld_id varchar(8),
  pos4_fld_id varchar(8),
  pos5_fld_id varchar(8),
  pos6_fld_id varchar(8),
  pos7_fld_id varchar(8),
  pos8_fld_id varchar(8),
  pos9_fld_id varchar(8),
  base1_run_id varchar(8),
  base2_run_id varchar(8),
  base3_run_id varchar(8),
  event_tx varchar(255) not null,
  leadoff_fl boolean,
  ph_fl boolean,
  bat_fld_cd integer,
  bat_lineup_id integer,
  event_cd integer,
  bat_event_fl boolean,
  ab_fl boolean,
  h_fl integer,
  sh_fl boolean,
  sf_fl boolean,
  event_outs_ct integer,
  dp_fl boolean,
  tp_fl boolean,
  rbi_ct integer,
  wp_fl boolean,
  pb_fl boolean,
  fld_cd integer,
  battedball_cd battedball_cd_type,
  bunt_fl boolean,
  foul_fl boolean,
  battedball_loc_tx varchar(255),
  err_ct integer,
  err1_fld_cd integer,
  err1_cd err_cd_type,
  err2_fld_cd integer,
  err2_cd err_cd_type,
  err3_fld_cd integer,
  err3_cd err_cd_type,
  bat_dest_id integer,
  run1_dest_id integer,
  run2_dest_id integer,
  run3_dest_id integer,
  runs_scored integer,
  bat_play_tx varchar(255),
  run1_play_tx varchar(255),
  run2_play_tx varchar(255),
  run3_play_tx varchar(255),
  run1_sb_fl boolean,
  run2_sb_fl boolean,
  run3_sb_fl boolean,
  run1_cs_fl boolean,
  run2_cs_fl boolean,
  run3_cs_fl boolean,
  run1_pk_fl boolean,
  run2_pk_fl boolean,
  run3_pk_fl boolean,
  run1_resp_pit_id varchar(8),
  run2_resp_pit_id varchar(8),
  run3_resp_pit_id varchar(8),
  game_new_fl boolean,
  game_end_fl boolean,
  pr_run1_fl boolean,
  pr_run2_fl boolean,
  pr_run3_fl boolean,
  removed_for_pr_run1_id varchar(8),
  removed_for_pr_run2_id varchar(8),
  removed_for_pr_run3_id varchar(8),
  removed_for_ph_bat_id varchar(8),
  removed_for_ph_bat_fld_cd integer,
  po1_fld_cd integer,
  po2_fld_cd integer,
  po3_fld_cd integer,
  ass1_fld_cd integer,
  ass2_fld_cd integer,
  ass3_fld_cd integer,
  ass4_fld_cd integer,
  ass5_fld_cd integer,
  event_id integer,
  ej_code varchar(3),
  ejectee varchar(50),
  job_code varchar(2),
  ump_id varchar(50),
  reason varchar(255)
--  event_id_new integer,
--  event_uid_new varchar(255) 
);

insert into event_test_final
select
  game_id || to_char( (rank() over (partition by game_id order by half_inning_id, outs_ct, bat_lineup_id, balls_ct,   
  	ejectee))::integer,'FM000') as event_uid,
  game_id,
  game_date,
  game_year,
  game_month,
  game_day_of_month,
  game_number,
  home_team_id,
  away_team_id,
  inn_ct,
  bat_home_id,
  half_inning_id,
  outs_ct,
  balls_ct,
  strikes_ct,
  pitch_seq_tx,
  away_score_ct,
  home_score_ct,
  runs,
  bat_id,
  bat_hand_cd,
  resp_bat_id,
  resp_bat_hand_cd,
  pit_id,
  pit_hand_cd,
  resp_pit_id,
  resp_pit_hand_cd,
  pos2_fld_id,
  pos3_fld_id,
  pos4_fld_id,
  pos5_fld_id,
  pos6_fld_id,
  pos7_fld_id,
  pos8_fld_id,
  pos9_fld_id,
  base1_run_id,
  base2_run_id,
  base3_run_id,
  event_tx,
  leadoff_fl,
  ph_fl,
  bat_fld_cd,
  bat_lineup_id,
  event_cd,
  bat_event_fl,
  ab_fl,
  h_fl,
  sh_fl,
  sf_fl,
  event_outs_ct,
  dp_fl,
  tp_fl,
  rbi_ct,
  wp_fl,
  pb_fl,
  fld_cd,
  battedball_cd,
  bunt_fl,
  foul_fl,
  battedball_loc_tx,
  err_ct,
  err1_fld_cd,
  err1_cd,
  err2_fld_cd,
  err2_cd,
  err3_fld_cd,
  err3_cd,
  bat_dest_id,
  run1_dest_id,
  run2_dest_id,
  run3_dest_id,
  runs_scored,
  bat_play_tx,
  run1_play_tx,
  run2_play_tx,
  run3_play_tx,
  run1_sb_fl,
  run2_sb_fl,
  run3_sb_fl,
  run1_cs_fl,
  run2_cs_fl,
  run3_cs_fl,
  run1_pk_fl,
  run2_pk_fl,
  run3_pk_fl,
  run1_resp_pit_id,
  run2_resp_pit_id,
  run3_resp_pit_id,
  game_new_fl,
  game_end_fl,
  pr_run1_fl,
  pr_run2_fl,
  pr_run3_fl,
  removed_for_pr_run1_id,
  removed_for_pr_run2_id,
  removed_for_pr_run3_id,
  removed_for_ph_bat_id,
  removed_for_ph_bat_fld_cd,
  po1_fld_cd,
  po2_fld_cd,
  po3_fld_cd,
  ass1_fld_cd,
  ass2_fld_cd,
  ass3_fld_cd,
  ass4_fld_cd,
  ass5_fld_cd,
  rank() over (partition by game_id order by half_inning_id, outs_ct, bat_lineup_id, balls_ct, ejectee) as event_id, 
  ej_code,
  ejectee,
  job_code,
  ump_id,
  reason  
from
  event_test 
where game_id = 'CHN200005290' or game_id = 'ATL200005210'
;

select * from event_test_final; -- This worked (almost perfectly)!

/**************************************************************************************/
-- ejection_testing
/**************************************************************************************/

--drop table if exists ejections_testing;

create table ejections_testing (
  game_id_ej varchar(24) not null,
  game_date_ej date not null,
  home_team_id_ej varchar(3) not null,
  inn_ct_ej integer not null,
  bat_home_id_ej boolean not null,
  bat_id_ej varchar(8) not null,
  pitch_seq_tx_ej varchar(255),
  event_tx_ej varchar(255) not null,
  ej_code varchar (8) not null,
  ejectee varchar (24) not null,
  job_code varchar (8),
  ump_id varchar(24) not null,
  reason varchar(255),
  outs_ct_ej integer,
  bat_lineup_id_ej integer
);  

insert into ejections_testing
select distinct 
  ej.*, 
  ev.outs_ct, 
  ev.bat_lineup_id
from ejections2 ej
left join event_test ev
	on ev.game_id = ej.game_id_ej
   	and ev.home_team_id = ej.home_team_id_ej
	and ev.inn_ct = ej.inn_ct_ej
	and ev.bat_home_id = ej.bat_home_id_ej
	and ev.bat_id = ej.bat_id_ej
	and ev.pitch_seq_tx = ej.pitch_seq_tx_ej
	and ev.event_tx = ej.event_tx_ej
--where game_id = 'CHN200005290' or game_id = 'BOS200007230'
and outs_ct is not null
;

select * from event_test where game_id = 'CHN200005290' or game_id = 'ATL200005210'; 
select * from event where game_id = 'CHN200005290' or game_id = 'ATL200005210';
select * from ejections_testing where game_id_ej = 'CHN200005290' or game_id_ej = 'ATL200005210';

select *
from ejections2
where game_id_ej = 'CHN200005290' or game_id_ej = 'BOS200007230'
;

-- START: next session here
select distinct 
  ej.*, 
  ev.outs_ct, 
  ev.bat_lineup_id
from ejections2 ej
left join event ev
	on ev.game_id = ej.game_id_ej
   	and ev.home_team_id = ej.home_team_id_ej
	and ev.inn_ct = ej.inn_ct_ej
	and ev.bat_home_id = ej.bat_home_id_ej
	and ev.bat_id = ej.bat_id_ej
--	and ev.pitch_seq_tx = ej.pitch_seq_tx_ej
	and ev.event_tx = ej.event_tx_ej
where game_id = 'BOS200007230'
;



select *
from event ev
--left join ejections2 ej
--	on ev.game_id = ej.game_id_ej
--	and ev.home_team_id = ej.home_team_id_ej
--	and ev.inn_ct = ej.inn_ct_ej
--	and ev.bat_home_id = ej.bat_home_id_ej
--	and ev.bat_id = ej.bat_id_ej
----	and ev.pitch_seq_tx = ej.pitch_seq_tx_ej
----	and ev.event_tx = ej.event_tx_ej
where game_id = 'ANA200004240'
and ev.bat_id = 'kenna001'
-- 85 rows
;

select *
from event ev
full outer join ejections2 ej
	on ev.game_id = ej.game_id_ej
	and ev.home_team_id = ej.home_team_id_ej
	and ev.inn_ct = ej.inn_ct_ej
	and ev.bat_home_id = ej.bat_home_id_ej
	and ev.bat_id = ej.bat_id_ej
	and ev.pitch_seq_tx = ej.pitch_seq_tx_ej
	and ev.event_tx = ej.event_tx_ej
where game_id = 'CHN200005290'
;





