# Fibonator

A Ruby gem for calculating the nth element of the Fibonacci sequence using three different algorithms: recursive (memoized), matrix exponentiation, and Dijkstra's algorithm.

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

### Basic usage

```ruby
Fibonator.nth_element(n)
```

### Choosing a calculator

```ruby
Fibonator.nth_element(n, calculator: :dijkstra)   # default
Fibonator.nth_element(n, calculator: :matrix)
Fibonator.nth_element(n, calculator: :recursive)
```

### Overriding the soft limit

Pass `soft_limit: 0` to disable the limit entirely:

```ruby
Fibonator.nth_element(n, soft_limit: 0)
Fibonator.nth_element(n, soft_limit: 500_000)
```

### Checking the soft limit for a calculator

```ruby
Fibonator.soft_limit             # default (:dijkstra) => 100_000_000
Fibonator.soft_limit(:recursive) # => 10_000
Fibonator.soft_limit(:matrix)    # => 10_000_000
```

### Timing

Print elapsed time to stdout:

```ruby
Fibonator.nth_element(n, log_time: true)
# => total time: 0.000123 seconds
```

### Negative indices

The Dijkstra and matrix calculators support negative Fibonacci indices (negafibonacci convention: `F(-n) = (-1)^(n+1) * F(n)`):

```ruby
Fibonator.nth_element(-1)   #=> 1
Fibonator.nth_element(-2)   #=> -1
Fibonator.nth_element(-6)   #=> -8
Fibonator.nth_element(-7)   #=> 13
```

The `:recursive` calculator does not support negative indices and will raise `ArgumentError`.

## Calculators

| Calculator    | Soft limit    | Negative support | Notes                                       |
|---------------|---------------|------------------|---------------------------------------------|
| `:dijkstra`   | 100,000,000   | Yes              | Fastest for large n; recommended default    |
| `:matrix`     | 10,000,000    | Yes              | Matrix exponentiation; good for medium n    |
| `:recursive`  | 10,000        | No               | Memoized recursion; suitable for small n    |

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/novak22/fibonator.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
