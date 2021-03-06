Gem::Specification.new do |spec|
  spec.name          = 'lita-whatis'
  spec.version       = '1.0.0'
  spec.authors       = ['John Dyer']
  spec.email         = ['johntdyer@gmail.com']
  spec.description   = 'A user-controlled dictionary plugin for Lita'
  spec.summary       = 'A user-controlled dictionary plugin for Lita'
  spec.homepage      = 'http://github.com/johntdye/lita-whatis'
  spec.license       = 'MIT'
  spec.metadata      = { 'lita_plugin_type' => 'handler' }

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lita', '>= 4.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'coveralls'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '>= 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov'
end
