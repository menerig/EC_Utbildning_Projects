import random

# Generates passwords for video store customers which they would use 
# to log into the store webpage
def password_generator():

    letters = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
    'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x',
    'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 
    'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
    numbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
    symbols = ['!', '#', '$', '%', '&', '(', ')', '*', '+']

# A range of symbols, letters, and numbers are generated and added to the list below
    password_list = []

    for char in range(1, 4):
        password_list.append(random.choice(letters))

    for char in range(1, 4):
        password_list += random.choice(symbols)

    for char in range(1, 3):
        password_list += random.choice(numbers)

# the list is shuffled to add more 'randomness' to the result
    random.shuffle(password_list)

# remove all spaces and quotation marks so the result is a single string
    password = ""
    for char in password_list:
        password += char

    return password
