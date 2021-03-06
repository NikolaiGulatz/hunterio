# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require File.expand_path('../lib/hunter/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "hunterio"
  spec.version       = Hunter::VERSION
  spec.authors       = ["Vincenzo Ruggiero"]
  spec.email         = ["vincenzo@prospect.io"]
  spec.homepage      = 'https://github.com/prospectio/hunterio'

  spec.summary       = %q{A Ruby wrapper around Hunter.io API V2}
  spec.description   = %q{A ruby wrapper around Hunter.io API V2. Direct access to all the web's email addresses.}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "typhoeus"

  spec.required_ruby_version = ">= 1.9.3"

  spec.add_dependency "faraday"
  spec.add_dependency "json"

end
