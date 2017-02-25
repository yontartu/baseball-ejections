# Create one ejection comment dataset, with rows from each year appended
# NOTE: RUNTIME IS APPX. 60 MINUTES 

import pandas as pd
import glob
from ejection_data_funcs import *


export_df = pd.DataFrame()

for filename in glob.iglob('data/*.EV*'):
    year = filename[:4]
    team = filename[4:7]
    print("\nSource Table: " + filename)
               
    raw_event_data = gen_ejection_data(filename)
    export_df = export_df.append(raw_event_data)

export_to_csv = export_df.to_csv('ejection_ingest_2000-2015.csv', index=False)


### Testing on a single file
#raw_event_data = gen_ejection_data('data/2012KCA.EVA')
#raw_event_data.to_csv('test_export.csv')
#print "Data successfully exported to CSV!"

