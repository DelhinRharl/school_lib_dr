require './app'
require './preserve'
def main
  app = App.new
  app.run
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
    preserve_persons
    puts 'Thank you for using the Library!'
    exit
  else puts 'Kindly enter a valid option'
       print_message
  end
end
# rubocop:enable Metrics/CyclomaticComplexity

main
