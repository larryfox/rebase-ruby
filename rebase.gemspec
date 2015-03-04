lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = 'rebase'
  gem.version       = '1.1.0'
  gem.license       = 'MIT'
  gem.authors       = ['Larry Fox']
  gem.email         = ['l@rryfox.us']
  gem.homepage      = 'https://github.com/larryfox/rebase-ruby'
  gem.description   = 'Convert integers to a given base and back again'
  gem.summary       = 'Convert integers to a given base and back again'

  gem.required_ruby_version = '>= 2.0'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'minitest', '~> 5.5.1'

  gem.files         += Dir.glob('lib/**/*.rb')
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
end
