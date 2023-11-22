require_relative 'person'

class Teacher < Person
  def initialize(id, age, parent_permission, specialization, name = 'Unknows')
    super(id, age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end
