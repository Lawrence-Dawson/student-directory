def input_students
  puts "".center(80,'*')
  puts " Please enter the new students details ".center(80, '*')
  puts
  puts " To exit program just leave all options blank ".center(80, '*')
  # create an empty array
  students = []
  puts "Name?"
  name = gets.chomp
  puts "Age?"
  age = gets.chomp
  puts "Nationality?"
  nationality = gets.chomp
  puts "Hobbies?"
  hobbies = gets.chomp
  # while the name is not empty, repeat this code
   while !name.empty? do
    #add the student hash to the array
    students << {name: name, age: age, nationality: nationality,
       hobbies: hobbies, cohort: :November}
    puts " Now we have #{students.count} students ".center(80,'*')
    #get another name from the user
    puts "Name?"
    name = gets.chomp
    puts "Age?"
    age = gets.chomp
    puts "Nationality?"
    nationality = gets.chomp
    puts "Hobbies?"
    hobbies = gets.chomp
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
