@students = []

# Provides users with selection of choices for program to execute
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, please try again"
    end
end

def print_menu
  puts "1. Enter new student details"
  puts "2. Display existing student details"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

# Collects student details from user
def input_students
  puts "Please enter the first and last name of the student"
  name = STDIN.gets.gsub(/\n/,"")

# As long as name has been completed, do the following...
  while !name.empty? do

# Collects the student's cohort
    puts "Which cohort is #{name} on?"
    cohort = STDIN.gets.chomp.to_sym

# Shovels collected student data into array of hashes
    add_students(name, cohort)

# Puts count of students currently in database, with correct plural / singular terminology
    if @students.count > 1
      puts "Now we have #{@students.count} students"
    else
      puts "Now we have #{@students.count} student"
    end

# Prompts user to enter student's details. Recursive call back to the method if user populates name.
    puts "Enter another student, or hit return to finish"
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_students(name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exists
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

# Prints header for list of students, only if student list is not empty
def print_header
  if @students.count > 0
    puts "The students of Villains Academy"
    puts "-------------"
  else
    exit
  end
end

# prints the student list
def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# prints the footer for student directory, including plural / singular total count.
def print_footer
  if @students.count > 1
    puts "Overall, we have #{@students.count} great students"
  else
    puts "Overall, we have #{@students.count} great student"
  end
end


# calls the launch methods for evaluation
try_load_students
interactive_menu
