# QUESTION 5

# ===============

# Our code only works with the student name and cohort. Add more information:
# hobbies, country of birth, height, etc.

# ===============

def input_students
  puts "Please enter the name of each student, followed by their age"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the student's first name
  name = gets.chomp
  # get the student's age
  age = gets.chomp
  # while the name is not empty repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, age: age, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
    # get age
    age = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of my cohort at Makers"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} - #{student[:age]} years old (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)