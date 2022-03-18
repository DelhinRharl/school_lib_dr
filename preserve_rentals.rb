# require './app'
# def preserve_rentals
#  File.open('./data/rentals.json', 'w') do |file|
#   new_rental = @rentals.map do |person|
#     # rentals = person.rentals
#     # new_rental = rentals.map do |rent, id|
#       { Date: person.date, book_index: book_index - 1, person_index: person_index - 1}
#     end
#     file.puts(JSON.pretty_generate(new_rental))
#   end
# end
