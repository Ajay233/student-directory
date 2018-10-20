# This method makes sure either a valid month or blank string is entered
def cohort_validation(month)
  checks = ["January", "February","March", "April", "May", "June",
            "July", "August", "September", "October", "November",
            "December", ""]
  until checks.include?(month) == true
    puts "Please enter a valid month"
    month = gets.chomp.capitalize
  end
  month = "TBC" if month.empty?
  month.to_sym
end

# This method provides a default value of "TBC" if a blank string is entered
def default(input)
  input.map! do |hash|
    hash.each do |key, val|
      if hash[key] == :""
        hash[key] = :TBC
      elsif hash[key].empty?
        hash[key] = "TBC"
      end
    end
  end
end

# Put all the students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp.capitalize
  # while name is not empty repeat this code
  while !name.empty?
  # Get details of age, height, town, country, department, requirements etc
    puts "Please enter the cohort month"
    cohort = gets.chomp.capitalize
    cohort = cohort_validation(cohort)
    puts "Please enter thier age"
    age = gets.chomp
    puts "Please enter height in metres"
    height = gets.chomp
    puts "Please enter thier home town"
    town = gets.chomp.capitalize
    puts "Please enter thier country of birth"
    country = gets.chomp.capitalize
    puts "Please enter which Government department they are from"
    dept = gets.chomp.capitalize
    puts "Please enter any specialist requirements they have"
    requirements = gets.chomp.capitalize
    puts "Please enter any hobbies they have"
    hobbies = gets.chomp.capitalize
    
    # add the student details to the hash array
    students << {name: name, age: age, height: height, home_town: town,
                 country_of_birth: country, gov_dept: dept,
                 requirements: requirements, hobbies: hobbies, cohort: cohort}
    # catches any empty values and assigns "TBC" as the default value
    default(students)
    puts "We now have #{students.count} students"
    # get another name from the user
    name = gets.chomp.capitalize
  end
  # return the array of students
  students
end

# and then print them
def print_header
  puts "The students of Villain Academy".center(160)
  puts "-------------------------------".center(160)
end

def print(names)
  i = 0
  # "Each" changed to an until loop
  until i >= names.length
  # Now prints a number before the name of each student
    # Now only prints names beginning with "D" & containing less than 12 letters
    if names[i][:name].start_with?("D") && names[i][:name].length < 12
      puts "#{i + 1}.Name: #{names[i][:name]} (#{names[i][:cohort]} cohort)".center(160)
      puts "Age: #{names[i][:age]}".center(160)
      puts "Height: #{names[i][:height]} m".center(160)
      puts "Home Town: #{names[i][:home_town]}".center(160)
      puts "Birth Country: #{names[i][:country_of_birth]}".center(160)
      puts "Government Department: #{names[i][:gov_dept]}".center(160)
      puts "Special Requirements: #{names[i][:requirements]}".center(160)
      puts "Hobbies: #{names[i][:hobbies]}".center(160)
      puts
    end
  i += 1  
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(160)
end

# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)