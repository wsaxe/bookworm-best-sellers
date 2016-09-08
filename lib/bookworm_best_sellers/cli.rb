class BookwormBestSellers::CLI

  def call
    puts "\nLOADING BEST SELLERS..."
    list_books
    prompt
  end

  def list_books
    @books = BookwormBestSellers::Scraper.this_week
    puts "\nBest Sellers - Week of #{current_week}\n\n"
    @books.each.with_index(1) do |book, i|
      puts "#{i}. #{book.title} - #{book.author}"
    end
  end

  def current_week
    time = Time.new
    if time.wday == 0
      time.strftime("%B %d, %Y")
    else
      sunday = time - (time.wday * 86400)
      sunday.strftime("%B %d, %Y")
    end
  end

  def prompt
    puts "\nType a number to learn more about a book, LIST to see the list again, or type EXIT."
    input = gets.strip.downcase
    if input.to_i > 0 && input.to_i < 11
      puts "\n#{@books[input.to_i-1].description}"
      prompt
    elsif input == "exit"
      exit_message
    elsif input == "list"
      list_books
      prompt
    else
      puts "\nINVALID CHOICE"
      prompt
    end
  end

  def exit_message
    puts "\nThanks for using Bookworm! Have a great day!\n\n"
  end
end
