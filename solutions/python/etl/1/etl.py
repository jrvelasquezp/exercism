def transform(legacy_data):
    data = {}
    for key in legacy_data:
        values = legacy_data.get(key)
        for letter in values:
            data[letter.lower()]=key

    return data
