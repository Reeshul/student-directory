# QUESTION 4

# ===============

# Rewrite the each() method that prints all students using while or until control
# flow methods.

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
  puts "The students of my cohort at Makers"
  puts "-------------"
end

# print method using while loop

def print(students)
  student_counter_index_thingamajig = 0
  while student_counter_index_thingamajig < students.count
    puts "#{students[student_counter_index_thingamajig][:name]} (#{students[student_counter_index_thingamajig][:cohort]} cohort)"
    student_counter_index_thingamajig += 1
  end
end

# print method using until loop

def print_2(students)
  student_counter_index_thingamajig = 0
  until student_counter_index_thingamajig >= students.count
    puts "#{students[student_counter_index_thingamajig][:name]} (#{students[student_counter_index_thingamajig][:cohort]} cohort)"
    student_counter_index_thingamajig += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print_2(students)
print_footer(students)