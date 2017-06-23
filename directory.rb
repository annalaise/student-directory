def center_puts(string)
  width = 50
  puts string.center(width)
end

def input_students
  center_puts("Please enter the name of the student")
  students = []
  name = gets.chomp
  while !name.empty? do
    center_puts("Where is #{name} from?")
    country = gets.chomp
    center_puts("How old is #{name}?")
    age = gets.chomp
    students << {name: name.capitalize, cohort: :november, country: country.capitalize, age: age}
    center_puts("Now we have #{students.count} students")
    center_puts("Enter another student, or hit return to finish")
    name = gets.chomp
  end
  students
end

def print_header
  center_puts("The students of Villains Academy")
  center_puts("-------------")
end

def print(students)
    students.each_with_index do |student, i|
      if student.class == Hash
      center_puts("#{(i+1)}. #{(students[i][:name])} (#{students[i][:cohort]} cohort) Age: #{students[i][:age]} Country: #{students[i][:country]}")
      end
  end
end

def print_footer(students)
  center_puts("Overall, we have #{students.count} great students")
end

students = input_students
print_header
print(students)
print_footer(students)
