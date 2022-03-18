require './students'

describe 'Should create a new student' do
  context 'Testing the Student class' do
    student = Student.new(20, 'Affaxed Kiprotich', parent_permission: true)

    it 'should have Student class' do
      expect(student.class) == Student
    end

    it "should validate the student's age and name" do
      expect(student.name).to eq('Affaxed Kiprotich')
      expect(student.age).to eq(20)
    end
  end
end
