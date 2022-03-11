class Namable
  def correct_name
    raise NotImplementedError
  end
end

class Person < Namable
  attr_accessor :name, :age
  attr_reader :id

  def initalize(_age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = int
    @parent_permission = parent_permission
  end

  # rubocop:disable Naming/PredicateName

  def can_use_services?
    if is_of_age || @parent_permission
      true
    else
      false
    end
  end

  def correct_name
    @name
  end

  private

  def is_of_age
    is_of_age >= 18
  end
  # rubocop:enable Naming/PredicateName
end

class BaseDecorator < Namable
  attr_accessor :namable

  def initialize(namable)
    super()
    @namable = namable
  end

  def correct_name
    @namable.correct_name
  end
end

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @namable.correct_name.upcase
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    @namable.correct_name.strip if @namable.correct_name.length <= 10
  end
end
