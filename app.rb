require './students'
require './teacher'
require './book'
require './rental'

# rubocop:disable Metrics/ClassLength
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

  def list_persons
    if @persons.length.zero?
      puts 'No person found! Kindly add/create a Person'
    else
      @persons.each_with_index do |person, index|
        if person.is_a?(Teacher)
          puts "Teacher #{index + 1} - ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
        else
          puts "[Student] #{index + 1} - ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
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

  def add_teacher
    print "Teacher'\s Name: "
    name = gets.chomp
    print 'Teacher\'s Age: '
    age = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    Teacher.new(age, specialization, name)
  end

  def create_student
    print 'Student name: '
    name = gets.chomp
    print 'Student age: '
    age = gets.chomp
    print 'Parent permission [y/n]:'
    permission = gets.chomp
    case permission
    when 'y'
      Student.new(age, name)
    when 'n'
      Student.new(age, name, parent_permission: false)
    else
      puts 'Please select a valid option.'
      create_student
    end
  end

  def create_person
    puts "\nPlease choose a option by entring a number
    1 -  Create A Teacher:
    2 -  Create a student"
    option = gets.chomp.to_i
    case option
    when 1
      @persons.push(add_teacher)
      puts 'New teacher Added!'
    when 2
      @persons.push(create_student)
      puts 'New Student Added!'
    else
      puts 'Please choose a valid option'
      create_person
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
  # rubocop:disable Metrics/CyclomaticComplexity

  def handle_input(option)
    case option
    when 1
      list_books
    when 2
      list_persons
    when 3
      create_person
    when 4
      add_new_book
    when 5
      add_new_rental
    when 6
      list_rentals
    when 7
      puts 'Thank you for using the Library!'
      exit
    else puts 'Kindly enter a valid option'
         print_message
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

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
# rubocop:enable Metrics/ClassLength
