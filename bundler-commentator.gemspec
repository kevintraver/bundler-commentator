# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bundler/commentator/version'

Gem::Specification.new do |spec|
  spec.name          = "bundler-commentator"
  spec.version       = Bundler::Commentator::VERSION
  spec.authors       = ["Kevin Traver"]
  spec.email         = ["kevintraver@gmail.com"]
  spec.summary       = %q{Automatically add comments to your Gems}
  spec.description   = %q{Comment your Gemfile with descriptions from RubyGems.org}
  spec.homepage      = "https://github.com/kevintraver/bundler-commentator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ["bundler-commentator"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


  spec.add_dependency "gems", '~> 0.8'
  spec.add_dependency "commander", "~> 4.2"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
