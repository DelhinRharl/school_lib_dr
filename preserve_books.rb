def preserve_books
  File.open('./data/books.json', 'w') do |file|
   book_store = @books.map do |book|
    ({
      title: book.title,
      author: book.author
    })
    end
    file.puts(JSON.pretty_generate(book_store))
    end
      # puts person.read
end