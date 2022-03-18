require './teacher'

describe "should create teacher" do
  context 'Testing the Teacher class' do
    teacher = Teacher.new(30, 'JavaScript', 'Teddy')

    it "should have Teacher class" do
      expect(teacher.class) == Teacher
    end

    it "should validate the teacher's age, specialization and name" do
      expect(teacher.name).to eq('Teddy')
      expect(teacher.age).to eq(30)
      expect(teacher.specialization).to eq('JavaScript')
    end
  end
  
end
