def input_students
  puts "".center(80,'*')
  puts " Please enter the new students details ".center(80, '*')
  puts
  puts " To exit program just leave 'name' blank ".center(80, '*')
  # create an empty array
  students = []
   while true do
    #add the student hash to the array
    puts "Name?"
    name = gets.chomp
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

    ages = [*'1'..'150']

    until ages.include? age
    puts "Enter a year. E.g. 25"
    age = gets.chomp
    end

    age = age.to_i

    puts "Nationality?"
    nationality = gets.chomp
    puts "Hobbies?"
    hobbies = gets.chomp
    puts "Enter Cohort"
    cohort = gets.chomp.capitalize!

    months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

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
  student_count = 0
  until student_count == students.length
    students.each.with_index(1) do |student, index|
      if student[:name].length < 12
      student[:name].capitalize!
      puts "#{index},#{student[:name]}  Age: #{student[:age]}  Nationality: #{student[:nationality]}  Hobbies: #{student[:hobbies]}  (#{student[:cohort]} cohort)"
      student_count += 1
    end
  end
end

def print_footer(students)
  puts " Overall, we have #{students.count} great students ".center(80,'*')
end
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
