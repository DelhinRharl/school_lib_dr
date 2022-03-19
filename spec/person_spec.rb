require_relative '../person'
require_relative '../students'

describe Person do
  context 'Testing the Person class' do
    person = Person.new(23, 'Adam', parent_permission: true)

    it 'has the class Person' do
      expect(person.class) == Person
    end

    it 'should have the right name, age and permission' do
      expect(person.age).to eq 23
      expect(person.name).to eq 'Adam'
      expect(person.parent_permission).to eq true
    end
  end
end
