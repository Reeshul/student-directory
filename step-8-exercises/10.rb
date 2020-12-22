# QUESTION 10

# ===============

# We've been using the chomp() method to get rid of the last return character. Find
# another method among those provided by the String class that could be used for
# the same purpose (although it will require passing some arguments).

# ===============

@width = 50

@students = []

@cohorts = {
  January: 0,
  February: 0,
  March: 25,
  April: 25,
  May: 25,
  June: 25,
  July: 25,
  August: 25,
  September: 25,
  October: 25,
  November: 25,
  December: 25
}

def create_new_student
  puts "Do you want to create a new student record? (y/n)".center(@width)
  continue = gets.delete("\n")
  if continue == "y"
    return true
  elsif continue == "n"
    return false
  else
    puts "Please enter \"y\" or \"n\"".center(@width)
  end
  create_new_student
end

def add_cohort
  next_cohort = :March
  puts "\n"
  puts "Available cohorts:".center(@width)
  puts "(Month / Spots left)".center(@width)
  month_number = 1
  @cohorts.each do |month, vacancies|
    puts "(#{month_number}) #{month} - spots available: #{vacancies}".center(@width)
    month_number +=1
  end
  puts "\n"
  puts "Please enter the month number of the cohort would like to join".center(@width)
  cohort = gets.chomp
  case cohort
  when "1"
    cohort = :March
  when "2"
    cohort = :March
  when "3"
    cohort = :March
  when "4"
    cohort = :April
  when "5"
    cohort = :May
  when "6"
    cohort = :June
  when "7"
    cohort = :July
  when "8"
    cohort = :August
  when "9"
    cohort = :September
  when "10"
    cohort = :October
  when "11"
    cohort = :November
  when "12"
    cohort = :December
  else
    puts "Input not recognsied - the #{next_cohort} cohort was added".center(@width)
  end
  cohort
end

def input_students
  continue = create_new_student
  while continue
    puts "Please enter the name of the student".center(@width)
    name = gets.chomp
    cohort = add_cohort
    place_of_birth = add_place_of_birth
    hobbies = add_hobbies
    @students << { name: name, cohort: cohort,
                  place_of_birth: place_of_birth, hobbies: hobbies }
    puts "Now we have #{@students.count} students".center(@width)
    continue = create_new_student
  end
  @students
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

def print_by_cohort(students)
  cohorts = @students.map do |student|
    student[:cohort]
  end
  cohorts.uniq.each do |cohort|
    puts "#{cohort} cohort".upcase.center(@width)
      @students.each do |student|
        puts student[:name] if student[:cohort] == cohort
      end
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great student".center(@width) if names.count == 1
  puts "Overall, we have #{names.count} great students".center(@width) if names.count > 1
end

students = input_students
print_header
print_by_cohort(students)
print_footer(students)