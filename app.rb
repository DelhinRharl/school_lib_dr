#!/usr/bin/env ruby

require './students'
require './teacher'
require './book'
require './rental'

# rubocop:disable Metrics/ClassLength

class App
  def list_books
    if @books.length.eql?(0)
      puts 'No Books! Please add a book'
    else
      @books.each_with_index do |_book, index|
        puts "#{index + 1} - Title: #{books.title}, Author: #{books.author}"
      end
    end
  end

  def list_persons
    if @persons.length.zero?
      puts 'No person found! Kindly add/create a Person'
    else
      @persons.each_with_index do |person, index|
        if person.is_a?(Teacher)
          puts "[Teacher] #{index + 1} - ID: #{person.id}, Name: #{person.name}, Age: #{person.age}"
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
    puts 'Choose by person ID: '
    list_persons
    print_message if @persons.length.zero?
    id = gets.chomp.to_i
    person = person_object(id)
    if person.nil?
      puts 'Error! Enter correct ID'
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

  def add_new_teacher
    print 'Teacher name: '
    name = gets.chomp
    print 'Teacher age: '
    age = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    Teacher.new(age, specialization, name)
  end

  def add_new_student
    print 'Student name: '
    name = gets.chomp
    print 'Student age: '
    age = gets.chomp
    print ' Has Parent permission [y/n]:'
    permission = gets.chomp
    case permission
    when 'y'
      Student.new(age, name)
    when 'n'
      Student.new(age, name, parent_permission: false)
    else
      puts 'Please enter a valid option'
      add_new_student
    end
  end

  def add_new_person
    puts "\nKindly choose an option below
    1 - To Create a Teacher
    2 -  To Create a Student"
    option = gets.chomp.to_i
    case option
    when 1
      @persons.push(add_new_teacher)
      puts 'New Teacher Added!'
    when 2
      @persons.push(add_new_student)
      puts 'New Student added!'
    else
      puts 'Please choose a valid option'
      add_new_person
    end
  end

  def add_new_book
    puts 'Add the book title:'
    title = gets.chomp
    puts 'Add the  author:'
    author = gets.chomp
    @books.push(Book.new(title, author))
    puts 'New Book added!'
  end

  def add_new_rental
    puts 'Enter book number '
    list_books
    print_message if @books.length.zero?
    book_index = gets.chomp.to_index
    puts 'Choose a person by number: '
    list_persons
    print_message if @persons.length.zero?
    person_index = gets.chomp.to_index
    print 'Enter date: '
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
      add_new_person
    when 4
      add_new_book
    when 5
      add_new_rental
    when 6
      list_rentals
    when 7
      puts 'Thank you for using the Library'
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
    puts 'Entering Libary...'
    print_message
  end
end
# rubocop:enable Metrics/ClassLength
