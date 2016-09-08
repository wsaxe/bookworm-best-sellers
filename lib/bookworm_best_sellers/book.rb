class BookwormBestSellers::Book
  attr_accessor :title, :author, :description, :url
  @@current_book_list = []

  def initialize(attributes = {})
    @title = attributes[:title]
    @author = attributes[:author]
    @description = attributes[:description]
    @url = attributes[:url]
    @@current_book_list << self
  end

  def self.all
    @@current_book_list
  end

end
