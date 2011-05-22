# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bdd-legacy/version"

Gem::Specification.new do |s|

  s.add_dependency "rake"
  s.add_dependency "bundler", "~> 1.0.9" 
  s.add_dependency "fakeweb", "~> 1.3" 
  s.add_dependency "rdoc", "~> 2.5" 
  s.add_dependency "rspec", "~> 2.1" 
  s.add_dependency "simplecov", "~> 0.3" 
  s.add_dependency "thor", ">= 0.10.2" 
  s.add_dependency "aruba", ">= 0.3.4" 
  s.add_dependency "builder", ">= 2.1.2" 
  s.add_dependency "capybara", ">= 0.4.1" 
  s.add_dependency "diff-lcs", ">= 1.1.2" 
  s.add_dependency "gherkin", ">= 2.3.5" 
  s.add_dependency "json", ">= 1.4.6" 
  s.add_dependency "nokogiri", ">= 1.4.4" 
  s.add_dependency "prawn", ">= 0.8.4" 
  s.add_dependency "prawn-layout", ">= 0.8.4" 
  s.add_dependency "rack-test", ">= 0.5.7" 
  s.add_dependency "ramaze", ">= 0" 
  s.add_dependency "rspec", ">= 2.5.0" 
  s.add_dependency "simplecov", ">= 0.4.1" 
  s.add_dependency "sinatra", ">= 1.2.0" 
  # s.add_dependency "spork", ">= 0.8.4" 
  s.add_dependency "syntax", ">= 1.0.0" 
  s.add_dependency "term-ansicolor", ">= 1.0.5" 
  s.add_dependency "webrat", ">= 0.7.3" 
  s.add_dependency "cucumber", ">= 0.10.2" 
  
  s.name        = "bdd-legacy"
  s.version    = Bdd::Legacy::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Wavell Watson"]
  s.email       = ["wavel.watson@gmail.com"]
  s.homepage    = "https://github.com/wavell2003/bdd-legacy"
  s.summary     = %q{Installs tools needed for bdd testing of legacy applications.}
  s.description = %q{Allows for use of feature driven testing of legacy (especially sql server) applications.}

  s.rubyforge_project = "bdd-legacy"

  s.files         = `git ls-files`.split("\n")  
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/bdd-legacy`.split("\n").map{ |f| File.basename(f) }   
  s.require_paths = ["lib"]
end
