def input_students
  puts "Please enter the student details".center(10)
  puts "To finish just leave all options blank"
  # create an empty array
  students = []
  name = gets.chomp
  puts "Age?".center(10)
  age = gets.chomp
  puts "Nationality?"
  nationality = gets.chomp
  puts "Hobbies?"
  hobbies = gets.chomp
  # while the name is not empty, repeat this code
   while !name.empty? do
    #add the student hash to the array
    students << {name: name, age: age, nationality: nationality,
       hobbies: hobbies, cohort: :november}
    puts "Now we have #{students.count} students"
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
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  student_count = 0
  until student_count == students.length
    students.each.with_index(1) do |student, index|
      if student[:name].length < 12
      student[:name].capitalize!
      puts "#{index},#{student[:name]} Age:#{student[:age]} Nationality:#{student[:nationality]} Hobbies:#{student[:hobbies]} (#{student[:cohort]} cohort)"
      student_count += 1
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end
end

students = input_students
#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
