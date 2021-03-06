class Book
  attr_reader :author_first_name,
              :author_last_name,
              :title

  def initialize(details)
    @author_first_name = details[:author_first_name]
    @author_last_name = details[:author_last_name]
    @title = details[:title]
    @publication_date = details[:publication_date]
  end

  def publication_date
    @publication_date.slice(-4..-1)
  end
end
