require_relative 'person'

class Student < Person
  attr_accessor :classroom

  def initialize(id, age, _classroom, name = 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @classroom = nil
  end

  def assign_to_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end
