require "csv"

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


# Create a record hash that can be pushed into @students
def create_record(name)
  record = {name: "", age: "", height: "", home_town: "", country_of_birth: "",
            gov_dept: "", requirements: "", hobbies: "", cohort: ""}
  record.each do |key, val|
    if key == :name
      record[:name] = name
    elsif key
      puts "Please enter #{key.to_s.gsub("_", " ")}"
      record[key] = STDIN.gets.chomp.capitalize
      record[key] = cohort_validation(record[key]) if key == :cohort
    end
  end
 record
end

def cohort_list
  cohorts = []
  @students.each { |hash| cohorts << hash[:cohort] }
  cohorts.uniq!
  cohorts
end

def add_record(record)
  if record.class == Hash
    @students << record
  else
    @students << {name: record[0], age: record[1], height: record[2], 
                  home_town: record[3], country_of_birth: record[4],
                  gov_dept: record[5], requirements: record[6], 
                  hobbies: record[7], cohort: record[8]}
  end              
end

# Put all the students into an array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.delete!("\n").capitalize
  # while name is not empty repeat this code
  while !name.empty?
  # Get details of age, height, town etc and create record hash
    record = create_record(name)
    # Add record hash to the global students array
    add_record(record)
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
          record.each { |key, val| puts "#{key}: #{val}".center(160) unless key == "name" }
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
  puts "3. Save list to a (.csv) file"
  puts "4. Load a (.csv) file"
  puts "9. Exit"
end

def show_students
  print_header
  print_students
  print_footer
end

def save_students
  puts "Please enter a (.csv) filename to save to (or the list will save to students.csv by default)"
  filename = STDIN.gets.chomp
  filename = "students.csv" if filename.empty?
  CSV.open(filename, "w") do |csv|
    @students.each do |student|
      record = []
      student.each_value { |val| record << val }
      csv << record
    end
  end
  puts "\nSuccessfully saved #{@students.count} records to #{filename}"
end

def load_students(filename = "students.csv")
  CSV.foreach(filename, "r") do |row|
    record = row
    add_record(record)
  end
  puts "\nLoaded #{@students.count} records from #{filename}"
end  

def manual_load
  puts "Plese enter a (.csv) filename to load"
  load_students(STDIN.gets.chomp) 
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
    when "4" then manual_load
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