require './book'

describe Book do
  context 'testing book class' do
    title = 'Made of Bones'
    author = 'Delhin Rharl'
    book = Book.new(title, author)

    it 'Check for author' do
      expect(book.author).to eq author
    end

    it 'checks for title' do
      expect(book.title).to eq title
    end
  end
end
