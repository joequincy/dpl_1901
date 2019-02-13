require './test/test_helper'

class LibraryTest < Minitest::Test
  def setup
    @nk_jemisin = Author.new({first_name: "N.K.", last_name: "Jemisin"})
    @fifth_season = @nk_jemisin.add_book("The Fifth Season", "November 3, 2015")
    @kingdoms = @nk_jemisin.add_book("The Hundred Thousand Kingdoms", "2010")

    @harper_lee  = Author.new({first_name: "Harper", last_name: "Lee"})
    @mockingbird = @harper_lee.add_book("To Kill a Mockingbird", "July 11, 1960")

    @dpl = Library.new
  end

  def test_it_exists
    assert_instance_of Library, @dpl
  end

  def test_library_attributes_initialize_correctly
    assert_equal [], @dpl.books
  end

  def test_library_can_add_books_to_collection
    @dpl.add_to_collection(@fifth_season)
    assert_equal [@fifth_season], @dpl.books
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@kingdoms)
    assert_equal [@fifth_season, @mockingbird, @kingdoms], @dpl.books
  end

  def test_library_can_determine_if_it_includes_book_by_title
    assert_equal true, @dpl.include?("To Kill a Mockingbird")
    assert_equal false, @dpl.include?("A Connecticut Yankee in King Arthur's Court")
  end
end
