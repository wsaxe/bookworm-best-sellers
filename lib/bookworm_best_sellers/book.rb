class BookwormBestSellers::Book
  attr_accessor :title, :author, :description

  def self.scrape_title
    doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/the-new-york-times-bestsellers-hardcover-nonfiction/_/N-1p5q"))
    titles = doc.search("p.product-info-title").text
    title_array = titles.split("\n").reject { |item| item.nil? || item == "" }
    clean_title_array = title_array.map { |ind_title| ind_title[0...-13] }
  end

  def self.this_week
    book_1 = self.new
    book_1.title = "#{self.scrape_title[0]}"
    book_1.author = "Robert Kiyosaki"
    book_1.description = "Here is some info on book 1..."

    book_2 = self.new
    book_2.title = "Rich Dad Poor Dad"
    book_2.author = "Robert Kiyosaki"
    book_2.description = "Here is some info on book 2..."

    book_3 = self.new
    book_3.title = "Rich Dad Poor Dad"
    book_3.author = "Robert Kiyosaki"
    book_3.description = "Here is some info on book 3..."

    book_4 = self.new
    book_4.title = "Rich Dad Poor Dad"
    book_4.author = "Robert Kiyosaki"
    book_4.description = "Here is some info on book 4..."

    book_5 = self.new
    book_5.title = "Rich Dad Poor Dad"
    book_5.author = "Robert Kiyosaki"
    book_5.description = "Here is some info on book 5..."

    book_6 = self.new
    book_6.title = "Rich Dad Poor Dad"
    book_6.author = "Robert Kiyosaki"
    book_6.description = "Here is some info on book 6..."

    book_7 = self.new
    book_7.title = "Rich Dad Poor Dad"
    book_7.author = "Robert Kiyosaki"
    book_7.description = "Here is some info on book 7..."

    book_8 = self.new
    book_8.title = "Rich Dad Poor Dad"
    book_8.author = "Robert Kiyosaki"
    book_8.description = "Here is some info on book 8..."

    book_9 = self.new
    book_9.title = "Rich Dad Poor Dad"
    book_9.author = "Robert Kiyosaki"
    book_9.description = "Here is some info on book 9..."

    book_10 = self.new
    book_10.title = "Rich Dad Poor Dad"
    book_10.author = "Robert Kiyosaki"
    book_10.description = "Here is some info on book 10..."

    [book_1, book_2, book_3, book_4, book_5, book_6, book_7, book_8, book_9, book_10]
  end

end