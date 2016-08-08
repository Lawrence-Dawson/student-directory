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
    name = gets.chomp.capitalize
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
       puts " Now we have #{students.count} students ".center(80,'*')
  end
  #return the array of students
  students
end

def print_header
  puts " The students of Villains Academy ".center(80, '*')
  puts "".center(80,'-')
end

def print(students)
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
  end

def print_footer(students)
  puts " Overall, we have #{students.count} great students ".center(80,'*')
end


students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
