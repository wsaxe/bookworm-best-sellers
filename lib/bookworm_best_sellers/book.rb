class BookwormBestSellers::Book
  attr_accessor :title, :author, :description
  @@current_book_list = []

  def self.this_week
    if @@current_book_list == []
      @@current_book_list = self.scrape_books
    else
      @@current_book_list
    end
  end

  def self.scrape_books
    books = []
    self.scrape_titles.each do |ind_title|
      if books.length < 10
        book = self.new
        book.title = ind_title
        books << book
      end
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
    author_array = doc.search("span.contributor").to_s.split("/a").map! { |author| author[-25..-1] }.reject { |author| author.nil? || author == "" }.map! { |author| author.split(">")[1] }.map! { |ind_author| ind_author[0...-1] }
    author_array
  end

end
