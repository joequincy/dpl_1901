class Author
  attr_reader :books

  def initialize(details)
    @first_name = details[:first_name]
    @last_name = details[:last_name]
    @books = []
  end

  def add_book(title, publication_date)
    @books << Book.new({
      author_first_name: @first_name,
      author_last_name: @last_name,
      title: title,
      publication_date: publication_date
    })
    @books.last
  end
end
