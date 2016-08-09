require 'csv'

@students = [] # an empty array accessible to all methods
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  add_name
end

def add_name
  name = STDIN.gets.chomp # get the first name
  while !name.empty? do # while the name is not empty, repeat this code
    add_student (name) # add the student hash to the array
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp # get another name from the user
  end
end

def interactive_menu
  load_or_create_choice
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load a file"
  puts "5. Create a file"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  puts "You chose option #{selection}"
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_file(STDIN.gets.chomp)
  when "5"
    create_file(STDIN.gets.chomp)
  when "9"
    exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def save_students
  puts "What would you like to call the file?"
  save_as = STDIN.gets.chomp
  CSV.open("#{save_as}.csv", "w") do |csv|# open the file for writing
  @students.each do |student| #iterate over the array of students
  csv << [student[:name], student[:cohort]]
  end
end
end
#def load_students_on_startup
#  filename = ARGV.first # first argument from the command line
#  if filename.nil? # get out of the method if it isn't given
#    load_or_create_choice
#  else
#    if File.exists?(filename) # check if it exists
#    load_file(filename)
#      puts "Loaded #{@students.count} from #{filename}"
#  else # if it doesn't exist
#    puts "Sorry, #{filename} doesn't exist."
#    interactive_menu
#  end
#end

def load_or_create_choice
    puts "Which of the following do you wish to do?"
    puts "1. Load a student file"
    puts "2. Create a new student file"
    file_choice(STDIN.gets.chomp)
end

def file_choice(choice)
  puts "You chose choice #{choice}"
  case choice
  when "1"
    puts "Name the file you wish to load"
     load_file(STDIN.gets.chomp)
  when "2"
    create_file(STDIN.gets.chomp)
  end
end

def load_file(filename)
  if File.exists?(filename)
    File.open(filename, "r") do |file|
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
    add_student (name)
  end
end
else
  puts "file not found"
  interactive_menu
end
end

def create_file(filename)
    File.open(filename, "w")
end

def add_student (name)
  @students << {name: name, cohort: :november}
end


def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end
interactive_menu
