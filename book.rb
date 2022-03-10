require './rental'
class Book
  attr_accessor :label, :author
  attr_reader :rentals

  def initalize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, person, self)
  end
end
