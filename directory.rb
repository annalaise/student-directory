def center_puts(string)
  width = 50
  puts string.center(width)
end

def input_students
  center_puts("Please enter the name of the student")
  students = []
  cohort_month = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
  name = gets.chomp
  cohort = nil

  while !name.empty? do

    until cohort_month.include? cohort do
       default_cohort = :undecided
       center_puts("Which cohort is #{name} on?")
       cohort = gets.chomp.downcase.to_sym
       cohort ||= default_cohort
       center_puts("That cohort isn't valid. Enter a month, e.g. july, or hit enter again to select #{default_cohort}.") if !cohort_month.include? cohort
      end

    center_puts("Where is #{name} from?")
    country = gets.chomp

    center_puts("How old is #{name}?")
    age = gets.chomp

    students << {name: name.capitalize, cohort: cohort.capitalize, country: country.capitalize, age: age}
    cohort = nil

    if students.count > 1
    center_puts("Now we have #{students.count} students")
    else
      center_puts("Now we have #{students.count} student")
    end

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
      center_puts("#{(i+1)}. #{(students[i][:name])} (#{students[i][:cohort]} Cohort) Age: #{students[i][:age]} Country: #{students[i][:country]}")
      end
  end
end

def print_footer(students)
  if students.count > 1
  center_puts("Overall, we have #{students.count} great students")
  else
    center_puts("Overall, we have #{students.count} great student")
  end

end

students = input_students
print_header
print(students)
print_footer(students)
