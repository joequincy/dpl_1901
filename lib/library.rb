class Library
  attr_reader :books

  def initialize
    @books = []
  end

  def add_to_collection(book)
    @books << book
  end

  def include?(title)
    @books.any?{|book| book.title == title}
  end

  def card_catalog
    @books.sort_by{|book| book.author_last_name}
  end

  def find_by_author(full_name)
    authored_books = {}
    @books.each do |book|
      if full_name == "#{book.author_first_name} #{book.author_last_name}"
        authored_books[book.title] = book
      end
    end
    return authored_books
  end
end
