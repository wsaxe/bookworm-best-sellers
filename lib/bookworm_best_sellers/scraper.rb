class BookwormBestSellers::Scraper

  @@doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/the-new-york-times-bestsellers-hardcover-nonfiction/_/N-1p5q"))

  def self.this_week
    if BookwormBestSellers::Book.all == []
      self.scrape_books
      BookwormBestSellers::Book.all
    else
      BookwormBestSellers::Book.all
    end
  end

  def self.scrape_books
    titles = @@doc.search("p.product-info-title").text.split("\n").compact.reject { |i| i.empty? }.map { |i| i[0...-13] }

    authors = @@doc.search("span.contributors").text.split(" by ").reject { |i| i.empty?}

    urls = @@doc.css("p.product-info-title a").map { |i| i['href'].split(";")[0] }

    descriptions = urls.map { |ind_url|
      url = ["http://www.barnesandnoble.com",ind_url].join()
      Nokogiri::HTML(open(url)).css('div#productInfoOverview p').text.split("\n").compact.reject { |i| i.empty? }[0] }

    [*0..9].map! { |index|
      BookwormBestSellers::Book.new(attributes = {title: titles[index], author: authors[index], url: urls[index], description: descriptions[index]}) }
  end

end
