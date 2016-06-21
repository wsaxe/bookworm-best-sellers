module BookwormBestSellers
  # Your code goes here...
end

class BookwormBestSellers::CLI

  def call
    puts "Best Sellers for this week - 6/19/2016\n\n"
    puts(<<-EOT.gsub /^\s+/, "")
      1 - "The 10 Best People" - John Smith 
      2 - "Name Here" - Author Here
      3 - "Name Here" - Author Here
      4 - "Name Here" - Author Here
      5 - "Name Here" - Author Here
      6 - "Name Here" - Author Here
      7 - "Name Here" - Author Here
      8 - "Name Here" - Author Here
      9 - "Name Here" - Author Here
      10 - "Name Here" - Author Here
    EOT
    puts "\nType a number to learn more about a book or type EXIT."
  end

end