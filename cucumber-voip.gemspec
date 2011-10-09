# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "cucumber-voip/version"

Gem::Specification.new do |s|
  s.name        = "cucumber-voip"
  s.version     = CucumberVoIP::VERSION
  s.authors     = ["Ben Langfeld"]
  s.email       = ["ben@langfeld.me"]
  s.homepage    = "https://github.com/benlangfeld/cucumber-voip"
  s.summary     = %q{Plain-english functional testing of voice systems}
  s.description = %q{Automated functional testing of voice applications is typically difficult and expensive. Not so when we can specify our systems using Cucumber.}

  s.rubyforge_project = "cucumber-voip"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'cucumber', '>= 1.0.2'
  s.add_runtime_dependency 'activesupport', '>= 3.0.10'
  s.add_runtime_dependency 'rspec-rayo', '>= 0.1.15'

  s.add_development_dependency 'bundler', '~> 1.0.0'
  s.add_development_dependency 'yard', '~> 0.6.0'
  s.add_development_dependency 'rake', '>= 0'
  s.add_development_dependency 'guard-cucumber'
end
