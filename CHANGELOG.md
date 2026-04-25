# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Fixed
- Wrap all calculator modules inside `Fibonator` to prevent global namespace pollution
- Fix test suite always testing Dijkstra instead of the iterated calculator
- Fix matrix calculator returning `Rational` for negative indices
- Guard `:recursive` calculator against negative input (raises `ArgumentError`)
- Move `matrix` from development to runtime dependency (required on Ruby >= 3.1)
- Use monotonic clock for `log_time` measurement instead of wall clock

### Changed
- Remove unused `return_result:` parameter from `nth_element`
- Improve error message for invalid calculator symbol to list valid options
- Simplify `valid_argument?` — remove unnecessary `rescue StandardError`
- Gemspec: populate metadata, fix `bindir`, update Bundler constraint to `>= 2.0`
- Add RuboCop with `rubocop-rspec` and enforce style on all source files

### Added
- Matrix and Dijkstra calculators now support negative Fibonacci indices
- New tests: negative indices, invalid calculator, float/whitespace string rejection, `log_time`, `soft_limit` API
- `.rubocop.yml` configuration

## [0.3.1] - 2024-01-01

### Changed
- Refactored calculator internals to use `call` interface
- Bumped gem versions

## [0.3.0] - 2024-01-01

### Added
- Dijkstra calculator with support for negative Fibonacci indices
- Configurable `soft_limit` per calculator

## [0.2.0] - 2024-01-01

### Added
- Matrix exponentiation calculator

## [0.1.0] - 2024-01-01

### Added
- Initial release with recursive Fibonacci calculator
