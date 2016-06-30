class BookwormBestSellers::Book
  attr_accessor :title, :author, :description

  def self.this_week
    self.scrape_books
  end


  def self.scrape_books
    books = []
    doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/the-new-york-times-bestsellers-hardcover-nonfiction/_/N-1p5q"))
    title_array = doc.search("p.product-info-title").text.split("\n").reject { |item| item.nil? || item == "" }.map { |ind_title| ind_title[0...-13] }
    title_array.each do |ind_title|
      book = self.new
      book.title = ind_title
      books << book
    end
    books.each do |ind_book|
      ind_book.author = "John Smith"
    end
    books
  end

  def self.scrape_console
    doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/the-new-york-times-bestsellers-hardcover-nonfiction/_/N-1p5q"))
    author_array = doc.search("span.contributor").to_s.split("/a")
    author_array.map! do |jumble|
      jumble[-25..-1]
    end
    #clean_array = []
    #author_array.each do |author|
      #clean_author = author.text
      #clean_array << clean_author
    #end
    #clean_array
    author_array
  end

end
