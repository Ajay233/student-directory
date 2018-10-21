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
  month.to_sym
end

# This method provides a default value of "TBC" if a blank string is entered
def default(hash)
  hash.each do |key, val|
    if hash[key] == :""
      hash[key] = :TBC
    elsif hash[key].empty?
      hash[key] = "TBC"
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
    record = {name: "", age: "", height: "", home_town: "", country_of_birth: "",
              gov_dept: "", requirements: "", hobbies: "", cohort: ""}
    record.each do |key, val|
      if key == :name
        record[:name] = name
      elsif key
        puts "Please enter #{key.to_s.gsub("_", " ")}"
        record[key] = gets.chomp.capitalize
        record[key] = cohort_validation(record[key]) if key == :cohort
      end
    end
    # Assign "TBC" as a default value if value is empty
    default(record)
    # Add record to the global students array
    @students << record
    message = "We now have #{@students.count}"
    puts @students.count == 1 ? "#{message} student" : "#{message} students"
    # get another name from the user
    name = gets.chomp.capitalize
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
  if @students.count == 1
    puts "Overall, we have #{@students.count} great student".center(160)
  else
    puts "Overall, we have #{@students.count} great students".center(160)
  end
end

def print_menu
  puts "1. Input students"
  puts "2. Show students"
  puts "3. Save the list to students.csv"
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
    student_data = [student[:name], student[:age], student[:height], 
                    student[:home_town], student[:country_of_birth], 
                    student[:gov_dept], student[:requirements], 
                    student[:hobbies], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def process(selection)
  case selection
    when "1" then input_students
    when "2" then show_students
    when "3" then save_students
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
