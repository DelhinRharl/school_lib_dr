def read_person
    if File.exist?('./data/persons.json')

    persona =  JSON.parse(File.read('./data/persons.json'))
    persona.map do | person|
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
