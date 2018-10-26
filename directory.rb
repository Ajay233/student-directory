@students = []

# This method makes sure either a valid month or blank string is entered
def cohort_validation(month)
  checks = ["January", "February","March", "April", "May", "June",
            "July", "August", "September", "October", "November",
            "December", ""]
  until checks.include?(month) == true
    puts "Please enter a valid month"
    month = STDIN.gets.delete!("\n").capitalize
  end
  month
end

# This method provides a default value of "TBC" if a blank string is entered
def default
  @students.each do |hash|
    hash.each do |key, val|
      if hash[key] == :""
        hash[key] = :TBC
      elsif hash[key].empty?
        hash[key] = "TBC"
      end
    end
  end
end

def cohort_list
  cohorts = []
  @students.each { |hash| cohorts << hash[:cohort] }
  cohorts.uniq!
  cohorts
end

def add_record(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

# Put all the students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.delete!("\n").capitalize
  # while name is not empty repeat this code
  while !name.empty?
  # Get details of age, height, town, country, department, requirements etc
    puts "Please enter the cohort"
    cohort = STDIN.gets.delete!("\n").capitalize
    cohort = cohort_validation(cohort)
    # Add record to the global students array
    add_record(name, cohort)
    # Display the current number of records
    message = "We now have #{@students.count}"
    puts @students.count == 1 ? "#{message} student" : "#{message} students"
    # get another name from the user
    name = STDIN.gets.chomp.capitalize
  end
# Assign "TBC" as a default value if any values are empty
  default
end

# and then print them
def print_header
  puts "The students of Villain Academy".center(160)
  puts "-------------------------------".center(160)
end

def print_students
  # Create a list of all cohorts that have been entered
  cohorts = cohort_list
  # Iterates through each cohort month in the cohorts array
  cohorts.each do |cohort| 
    puts "The #{cohort} cohort\n".center(160)
    @students.each_with_index do |record, index|
    # Now only prints names beginning with "D" & containing less than 12 letters
      if record[:name].start_with?("D") && record[:name].length < 12
        # Print the records that match the current cohort iteration
        if cohort == record[:cohort]
          puts "#{index + 1}.Name: #{record[:name]} (#{record[:cohort]} cohort)".center(160)
          puts
        end
      end
    end
  puts "-------------------------------".center(160)
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student".center(160)
  else
    puts "Overall, we have #{@students.count} great students".center(160)
  end
end

def print_menu
  puts "1. Input students"
  puts "2. Show students"
  puts "3. Save list to students.csv"
  puts "4. Load students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students
  print_footer
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "\nSuccessfully saved #{@students.count} records to #{filename}"
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    add_record(name, cohort)
  end
  file.close
  puts "\nLoaded #{@students.count} records from #{filename}"
end  

def try_load_students
  filename = ARGV.first
  filename = "students.csv" if filename.nil?
  if File.exists?(filename)
    load_students(filename)
  else
    puts "Sorry #{filename} does not exist"
    exit
  end  
end

# The process selection was too long so I refactored using when and "then".
def process(selection)
  case selection
    when "1" then input_students
    when "2" then show_students
    when "3" then save_students
    when "4" then load_students  
    when "9" then exit
    else puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
# nothing happens until we call the interactive menu method
interactive_menu
