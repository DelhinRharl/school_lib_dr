def preserve_rentals
  File.open('./data/rentals.json', 'w') do |file|
    rental_store = @persons.map do |person|
        rentals = person.rentals
        new_rent =rentals.map do |rent,id|
            ({
            Date: rent.date,
            Book: rent.book.title,
            Person:rent.person.name
            })
      end
      file.puts(JSON.pretty_generate(new_rent))
    end
    end
end