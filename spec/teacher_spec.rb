require './teacher'

describe "When adding teacher" do

  it "should create a new teacher" do
    teacher = Teacher.new(20, 'JavaScript', 'Ricky', 'Mormor')
    expect(teacher.name).to eq('Ricky Mormor')
    expect(teacher.age).to eq(20)
    expect(teacher.specialization).to eq('JavaScript')
    end

    it "should validate the teacher's age" do
      teacher = Teacher.new(20, 'JavaScript', 'Ricky', 'Mormor')
      expect(teacher.age).to eq(20)
    end
  
end
