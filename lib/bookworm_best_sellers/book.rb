class BookwormBestSellers::Book
  attr_accessor :title, :author, :description

  def self.this_week
    self.scrape_books
  end

  def self.scrape_books
    books = []
    self.scrape_titles.each do |ind_title|
      book = self.new
      book.title = ind_title
      books << book
    end
    books.each.with_index(0) do |ind_book, i|
      ind_book.author = self.scrape_authors[i]
    end
    books
  end

  def self.scrape_titles
    doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/the-new-york-times-bestsellers-hardcover-nonfiction/_/N-1p5q"))
    title_array = doc.search("p.product-info-title").text.split("\n").reject { |item| item.nil? || item == "" }.map { |ind_title| ind_title[0...-13] }
    title_array
  end

  def self.scrape_authors
    doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/the-new-york-times-bestsellers-hardcover-nonfiction/_/N-1p5q"))
    author_array = doc.search("span.contributor").to_s.split("/a").map! { |author| author[-25..-1] }.reject { |item| item.nil? || item == "" }
    author_array.map! do |pile|
      pile.split(">")[1]
    end
    author_array.map! { |ind_author| ind_author[0...-1] }
    author_array
  end

end
