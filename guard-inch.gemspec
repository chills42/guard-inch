# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guard/inch/version'

Gem::Specification.new do |spec|
  spec.name          = "guard-inch"
  spec.version       = Guard::InchVersion::VERSION
  spec.authors       = ["Craig Hills"]
  spec.email         = ["chills@gmail.com"]
  spec.summary       = %q{A guard plugin to run the inch documentation measurement tool.}
  spec.description   = %q{This gem is a Guard plugin, which integrates the inch documentation measurement tool.}
  spec.homepage      = 'https://github.com/chills42/guard-inch'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 1"

  spec.add_runtime_dependency "guard", "~> 0"
  spec.add_runtime_dependency "inch", "~> 0"
end
