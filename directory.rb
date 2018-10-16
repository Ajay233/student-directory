# lets put all the students into an array

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp.capitalize
  # while name is not empty repeat this code
  while !name.empty?
    # add the student to the hash array
    students << {name: name, cohort: :november}
    puts "We now have #{students.count} students"
    # get another name from the user
    name = gets.chomp.capitalize
  end
  # return the array of students
  students
end

# and then print them
def print_header
  puts "The students of Villain Academy"
  puts "-------------------------------"
end

def print(names)
  i = 0
  length = names.length - 1
  # "Each" changed to an until loop
  until i >= length
  # Now prints a number before the name of each student
    # Now only prints names beginning with "D" & containing less than 12 letters
    if names[i][:name].start_with?("D") && names[i][:name].length < 12
      puts "#{i + 1}.#{names[i][:name]} (#{names[i][:cohort]} cohort)"
    end
  i += 1  
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)