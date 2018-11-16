# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "graphql/anycable/version"

Gem::Specification.new do |spec|
  spec.name          = "graphql-anycable"
  spec.version       = GraphQL::Anycable::VERSION
  spec.authors       = ["Andrey Novikov"]
  spec.email         = ["envek@envek.name"]

  spec.summary       = <<~SUMMARY
    A drop-in replacement for GraphQL ActionCable subscriptions for AnyCable.
  SUMMARY

  spec.homepage      = "https://github.com/Envek/graphql-anycable"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "anycable",      "~> 0.6.0"
  spec.add_dependency "anyway_config", "~> 1.3"
  spec.add_dependency "graphql",       "~> 1.8"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "fakeredis"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end