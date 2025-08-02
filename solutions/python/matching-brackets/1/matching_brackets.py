def is_paired(input_string):
    filtered = ''

    for char in input_string:
        if char in '{}()[]':
            filtered=filtered + char

    while '{}' in filtered or '()' in filtered or '[]' in filtered:
        if '[]' in filtered:
            filtered=filtered.replace('[]','')
        elif '()' in filtered:
            filtered=filtered.replace('()','') 
        elif '{}' in filtered:
            filtered=filtered.replace('{}','')

    return filtered == ''
    
