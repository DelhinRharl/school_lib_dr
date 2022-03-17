 def preserve_persons
    File.open('./data/persons.json', 'a') do |file|
     person_store = @persons.map do |person|
         ({ name: person.name, age: person.age})
        # puts person.read
    end
    file.puts(JSON.pretty_generate(person_store))
    end
  end

  