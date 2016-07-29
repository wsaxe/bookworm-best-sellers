class BookwormBestSellers::Book
  attr_accessor :title, :author, :description, :url
  @@current_book_list = []
  @@current_descriptions = []
  @@doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/the-new-york-times-bestsellers-hardcover-nonfiction/_/N-1p5q"))

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
    books.each.with_index(0) do |ind_book, i|
      ind_book.url = ["http://www.barnesandnoble.com",self.scrape_urls[i]].join()
    end
    books.each.with_index(0) do |ind_book, i|
      ind_book.description = self.scrape_descriptions[i]
    end
    books
  end

  def self.scrape_titles
    @@doc.search("p.product-info-title").text.split("\n").reject { |item| item.nil? || item == "" }.map { |ind_title| ind_title[0...-13] }
  end

  def self.scrape_authors
    @@doc.search("span.contributor").to_s.split("/a").map! { |author| author[-25..-1] }.reject { |author| author.nil? || author == "" }.map! { |author| author.split(">")[1] }.compact.map! { |ind_author| ind_author[0...-1] }
  end

  def self.scrape_urls
    [*0..9].map! { |index| @@doc.css("p.product-info-title a")[index]['href'].split(";")[0] }
  end

  def self.scrape_descriptions
    if @@current_descriptions == []
      @@current_descriptions = [*0..9].map! do |i|
        url = ["http://www.barnesandnoble.com",self.scrape_urls[i]].join()
        Nokogiri::HTML(open(url)).css('div#productInfoOverview p').text.split("\n").reject { |item| item.nil? || item == "" }[0]
      end
    else
      @@current_descriptions
    end
  end

end
