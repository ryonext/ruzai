# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruzai/version'

Gem::Specification.new do |spec|
  spec.name          = "ruzai"
  spec.version       = Ruzai::VERSION
  spec.authors       = ["ryonext"]
  spec.email         = ["ryonext.s@gmail.com"]

  spec.summary       = %q{This gem suspends an annoying user's account for a while.}
  spec.description   = %q{You can suspend user's account for a while and automatically release it after a period.}
  spec.homepage      = "https://github.com/ryonext/ruzai"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"
  spec.add_dependency "activerecord", ["> 3.0", "< 5.0"]
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "timecop"
  spec.add_development_dependency "sqlite3"
end
