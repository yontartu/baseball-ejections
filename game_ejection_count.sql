select 	game_id, count(1) as ej_counts
from 	event_test_final a
where	exists

		( select distinct game_id
		from event_test_final b
		where a.game_id = b.game_id
		and ej_code is not null
		) 
and ej_code is not null
group by game_id
order by 2 desc
;



