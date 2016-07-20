# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'adroller/version'

Gem::Specification.new do |spec|
  spec.name          = 'adroller'
  spec.version       = Adroller::VERSION
  spec.authors       = ['Nikolas Davis', 'Dustin Goodman']
  spec.email         = ['nikolasliamdavis@gmail.com', 'dustin.s.goodman@gmail.com']
  spec.summary       = 'Ruby API Wrapper for AdRoll'
  spec.description   = 'Ruby Gem for Interaction with AdRoll v1 API'
  spec.homepage      = 'http://www.adroll.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'pry-byebug', '~> 3.4', '>= 3.4.0'
  spec.add_development_dependency 'rspec', '~> 3.0', '>= 3.0.0'
  spec.add_development_dependency 'webmock', '~> 2.1'
  spec.add_development_dependency 'factory_girl', '~> 4.4', '>= 4.4.0'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'

  spec.add_dependency 'httparty', '~> 0.13.1'
  spec.add_dependency 'httmultiparty', '~> 0.3.13'
end
