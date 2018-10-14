# lets put all the students into an array
students = [
    "Dr. Hannibal Lecter",
    "Darth Vader",
    "Nurse Ratched",
    "Michael Corleone",
    "Alex DeLarge",
    "The Wicked Witch of the West",
    "Terminator",
    "Freddy Krueger",
    "The Joker",
    "Joffrey Baratheon",
    "Norman Bates"
]

# and then print them
def print_header
puts "The students of Villain Academy"
puts "-------------------------------"
end 

def print(names)
names.each { |names| puts names }
end

def print_footer(names)
puts "Overall, we have #{names.count} great students"
end

# nothing happens until we call the methods
print_header
print(students)
print_footer(students)