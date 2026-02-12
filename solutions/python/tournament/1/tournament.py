def update_points(tournament, team, status):
    row=tournament[team]
    #print(row)
    if status=='win':
        row=(row[0]+1,row[1]+1,row[2],row[3],row[4]+3)
    elif status=='loss':
        row=(row[0]+1,row[1],row[2],row[3]+1,row[4])
    elif status=='draw':
        row=(row[0]+1,row[1],row[2]+1,row[3],row[4]+1)
    tournament[team]=row

def dict_entry_to_line(k, v):
    name=k
    games=v[0]
    wins=v[1]
    draws=v[2]
    losses=v[3]
    points=v[4]
    pad=31
    npad=1
    line = f"{name.ljust(pad, ' ')}|  {str(games).ljust(npad, ' ')} |  {wins} |  {draws} |  {losses} | {str(points).rjust(2)}"
    return line
        

def tally(rows):
    table = ["Team                           | MP |  W |  D |  L |  P"]
    if rows==[]:
        return table
    else:
        tab=dict()
        for row in rows:
            row_list=row.split(';')
            #Check or create the teams on the dictionary
            if row_list[0] not in tab.keys():
                tab[row_list[0]]=(0,0,0,0,0)
            if row_list[1] not in tab.keys():
                tab[row_list[1]]=(0,0,0,0,0)
            #update the dictionary entry
            if row_list[2]=='win':
                update_points(tab, row_list[0],'win')
                update_points(tab, row_list[1],'loss')
            elif row_list[2]=='draw':
                update_points(tab, row_list[0],'draw')
                update_points(tab, row_list[1],'draw')
            elif row_list[2]=='loss':
                update_points(tab, row_list[1],'win')
                update_points(tab, row_list[0],'loss')
        #Sort the dictionary
        sorted_items = sorted(
            tab.items(),
            key=lambda item: (-item[1][-1], item[0])
        )

        sorted_tab=dict(sorted_items)
        #Format the dictionary and return
        for key in sorted_tab.keys():
            table.append(dict_entry_to_line(key, sorted_tab[key]))
        return table
                
            
            
            
