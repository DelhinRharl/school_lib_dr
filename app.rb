require './students'
require './teacher'
require './book'
require './rental'
require 'json'

class App
  def list_books
    if @books.length.zero?
      puts 'No Books! Please add a book'
    else
      @books.each_with_index do |book, index|
        puts "#{index + 1} - Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def preserve_persons
    File.open('persons.json', 'w') do |file|
     person_store = @persons.map do |person|
         ({ name: person.name, age: person.age})
        # puts person.read
      end
     file.puts(JSON.pretty_generate(person_store))
    end
  end

  def list_persons
    if @persons.length.zero?
      puts 'No person found! Kindly add/create a Person'
    else
      @persons.each_with_index do |person, index|
        if person.is_a?(Teacher)
          puts "Teacher #{index + 1} - ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
        else
          puts "Student #{index + 1} - ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
        end
        end
    end
  end

  def person_object(id)
    @persons.each do |person|
      return person if person.id == id
    end
    nil
  end

  def list_rentals
    puts 'Choose person by ID: '
    list_persons
    print_message if @persons.length.zero?
    id = gets.chomp.to_i
    person = person_object(id)
    if person.nil?
      puts 'Id Error! Kindly enter correct ID'
      return
    end
    rentals = person.rentals
    if rentals.length.zero?
      puts 'No rentals under this name. Kindly add a rental'
    else
      rentals.each_with_index do |rent, index|
        puts "#{index + 1} - Date: #{rent.date}, Book: #{rent.book.title} by #{rent.person.name}"
      end
    end
  end

  def add_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp
    Teacher.new(age, specialization, name)
  end

  def input_teacher
    print ' Teacher name:'
    name = gets.chomp
    print ' teacher age:'
    age = gets.chomp.to_i
    add_teacher(age, name)
  end

  def add_student(name, age)
    print 'Parent permission [y/n]:'
    permission = gets.chomp
    case permission
    when 'y'
      Student.new(name, age)
      # write student data into file
    when 'n'
      Student.new(name, age, parent_permission: false)
    end
  end

  def student_input
    print 'Student Name: '
    name = gets.chomp
    print ' Student Age: '
    age = gets.chomp.to_i
    add_student(age, name)
  end

  def create_person
    puts "\nPlease choose a option
    1 -  Create A Teacher:
    2 -  Create a student"
    option = gets.chomp.to_i
    case option
    when 1
      @persons.push(input_teacher)
      puts 'New teacher Added!'
    when 2
      @persons.push(student_input)
      puts 'New Student Added!'
    else
      puts 'Please choose a valid option'
    end
  end

  def add_new_book
    puts 'Add title'
    title = gets.chomp
    puts 'Add author'
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts 'New Book Added'
  end

  def add_new_rental
    puts 'Enter book number '
    list_books
    print_message if @books.length.zero?
    book_index = gets.chomp.to_i
    puts 'Choose person by Number: '
    list_persons
    print_message if @persons.length.zero?
    person_index = gets.chomp.to_i
    print 'Enter rental date: '
    date = gets.chomp
    Rental.new(date, @persons[person_index - 1], @books[book_index - 1])
    puts "New rental added succesfully -
    book: #{@books[book_index - 1].title}, Person: #{@persons[person_index - 1].name}, Date: #{date}"
  end

  def print_message
    puts "\nPlease enter a number to choose an option
    \n1 - List all books
    \n2 - List all persons
    \n3 - Add a new person
    \n4 - Add a  new book
    \n5 - Add a rental
    \n6 - List all rentals under  person's name
    \n7 - Exit"
    option = gets.chomp.to_i
    handle_input(option)
    print_message
  end

  def run
    @books = []
    @persons = []
    puts 'Entering the Library'
    print_message
  end
end
