# -*- encoding: utf-8 -*-

require File.expand_path('../lib/banking_data/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'banking_data'
  gem.version       = BankingData::VERSION
  gem.summary       = %q{Banking data for German, Austrian, Dutch and Swiss banks}
  gem.description   = %q{This gem exposes the official banking data of the respective national banks of Germany, Austria, Netherlands and Switzerland, including bank codes and SWIFT-codes/BICs.}
  gem.license       = 'MIT'
  gem.authors       = ['Frank C. Eckert']
  gem.email         = 'frank.eckert@boost-project.com'
  gem.homepage      = 'https://github.com/opahk/banking_data'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'activesupport'
  gem.add_dependency 'activemodel'
  gem.add_dependency 'smarter_csv', '>= 1.2.9'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'coveralls'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'rubocop'
  gem.add_development_dependency 'appraisal'

  if ENV['RUBY_VERSION'] =~ /rbx/
    gem.add_dependency 'rubysl'
    gem.add_development_dependency 'rubinius-coverage'
  end
end
