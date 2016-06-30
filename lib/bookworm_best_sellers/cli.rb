class BookwormBestSellers::CLI

  def call
    list_books
    menu
    goodbye
  end

  def list_books
    # here doc - http://blog.jayfields.com/2006/12/ruby-multiline-strings-here-doc-or.html
    puts "Best Sellers for Week of #{current_week}"
    @books = BookwormBestSellers::Book.this_week
    @books.each.with_index(1) do |book, i|
      puts "#{i}. #{book.author} - #{book.title}"
    end
  end

  def current_week
    "6/26/2016"
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the book you'd like more info on or type list to see the books again or type exit:"
      input = gets.strip.downcase

      if input.to_i > 0
        the_book = @books[input.to_i-1]
        puts "#{the_book.name} - #{the_book.author}"
      elsif input == "list"
        list_deals
      else
        puts "Not sure what you want, type list or exit."
      end
    end
  end

  def goodbye
    puts "Thank you for using bookworm!"
  end
end
