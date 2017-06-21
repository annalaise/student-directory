student_count = 11
# students have been put into an array
students = [
"Dr. Hannibal Lecter",
"Darth Vadar",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Krueger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates"
]

# these can then be printed from the array using the array index
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
   puts student
end
# finally, we print the total number of students
puts "Overall, we have #{students.count} great students"
