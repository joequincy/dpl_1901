class Author
  attr_reader :books

  def initialize(details)
    @details = details
    @books = []
  end
end
