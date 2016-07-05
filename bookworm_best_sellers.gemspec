# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bookworm_best_sellers/version'

Gem::Specification.new do |spec|
  spec.name          = "bookworm_best_sellers"
  spec.version       = BookwormBestSellers::VERSION
  spec.authors       = ["William Saxe"]
  spec.email         = ["geosaxe@gmail.com"]

  spec.summary       = %q{The Bookworm gem provides the current week's bestselling books in the USA.}
  spec.description   = %q{The Bookworm gem provides the current week's bestselling books in the USA according to the New York Times. Best Selling Book list is live updated when the gem is executed.}
  spec.homepage      = "https://github.com/wsaxe/bookworm-best-sellers"
  spec.license       = "MIT"



  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
