def seat_letters_generator(string, number):
    for i in range(0,number):
        yield string[i%len(string)]

def generate_seat_letters(number):
    seat_letter_list=seat_letters_generator("ABCD", number)
    return seat_letter_list

def seat_generator(number):
    letters_generator=generate_seat_letters(number)
    row=0
    for i in range(0,number):
        row=1+i//4
        if row>=13:
            row+=1
        yield str(row)+next(letters_generator)

def generate_seats(number):
    seat_list=seat_generator(number)
    return seat_list

def assign_seats(passengers):
    seats=list(generate_seats(len(passengers)))
    res = dict(zip(passengers,seats))
    return res

def code_generator(seat_numbers, flight_id):
    for seat in seat_numbers:
        yield seat+flight_id+('0'*(12-len(seat)-len(flight_id)))

def generate_codes(seat_numbers, flight_id):
    seat_ids=code_generator(seat_numbers,flight_id)
    return seat_ids
