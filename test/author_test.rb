require './test/test_helper'

class AuthorTest < Minitest::Test
  def setup
    @nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
  end

  def test_it_exists
    assert_instance_of Author, @nk_jemisin
  end

  def test_author_attributes_initialize_correctly
    assert_equal [], @nk_jemisin.books
  end

  def test_author_can_add_books
    @nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    assert_instance_of Book, @nk_jemisin.books[0]
    assert_equal "The Fifth Season", @nk_jemisin.books[0].title
    assert_equal "Jemisin", @nk_jemisin.books[0].author_last_name
    @nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")
    assert_instance_of Book, @nk_jemisin.books[1]
    assert_equal "2010", @nk_jemisin.books[1].publication_date
    assert_equal 2, @nk_jemisin.books.length
  end

  def test_author_returns_added_book_when_adding
    book = @nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    assert_equal book, @nk_jemisin.books.last
  end
end
