require './classroom'
require './students'

describe Classroom do
  context 'Tests Classroom class' do
    label = 'Python'
    student = Student.new(21, 'Lenzo', parent_permission: true)
    classroom = Classroom.new(label)
    classroom.add_student(student)

    it 'tests classroom label' do
      expect(classroom.label).to eq label
    end

    it 'tests students in classroom' do
      expect(classroom.students[0]).to eq student
    end
  end
end
