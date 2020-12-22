# QUESTION 6

# ===============

# Research how the method center() of the String class works. Use it in your
# code to make the output beautifully aligned.

# ===============

@width = 50

def create_new_student
  puts "Do you want to create a new student record? (y/n)".center(@width)
  continue = gets.chomp
  if continue == "y"
    return true
  elsif continue == "n"
    return false
  else
    puts "Please enter \"y\" or \"n\"".center(@width)
  end
  create_new_student
end

def input_students
  students = []
  continue = create_new_student
  while continue
    puts "Please enter the name of the student".center(@width)
    name = gets.chomp
    place_of_birth = add_place_of_birth
    hobbies = add_hobbies
    students << { name: name, cohort: :november,
                  place_of_birth: place_of_birth, hobbies: hobbies }
    puts "Now we have #{students.count} students".center(@width)
    continue = create_new_student
  end
  students
end

def add_place_of_birth
  places_of_birth = []
  puts "Please enter the student's place of birth".center(@width)
  puts "(To finish, just hit return twice)".center(@width)
  place_of_birth = gets.chomp
  while !place_of_birth.empty?
    places_of_birth << place_of_birth
    place_of_birth = gets.chomp
  end
  places_of_birth
end

def add_hobbies
  hobbies = []
  puts "Please enter student's hobbies".center(@width)
  puts "(To finish, just hit return twice)".center(@width)
  hobby = gets.chomp
  while !hobby.empty?
    hobbies << hobby
    hobby = gets.chomp
  end
  hobbies
end

def print_header
  puts "The students of my cohort at Makers".center(@width)
  puts "-------------".center(@width)
end

def print(students)
  i = 0
  while i < students.count
  puts "#{i + 1}. #{students[i][:name]}\nPOB: #{students[i][:place_of_birth][0]}\nHobbies: #{students[i][:hobbies].join(", ")}\n(#{students[i][:cohort]} cohort)".center(@width)
  i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(@width)
end

students = input_students
print_header
print(students)
print_footer(students)