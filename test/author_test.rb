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
end
