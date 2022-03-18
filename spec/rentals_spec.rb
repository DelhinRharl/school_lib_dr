require './book'
require './students'
require './rental'

describe Rental do
  context 'tests book Rentals' do
    title = 'Lovely Miss Ruby'
    author = 'Hart'
    book = Book.new(title, author)
    student = Student.new(21, 'rharl', parent_permission: true)
    date = '2028/2/2'
    rental = Rental.new(date, student, book)

    it 'tests the date' do
      expect(rental.date).to eq date
    end

    it 'tests if its student' do
      expect(rental.person).to eq student
    end

    it 'tests if book is rented or not' do
      expect(rental.book).to eq book
    end
  end
end