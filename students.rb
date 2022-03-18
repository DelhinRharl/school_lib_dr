require './person'

class Student < Person
  attr_reader :classroom

  # rubocop:disable Lint/UnusedMethodArgument
  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: true)
  end

  def classroom=(studentclass)
    @classroom = studentclass
    studentclass.students.push(self) unless studentclass.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

# rubocop:enable Lint/UnusedMethodArgument
