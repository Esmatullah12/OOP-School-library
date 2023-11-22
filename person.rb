require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknwon', parent_permission = true)
    @id = Random.rand(1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services
    true
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end


person = Person.new(22, name = 'esmatasdfasdfasd')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name