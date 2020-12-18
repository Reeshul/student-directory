# QUESTION 6

# ===============

# Research how the method center() of the String class works. Use it in your
# code to make the output beautifully aligned.

# ===============

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of my cohort at Makers".center(80)
  puts "-------------".center(80)
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(80)
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(80)
end

students = input_students
print_header
print(students)
print_footer(students)