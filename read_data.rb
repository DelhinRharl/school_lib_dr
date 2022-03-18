def read_person
  if File.exist?('./data/persons.json')

    persona = JSON.parse(File.read('./data/persons.json'))
    persona.map do |person|
      if person['occupation'] == 'Teacher'
        Teacher.new(person['age'], person['specialization'], person['name'])
      else
        Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
      end
    end
  else
    []
  end
end

def read_book
  if File.exist?('./data/books.json')

    books = JSON.parse(File.read('./data/books.json'))
    books.map do |book|
      Book.new(book['title'], book['author'])
    end
  else
    []
  end
end

def read_rentals
  if File.exist?('./data/rentals.json')
    rent = JSON.parse(File.read('./data/rentals.json'))
    rent.map do |rental|
      Rental.new(rental['date'], @persons[rental['person_index']], @books[rental['book_index']])
    end
  else
    []
  end
end
