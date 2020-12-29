# QUESTION 8

# ===============

# Write a short program that reads its own source code (search StackOverflow to find
# out how to get the name of the currently executed file) and prints it on the screen.

# ===============

def print_file

  # $0 used to reference the shell script

  file = File.open($0, "r") do |file|
    file.readlines.each do |line|
      puts line
    end
  end
end

print_file