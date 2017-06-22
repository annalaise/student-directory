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
  line1 = "The students of Villains Academy"
  line2 = "-------------"
  puts line1.center(15)
  puts line2.center(15)
end

def print(students)
  count = 0
  while count < students.count
    studentline = "#{count+1}. #{students[count][:name]} (#{students[count][:cohort]} cohort) Age:#{students[count][:age]} Nationality:#{students[count][:nationality]}"
    puts studentline.center(15)
    count += 1
  end
end

def print_footer(students)
  footer = "Overall, we have #{students.count} great students"
  puts footer.center(15)
end

students = input_students
print_header
print(students)
print_footer(students)
