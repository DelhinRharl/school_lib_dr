require './app'
require './preserve_persons'
require './preserve_books'
require './preserve_rentals'
require './read_data'

def main
  app = App.new
  app.run
end

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity
def handle_input(option)
  case option
  when 1
    list_books
  when 2
    list_persons
  when 3
    create_person
    preserve_persons
  when 4
    add_new_book
    preserve_books
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
# rubocop:enable Metrics/MethodLength

main
