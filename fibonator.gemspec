# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fibonator/version'

Gem::Specification.new do |spec|
  spec.name          = 'fibonator'
  spec.version       = Fibonator::VERSION
  spec.authors       = ['Novak']
  spec.email         = ['novak_is@live.com']

  spec.summary       = 'Calculate the nth Fibonacci number using recursive, matrix, or Dijkstra algorithms.'
  spec.description   = 'Fibonator provides three Fibonacci calculators with configurable soft limits. ' \
                       'The Dijkstra calculator (default) supports negative indices and scales to n=100M.'
  spec.homepage      = 'https://github.com/novak22/fibonator'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 3.0')

  spec.metadata['homepage_uri']          = spec.homepage
  spec.metadata['source_code_uri']       = 'https://github.com/novak22/fibonator'
  spec.metadata['changelog_uri']         = 'https://github.com/novak22/fibonator/blob/master/CHANGELOG.md'
  spec.metadata['rubygems_mfa_required'] = 'true'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir      = 'bin'
  spec.executables = []
  spec.require_paths = ['lib']

  spec.add_dependency 'matrix'

  spec.add_development_dependency 'bundler', '>= 2.0'
  spec.add_development_dependency 'rake', '>= 10.0'
  spec.add_development_dependency 'rspec', '>= 3.9.3'
  spec.add_development_dependency 'rubocop', '>= 1.50'
  spec.add_development_dependency 'rubocop-rspec', '>= 2.20'
end
