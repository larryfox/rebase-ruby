lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = 'rebase'
  gem.version       = '1.0.0'
  gem.license       = 'MIT'
  gem.authors       = ['Larry Fox']
  gem.email         = ['l@rryfox.us']
  gem.homepage      = 'https://github.com/larryfox/rebase-ruby'
  gem.description   = 'Encode and decode from base 10 to string in the given base. Accepts bases 2—62, or an array of an arbitrary alphabet.'
  gem.summary       = 'Convert integers to a given base.'

  gem.required_ruby_version = '>= 2.0'

  gem.files         += Dir.glob('lib/**/*.rb')
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
end
