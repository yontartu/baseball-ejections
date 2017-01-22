for filename in `ls ~/Box_Sync/GitHub/Springboard/Capstone_Project/Analysis/data/*.EV*`
do
  year=`echo $filename | grep -Eo '[[:digit:]]{4}'`
  wine ~/Box_Sync/GitHub/Springboard/Capstone_Project/Analysis/data/BEVENT.EXE -y $year -f 0-96 $filename > event_ingest.csv
done