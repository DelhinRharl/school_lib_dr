class Classroom
  attr_accessor :label
  attr_reader :students

  def initalize(label)
    @label = label
    @students = []
  end

  def add_students(student)
    student.push(student)
    student.classroom = self
  end
end
