#!/usr/bin/env ruby

require './person'

class Student < Person
  attr_reader :classroom

  def initalize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def classroom=(studentsclass)
    @classroom = studentsclass
    studentsclass.students.push(self) unless studentsclass.students.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end

student = Student.new(20, 'delhin')
puts student.name
student = Student.new(22, 'rharl')
puts student.age
