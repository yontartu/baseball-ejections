for filename in `ls ~/Box_Sync_OLD/GitHub/Springboard/Capstone_Project/Analysis/data/*.EV*`
do
  year=`echo $filename | grep -Eo '[[:digit:]]{4}'`
  file=`echo $filename | grep -o '...........$'`
  echo $year
  echo $file
  wine BEVENT.EXE -y $year -f 0-96 $file >> event_ingest.csv
done


