def input_students
  puts "Please enter the name of the student"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "What is the student's nationality?"
    nat = gets.chomp
    puts "What is the student's current age?"
    age = gets.chomp
    students << {name: name, cohort: :november, nat: nat, age: age}
    puts "Now we have #{students.count} students"
    puts "Enter another student, or hit return to finish"
    name = gets.chomp
  end
  students
end

def print_header
  line1 = "The students of Villains Academy"
  line2 = "-------------"
  puts line1.center(20)
  puts line2.center(20)
end

def print(students)
    students.each_with_index do |student, i|
      if student.class == Hash
        puts "#{i+1}. #{students[i][:name]} (#{students[i][:cohort]} cohort) Age: #{students[i][:age]} Nationality: #{students[i][:nat]}"
      end
  end
end

def print_footer(students)
  footer = "Overall, we have #{students.count} great students"
  puts footer.center(20)
end

students = input_students
print_header
print(students)
print_footer(students)
