require './app'
def preserve_persons
    File.open('./data/persons.json', 'w') do |file|
     person_store = @persons.map do |person, index, id|
      if person.is_a?(Teacher)
        ({
          occupation: "Teacher",
          name: person.name,
          age: person.age,
          id: person.id,
          # specialization: person.specialization,
          # index: index += 1
        })
      else
        ({
          occupation: "Student",
          name: person.name,
          age: person.age,
          # parent_permission: person.parent_permission,
        })
      end
      end
        # puts person.read
        file.puts(JSON.pretty_generate(person_store))
    end
end
