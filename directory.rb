# Reference for input_students method
COHORT_MONTH = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]

# Center formatting
def center_puts(string)
  width = 50
  puts string.center(width)
end

# Collects student details from user
def input_students
  puts "Please enter the first and last name of the student"
  students = []
  name = gets.gsub(/\n/,"")
  cohort = nil

# As long as name has been completed, do the following...
  while !name.empty? do

# Collects the cohort month and prompts user for correct format if month is entered incorrectly
    until COHORT_MONTH.include? cohort do
      default = :july
      puts "Which cohort is #{name} on?"
      cohort = gets.chomp.downcase.to_sym
      cohort ||= default
      if !COHORT_MONTH.include? cohort
      center_puts("That cohort isn't valid. Enter a month name:")
      end
    end

# Collects where student is from
    puts "Where is #{name} from?"
    country = gets.chomp

# Collects student's age
    puts "How old is #{name}?"
    age = gets.chomp

# Shovels collected student data into array of hashes
    students << {name: name.capitalize, cohort: cohort.capitalize, country: country.capitalize, age: age}

# Puts count of students currently in database, with correct plural / singular terminology
    if students.count > 1
      center_puts("Now we have #{students.count} students")
    else
      center_puts("Now we have #{students.count} student")
    end

# Prompts user to enter student's details. Recursive call back to the method if user populates name.
    center_puts("Enter another student, or hit return to finish")
    name = gets.chomp
  end
  students
end

# Prints header for list of students
def print_header
  center_puts("The students of Villains Academy")
  center_puts("-------------")
end

# Sorts students by cohort (alphabetically by month), puts the resulting modified array of hashes
def print_students(students)
  cohorts = students.sort_by! {|student| student[:cohort] }
  puts cohorts
end

# prints the footer for student directory, including plural / singular total count.
def print_footer(students)
  if students.count > 1
  center_puts("Overall, we have #{students.count} great students")
  else
    center_puts("Overall, we have #{students.count} great student")
  end
end

# Student details for testing cohort month sorting
# students = [
# {name: "Darth Vadar", cohort: "july", country: "AGalaxyFarFarAway", age: 45},
# {name: "Dr. Hannibal Lecter", cohort: "august", country: "USA", age: 62},
# {name: "Nurse Ratchet", cohort: "july", country: "USA", age: 35},
# {name: "Lord Voldermort", cohort: "september", country: "UK", age: 56},
# {name: "Freddy Krueger", cohort: "august", country: "France", age: 43},
# {name: "The Joker", cohort: "september", country: "DeckofCards", age: 57},
# {name: "The Wicked Witch of the West", cohort: "november", age: 86}
# ]

# calls the methods for evaluation
students = input_students
print_header
print_students(students)
print_footer(students)
