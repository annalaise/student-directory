def input_students
  puts "Please enter the name of the student"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "What is the student's nationality?"
    nationality = gets.chomp
    puts "What is the student's current age?"
    age = gets.chomp
    students << {name: name, cohort: :november, nationality: nationality, age: age}
    puts "Now we have #{students.count} students"
    puts "Enter another student, or hit return to finish"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  count = 0
  while count < students.count
    puts "#{count+1}. #{students[count][:name]} (#{students[:cohort]} cohort) Age:#{students[count][:age]} Nationality:#{students[count][:nationality]}"
    count += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
