# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |spec|
  spec.name = 'fluentd-monasca-output'
  spec.version = '1.0.2'
  spec.licenses = ['Apache-2.0']
  spec.authors = ['Fujitsu Enabling Software Technology GmbH']
  spec.email = ['atanas.mirchev@est.fujitsu.com']
  spec.description = 'Monasca output plugin for fluentd'
  spec.summary = spec.description
  spec.homepage = 'https://github.com/monasca/fluentd-monasca'

  spec.files = Dir['lib/**/*', 'spec/**/*', '*.gemspec', '*.md', 'Gemfile', 'LICENSE']
  spec.executables = spec.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'fluentd', '>= 0.10.43', '<0.14'
  spec.add_runtime_dependency 'rest-client', '~> 2.0'
  spec.add_runtime_dependency 'yajl-ruby', '~> 1.4', '>= 1.4.1'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'webmock', '~> 1'
  spec.add_development_dependency 'test-unit', '~> 3.1'
end
