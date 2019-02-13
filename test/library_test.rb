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
    @dpl.add_to_collection(@fifth_season)
    assert_equal [@fifth_season], @dpl.books
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@kingdoms)
    assert_equal true, @dpl.include?("To Kill a Mockingbird")
    assert_equal false, @dpl.include?("A Connecticut Yankee in King Arthur's Court")
  end

  def test_library_can_produce_card_catalog
    @dpl.add_to_collection(@fifth_season)
    assert_equal [@fifth_season], @dpl.books
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@kingdoms)
    assert_equal [@fifth_season, @kingdoms, @mockingbird], @dpl.card_catalog
  end

  def test_library_can_find_books_by_author
    @dpl.add_to_collection(@fifth_season)
    assert_equal [@fifth_season], @dpl.books
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@kingdoms)
    expected = {
      "The Fifth Season" => @fifth_season,
      "The Hundred Thousand Kingdoms" => @kingdoms
    }
    assert_equal expected, @dpl.find_by_author("N.K. Jemisin")
  end

  def test_library_can_find_books_by_publication_year
    @dpl.add_to_collection(@fifth_season)
    assert_equal [@fifth_season], @dpl.books
    @dpl.add_to_collection(@mockingbird)
    @dpl.add_to_collection(@kingdoms)
    expected = {
      "To Kill a Mockingbird" => @mockingbird
    }
    assert_equal expected, @dpl.find_by_publication_date("1960")
  end
end
