lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = 'base62'
  gem.version       = '0.0.1'
  gem.license       = 'MIT'
  gem.authors       = ['Larry Fox']
  gem.email         = ['l@rryfox.us']
  gem.homepage      = 'https://github.com/larryfox/base62-ruby'
  gem.description   = 'Encode and decode base 62.'
  gem.summary       = 'Convert between base 10 and base 62.'

  gem.required_ruby_version = '>= 2.0'

  gem.files         += Dir.glob('lib/**/*.rb')
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
end
