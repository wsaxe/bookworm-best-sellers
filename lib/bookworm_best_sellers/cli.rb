class BookwormBestSellers::CLI

  def call
    list_books
    prompt
  end

  def week_label
    "6/19/2016"
  end

  def list_books
    puts "\nBest Sellers for this week - #{week_label}\n\n"
    @books = BookwormBestSellers::Book.this_week
    puts(<<-DOC.gsub /^\s+/, "")
      1 - #{@books[0].title} - #{@books[0].author}
      2 - #{@books[1].title} - #{@books[1].author}
      3 - #{@books[2].title} - #{@books[2].author}
      4 - #{@books[3].title} - #{@books[3].author}
      5 - #{@books[4].title} - #{@books[4].author}
      6 - #{@books[5].title} - #{@books[5].author}
      7 - #{@books[6].title} - #{@books[6].author}
      8 - #{@books[7].title} - #{@books[7].author}
      9 - #{@books[8].title} - #{@books[8].author}
      10 - #{@books[9].title} - #{@books[9].author}
    DOC
  end

  def prompt
    puts "\nType a number to learn more about a book, LIST to see the list again, or type EXIT."
    input = gets.strip.downcase
      case input
        when "1"
          puts "\n#{@books[0].description}"
          prompt
        when "2"
          puts "\n#{@books[1].description}"
          prompt
        when "3"
          puts "\n#{@books[2].description}"
          prompt
        when "4"
          puts "\n#{@books[3].description}"
          prompt
        when "5"
          puts "\n#{@books[4].description}"
          prompt
        when "6"
          puts "\n#{@books[5].description}"
          prompt
        when "7"
          puts "\n#{@books[6].description}"
          prompt
        when "8"
          puts "\n#{@books[7].description}"
          prompt
        when "9"
          puts "\n#{@books[8].description}"
          prompt
        when "10"
          puts "\n#{@books[9].description}"
          prompt
        when "exit"
          exit_message
        when "list"
          call
        else
          puts "\nINVALID CHOICE"
          prompt
      end
  end

  def exit_message
    puts "\nThanks for using Bookworm! Have a great day!\n\n"
  end

end