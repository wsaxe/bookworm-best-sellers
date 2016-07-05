# Bookworm Best Sellers

The Bookworm gem provides the current week's bestselling books in the USA according to the New York Times. Best Selling Book list is live updated when the gem is executed via the CLI in bin/bookworm

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'bookworm_best_sellers'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bookworm_best_sellers

## Usage

Current usage is via CLI, which will allow the output of the top 10 best selling books for the current week along with description, author, and ranking.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wsaxe/bookworm-best-sellers. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
