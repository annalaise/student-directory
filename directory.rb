@students = []

# Provides users with selection of choices for program to execute
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you mean, please try again"
    end
end

def print_menu
  puts "1. Enter new student details"
  puts "2. Display existing student details"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

# Collects student details from user
def input_students
  puts "Please enter the first and last name of the student"
  name = gets.gsub(/\n/,"")

# As long as name has been completed, do the following...
  while !name.empty? do

# Collects the student's cohort
    puts "Which cohort is #{name} on?"
    cohort = gets.chomp

# Shovels collected student data into array of hashes
    @students << {name: name.capitalize, cohort: cohort.capitalize}

# Puts count of students currently in database, with correct plural / singular terminology
    if @students.count > 1
      puts "Now we have #{@students.count} students"
    else
      puts "Now we have #{@students.count} student"
    end

# Prompts user to enter student's details. Recursive call back to the method if user populates name.
    puts "Enter another student, or hit return to finish"
    name = gets.chomp
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


# calls the methods for evaluation
interactive_menu
