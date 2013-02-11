# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'temporal_locality/version'

Gem::Specification.new do |gem|
  gem.name          = "temporal_locality"
  gem.version       = TemporalLocality::VERSION
  gem.authors       = ["Stuart Blair"]
  gem.email         = ["stuart.a.blair@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

	gem.add_development_dependency "rspec", "~>2.11"
	gem.add_development_dependency "cucumber", "~>1.2"
	gem.add_development_dependency "aruba", "~>0.5"
end
