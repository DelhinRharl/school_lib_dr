require './person'

class Teacher < Person
  attr_reader :classroom

  def initalize(age, specialization, name = 'Unknown')
    super(age, name)
    @specialization = specialization
  end

  def classroom=(studentclass)
    @classroom = studentclass
    studentclass.students.push(self) unless studentclass.students.include?(self)
  end

  def can_use_services?
    true
  end
end

student = Teacher.new('A', 20)
puts student.age
