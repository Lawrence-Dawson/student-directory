def interactive_menu
  students = []
  loop do
  #1. print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
  #2. read the input and save it into a variable
  selection = gets.chomp
  #3. do what the user has asked
  case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit #this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

def input_students
  puts "".center(80,'*')
  puts " Please enter the new students details ".center(80, '*')
  puts
  puts " To exit program just leave 'name' blank and type 'Yes' when prompted ".center(80, '*')
  # create an empty array
  students = []
   while true do
    #add the student hash to the array
    puts "Name?"
    name = gets.tr("\n","").capitalize
    if name.empty?
      puts "Do you wish to exit? Yes/No"
      answer = gets.chomp.capitalize
      if answer == "Yes"
        break
      else
        name = "Anonymous"
        puts "name stored as #{name}"
      end
    end
    puts "Age?"
    age = gets.chomp
    #create an array of ages
    ages = [*'1'..'150']
    #check that the age given is a valid age
    until ages.include? age
    puts "Enter a year. E.g. 25"
    age = gets.chomp
    end
    #convert valid age to an integer
    age = age.to_i

    puts "Nationality?"
    nationality = gets.chomp.capitalize
    puts "Hobbies?"
    hobbies = gets.chomp
    puts "Enter Cohort"
    cohort = gets.chomp.capitalize
    #create an array of months
    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    #check that the month given is a valid month
    until months.include? cohort
      puts "Enter a valid month. E.g. January"
           cohort = gets.chomp.capitalize
    end

    students << {name: name, age: age, nationality: nationality,
       hobbies: hobbies, cohort: cohort}
    unless students.count < 2
       puts " Now we have #{students.count} students ".center(80,'*')
      else
        puts " Now we have #{students.count} student ".center(80,'*')
      end
  end
  #return the array of students
  students
end

def print_header
  puts " The students of Villains Academy ".center(80, '*')
  puts "".center(80,'-')
end

def print(students)
  #check that there are actual students
  if students.count > 0
  #ask which cohort you wish to find
  puts "Enter cohort to print"
  selected = gets.chomp.capitalize
  #checks that is a valid cohort
  months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  until months.include? selected
  puts "Enter a valid month. E.g. January"
  selected = gets.chomp.capitalize
  end
  #find selected cohort
  to_print = students.select {|student| student[:cohort] == selected }
  #prints each student within that cohort
  to_print.each do |student|
    puts "".center(80,":")
    puts "#{student[:name]}  Age: #{student[:age]}  Nationality: #{student[:nationality]}  Hobbies: #{student[:hobbies]}  (#{student[:cohort]} cohort)"
    end
  else
    puts "No students to print"
    end
  end

def print_footer(students)
  puts " Overall, we have #{students.count} great students ".center(80,'*')
end

interactive_menu
