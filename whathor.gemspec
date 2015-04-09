# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'whathor/version'

Gem::Specification.new do |spec|
  spec.name          = "whathor"
  spec.version       = Whathor::VERSION
  spec.authors       = ["Larry Morales Jordan"]
  spec.email         = ["larrymoralesjordan@gmail.com"]
  spec.summary       = %q{Wraper gem for your app to be able to send whatsapp meesages.}
  spec.description   = %q{Wraper gem to help your app send whatsapp messages from your app using whatools API.}
  spec.homepage      = "https://github.com/larrymjordan/whathor"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", '~> 3'

  spec.add_runtime_dependency "rest-client", "~> 1.8"
end
