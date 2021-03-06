# Fibonator

Simple gem for calculating nth element of Fibonacci sequence.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fibonator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fibonator

## Usage

To get nth element of Fibonacci sequence run:
    
```ruby
Fibonator.nth_element(n)
````

To overwrite SOFT_LIMIT:

```ruby
Fibonator.nth_element(n, soft_limit: 0)
```

To use different calculator:

```ruby
Fibonator.nth_element(n, calculator: :recursive)
Fibonator.nth_element(n, calculator: :matrix)
```

To get recommended soft limit:

```ruby
Fibonator.soft_limit # for default calculator

Fibonator.soft_limit(:recursive)
Fibonator.soft_limit(:matrix)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/novak22/fibonator.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
