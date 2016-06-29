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
    @books.each.with_index(1) do |book, i|
      puts "#{i} - #{book.title} - #{book.author}"
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
