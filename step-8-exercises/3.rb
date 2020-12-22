# QUESTION 3

# ===============

# Modify your program to only print the students whose name is shorter than 12
# characters.

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

def print_names_with_max_characters(students)
  puts "Names with maximum number of characters of: (Enter a number)"
  max_length = gets.chomp
  number_of_matches = 0
  students.each do |student|
    if student[:name].length <= max_length.to_i
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
      number_of_matches += 1
    end  
  end
  puts "Listed above we have #{number_of_matches} students with a name that has a maximum #{max_length} characters"
end

def print_footer(names)
  puts "And overall, we have #{names.count} great students"
end

#call the methods
students = input_students
print_header
print_names_with_max_characters(students)
print_footer(students)