require 'csv'

@students = []

@width = 50

@loaded_file = ""

@default_file = "data.csv"

def dashed_line
  puts "-------------------".center(@width)
end

def main_menu
  puts "Student Directory 📒".center(@width)
  dashed_line
  puts "*** MAIN MENU ***".center(@width)
  dashed_line
  puts "\n"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file"
  puts "9. Exit"
end

def looping_main_menu
  loop do
    main_menu
    process_menu(STDIN.gets.chomp)
  end
end

def process_menu(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  when "3"
    save_students
  when "4"
    load_file
  else
    puts "I don't know what you meant, try again"
  end
end

def add_student_record(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    add_student_record(name, cohort = :november)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Orange Academy"
  dashed_line
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "\n"
  puts "Overall, we have #{@students.count} great students"
  puts "\n"
end

def save_students(filename = @default_file)
  CSV.open(filename, "wb") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort]]
    end
  end
  puts "*** Saved successfully to #{filename} ***".center(@width)
  dashed_line
end

def load_file
  puts "Please enter the relative path of the file (eg ../../data.csv)" 
  load_filename = gets.chomp
  puts "⚠❗️ File not found, will attempt to load from default" if !File.exists?(load_filename)
  File.exists?(load_filename) ? load_students(load_filename) : load_students
end

def load_students(filename = @default_file)
  if File.exists?(filename)
    CSV.foreach(filename) do |row|
      name, cohort = row
      add_student_record(name, cohort)
    end
    @loaded_file = filename
  puts "*** Loaded successfully from #{filename} ***".center(@width)
  dashed_line
  else
    if filename == @default_file
      puts "The default file #{@default_file} was not found"
      File.write("students.csv", "")
      @loaded_file = filename
      puts "A new #{@default_file} was created"
    else 
      puts "⚠❗️ File #{filename} not found. Using #{@loaded_filename} instead."
    end
  end  
end

def try_load_students
  filename = ARGV.first
  if filename.nil?
    @loaded_file = @default_file
    puts "Loaded #{@loaded_file}"
    load_students
  elsif File.exists?(filename)
    @loaded_file = filename
    load_students(@loaded_file)
    puts "Loaded #{@students.count} from #{@loaded_file}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
looping_main_menu