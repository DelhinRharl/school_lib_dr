require './students'

describe "Should create a new student" do

  it "should create a new student" do
    student = Student.new(20, 'John', 'Doe')
    expect(student.name).to eq('Affaxed Kiprotich')
    expect(student.age).to eq(20)
  end

  it "should validate the student's age" do
    student = Student.new(20, 'John', 'Doe')
    expect(student.age).to eq(20)
  end
end