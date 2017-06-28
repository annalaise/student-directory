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
  puts "Please select one of the following options:"
  puts "1. Enter new student details"
  puts "2. Display existing student details"
  puts "3. Save the list to a csv file"
  puts "4. Load the list from a csv file"
  puts "9. Exit"
end

def input_students
  puts "Please enter the first and last name of the student"
  name = STDIN.gets.chomp
  while !name.empty? do
    puts "Which cohort is #{name} on?"
    cohort = STDIN.gets.chomp.to_sym
    add_students(name, cohort)
    if @students.count > 1
      puts "Now we have #{@students.count} students"
    else
      puts "Now we have #{@students.count} student"
    end
    puts "Enter another student, or hit return to finish"
    name = STDIN.gets.chomp
  end
end

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def show_students
  print_header
  print_student_list
  print_footer
end

def save_students
  puts "Please choose one of the following options"
  puts "1. Save the data to the existing file, students.csv"
  puts "2. Save the data to a csv file of your choice"
  choice_save = gets.chomp
  case choice_save
    when "1"
      save_to_existing_file
    when "2"
      puts "Please enter a csv filename"
      newfile_save = gets.chomp.to_s
      save_to_new_file(newfile_save)
    else
     puts "I don't know what you mean, please try again"
   end
end

def save_to_existing_file
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Succesfully saved the list to the file"
end

def save_to_new_file(newfile_save)
  file = File.open(newfile_save, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "Succesfully saved the list to #{newfile_save}"
end

def load_students
  puts "Please choose one of the following options"
  puts "1. Load the data from the existing file, students.csv"
  puts "2. Load the data from a csv file of your choice"
  choice_load = gets.chomp
  case choice_load
  when "1"
    load_from_existing
  when "2"
    puts "Please enter a csv filename"
    newfile_load = gets.chomp.to_s
    load_from_new(newfile_load)
  else
   puts "I don't know what you mean, please try again"
 end
end

def load_from_existing(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_students(name, cohort)
  end
  file.close
  puts "Succesfully loaded #{@students.count} student records from #{filename}"
end

def load_from_new(newfile_load)
  file = File.open(newfile_load, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_students(name, cohort)
  end
  file.close
  puts "Succesfully loaded student data from #{newfile_load}"
end

def start_load_students
  filename = ARGV.first # first argument from the command line
  filename ||= "students.csv"
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_from_existing(filename) # passes filename as an arg to load_students
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
    puts " " # Adding additional line for formatting to terminal
  else
    puts "Overall, we have #{@students.count} great student"
    puts " " # Adding additional line for formatting to terminal
  end
end


# calls the launch methods for evaluation
start_load_students
interactive_menu
