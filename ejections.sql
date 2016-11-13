drop table if exists ejections_ingest;

create table ejections_ingest (
  game_id varchar
  , inning varchar
  , batting_team varchar 
  , batter varchar
  , pitch_sequence varchar
  , event_text varchar
  , ejection_flag varchar
  , ejectee varchar 
  , job_code varchar
  , ump_id varchar
  , reason varchar


);

delete from ejections; 

drop table if exists ejections2;

create table ejections2 (
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
  reason varchar(255)
);

insert into ejections2
select
  game_id as game_id_ej,
  date(substring(game_id from 4 for 8)) as game_date_ej,
  substring(game_id from 1 for 3) as home_team_id_ej,
  inning::integer as inn_ct_ej,
  batting_team::boolean as bat_home_id_ej,
  batter as bat_id_ej,
  pitch_sequence as pitch_seq_tx_ej,
  event_text as event_tx_ej,
  ejection_flag as ej_code,
  ejectee,
  job_code,
  ump_id,
  reason  
from
  ejections_ingest
;