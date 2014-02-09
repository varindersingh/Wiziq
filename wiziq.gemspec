#encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wiziq/version'

Gem::Specification.new do |spec|
  spec.name          = "wiziq"
  spec.version       = Wiziq::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.author        = "Varinder Singh"
  spec.email         = "vicky98284@gmail.com"
  spec.description   = %q{A library to access wiziq REST api}
  spec.summary       = %q{A library to access wiziq REST api.This is summary}
  spec.homepage      = %q{https://github.com/varindersingh/wiziq}
  spec.license       = "MIT"
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_dependency 'nokogiri', '~> 1.6'
  spec.add_runtime_dependency 'faraday', '~> 0.9'
  spec.add_runtime_dependency 'tzinfo', '~> 1.0'
  spec.add_development_dependency "rake"
end
