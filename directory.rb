@students = []

# This method makes sure either a valid month or blank string is entered
def cohort_validation(month)
  checks = ["January", "February","March", "April", "May", "June",
            "July", "August", "September", "October", "November",
            "December", ""]
  until checks.include?(month) == true
    puts "Please enter a valid month"
    month = gets.delete!("\n").capitalize
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
  # get the first name
  name = gets.delete!("\n").capitalize
  # while name is not empty repeat this code
  while !name.empty?
  # Get details of age, height, town, country, department, requirements etc
    puts "Please enter the cohort month"
    cohort = gets.delete!("\n").capitalize
    cohort = cohort_validation(cohort)
    puts "Please enter thier age"
    age = gets.delete!("\n")
    puts "Please enter height in metres"
    height = gets.delete!("\n")
    puts "Please enter thier home town"
    town = gets.delete!("\n").capitalize
    puts "Please enter thier country of birth"
    country = gets.delete!("\n").capitalize
    puts "Please enter which Government department they are from"
    dept = gets.delete!("\n").capitalize
    puts "Please enter any specialist requirements they have"
    requirements = gets.delete!("\n").capitalize
    puts "Please enter any hobbies they have"
    hobbies = gets.delete!("\n").capitalize
    
    # add the student details to the hash array
    @students << {name: name, age: age, height: height, home_town: town,
                 country_of_birth: country, gov_dept: dept,
                 requirements: requirements, hobbies: hobbies, cohort: cohort}
    # catches any empty values and assigns "TBC" as the default value
    default(@students)
    # Ensures the sentence reads correctly with student count
    if @students.count == 1
      puts "We now have #{@students.count} student"
    else
      puts "We now have #{@students.count} students"
    end
    # get another name from the user
    name = gets.delete!("\n").capitalize
  end
end

# and then print them
def print_header
  puts "The students of Villain Academy".center(160)
  puts "-------------------------------".center(160)
end

def print_students
  # Create a list of all cohorts that have been entered
  cohorts = []
  @students.each { |hash| cohorts << hash[:cohort] }
  cohorts.uniq!
  x = 0
  # Iterates through each cohort month in the cohorts array
  while x < cohorts.length
    puts "The #{cohorts[x]} cohort\n".center(160)
    i = 0
    # "Each" changed to an until loop
    until i >= @students.length
    # Now prints a number before the name of each student
      # Now only prints names beginning with "D" & containing less than 12 letters
      if @students[i][:name].start_with?("D") && @students[i][:name].length < 12 && cohorts[x] == @students[i][:cohort]
        puts "#{i + 1}.Name: #{@students[i][:name]} (#{@students[i][:cohort]} cohort)".center(160)
        puts "Age: #{@students[i][:age]}".center(160)
        puts "Height: #{@students[i][:height]} m".center(160)
        puts "Home Town: #{@students[i][:home_town]}".center(160)
        puts "Birth Country: #{@students[i][:country_of_birth]}".center(160)
        puts "Government Department: #{@students[i][:gov_dept]}".center(160)
        puts "Special Requirements: #{@students[i][:requirements]}".center(160)
        puts "Hobbies: #{@students[i][:hobbies]}".center(160)
        puts
      end
    i += 1  
    end
  puts "-------------------------------".center(160)
  x += 1
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(160)
end

def print_menu
  puts "1. Input students"
  puts "2. Show students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students
  print_footer
end

def process(selection)
  case selection
    when "1" then input_students
    when "2" then show_students
    when "9" then exit
    else puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

# nothing happens until we call the interactive menu method
interactive_menu
