def get_list_of_wagons(*args):
    list_of_wagons=[]
    *list_of_wagons,=*list_of_wagons,*args
    return list_of_wagons

def fix_list_of_wagons(each_wagons_id, missing_wagons):
    x,y,z,*wagons=each_wagons_id
    *each_wagons_id,=z,*missing_wagons,*wagons,x,y
    return each_wagons_id

def add_missing_stops(dict, **kwargs):
    *stops_list,=kwargs.values()
    stops_entry={'stops':stops_list}
    return {**dict,**stops_entry}

def extend_route_information(route, more_route_information):
    return {**route,**more_route_information}

def fix_wagon_depot(wagons_rows):
    lista=[]
    values=zip(*wagons_rows)
    for value in values:
      lista.append([*value])
    return lista
