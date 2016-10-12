lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'errors/http/version'

Gem::Specification.new do |spec|
  spec.name          = 'errors-http'
  spec.version       = Errors::HTTP::VERSION
  spec.authors       = ['Richard E. Dodson']
  spec.email         = ['richard.elias.dodson@gmail.com']

  spec.summary       = 'Ruby HTTP Errors'
  spec.homepage      = 'https://github.com/rdodson41/ruby-errors-http'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split(/\x0/).reject { |file| file =~ %r{^(test|spec|features)/} }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |file| File.basename(file) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '~> 2.0'

  spec.add_runtime_dependency 'activesupport', '~> 4.2'
  spec.add_runtime_dependency 'rack', '~> 1.6'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'codeclimate-test-reporter', '~> 0.6'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'rake', '~> 11.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.43'
  spec.add_development_dependency 'travis', '~> 1.8'
end
