import pandas as pd

# Define a function to label each row as a specific record type -- to use in .apply() 

def label_record(row):
    if row['a'][:3] == 'id,':
        return 'id'
    if row['a'][:5] == 'play,':
        return 'play'
    if row['a'][:8] == 'com,"ej,':
        return 'ejection comment'
    if row['a'][:3] == 'com':
        return 'other comment'
    return 'other'


# Define a function to generate a column of game_id's

def gen_id(row):
    if row['record_type'] == 'id':
        return row['a'][3:]


# Define a function to generate columns with individual data points from the play records

def gen_play(row, num): # num is the index of the list item of interest (i.e. of the items separated by commas)
    if row['record_type'] == 'play':
        return row['a'].split(',')[num]


# Define a function to generate columns with individual data points from ejection comments 

def gen_comment(row, num): # num is the index of the list item of interest (i.e. of the items separated by commas)
    if row['record_type'] == 'ejection comment':
        return row['a'].split(',')[num].strip('"')
    
# Define a function to create the ejection dataset for all years

def gen_ejection_data(filename):
    data = pd.read_table(filename, names='a')
    data = data[data.a.str[:3].isin(['id,','pla','com'])]
    data['record_type'] = data.apply(lambda row: label_record(row), axis=1)
    data['game_id'] = data.apply(lambda row: gen_id(row), axis=1).fillna(method='ffill')
       
    data['inning'] = data.apply(lambda row: gen_play(row, 1), axis=1)
    data['batting_team'] = data.apply(lambda row: gen_play(row, 2), axis=1)
    data['batter'] = data.apply(lambda row: gen_play(row, 3), axis=1)
    data['pitch_sequence'] = data.apply(lambda row: gen_play(row, 5), axis=1)
    data['event_text'] = data.apply(lambda row: gen_play(row, 6), axis=1)

    #print data[data['a'].str.startswith('com,"ej')]['a'].head(1)
    #print data[data['a'].str.startswith('com,"ej')]['a'].head(1).str.count(',')
    data['ejection_flag'] = data.apply(lambda row: gen_comment(row, 1), axis=1)
    data['ejectee'] = data.apply(lambda row: gen_comment(row, 2), axis=1)
    data['job_code'] = data.apply(lambda row: gen_comment(row, 3), axis=1)
    data['ump_id'] = data.apply(lambda row: gen_comment(row, 4), axis=1)
    
    try:
        data['reason'] = data.apply(lambda row: gen_comment(row, 5), axis=1)
    except IndexError as e: #catch ejection records that are missing data values
        print "There seems to be missing ejection data in {}, because {}".format(filename,e)
        ix = int(str(e[1][-6:]).lstrip('ex '))
        #print ix
        data.loc[ix]['ejection_flag'] = 'ej_ERROR'
        data['reason'] = 'FIXME'
        pass
    
    data = data.drop(data[data.event_text == 'NP'].index, axis=0)
    data = data.fillna(method='ffill')
    data = data[data.record_type == 'ejection comment']
    data = data.drop('a', axis=1)
    data = data.drop('record_type', axis=1)
    
    return data