require_relative '../person'  
require_relative '../students'

describe Person do
  context 'When testing the Person class' do
    age = 22
    name = 'Affaxed'
    parent_permission = true
    person = Person.new(age, name, parent_permission: parent_permission)
    person_two = Person.new(15, name, parent_permission: false)

    it 'check name' do
      expect (person.name).to eq name
    end
  end
end
