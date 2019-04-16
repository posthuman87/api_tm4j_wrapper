# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require File.expand_path('lib/api_tm4j_wrapper/version', __dir__)

Gem::Specification.new do |spec|
  spec.name          = 'api_tm4j_wrapper'
  spec.version       = ApiTm4jWrapper::VERSION
  spec.authors       = %w[Alec Bondar]
  spec.email         = %w[oleg@flaretech.co]

  spec.summary       = 'A gem to wrap Adaptavist Test Management API'
  spec.homepage      = 'https://github.com/posthuman87/api_tm4j_wrapper'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'faker', '~> 1.6', '>= 1.6.6'
  spec.add_runtime_dependency 'faker-medical', '~> 0.5.2'
  spec.add_runtime_dependency 'faraday', '~> 0.12.2'
  spec.add_runtime_dependency 'faraday_middleware', '~> 0.12.2'
  spec.add_runtime_dependency 'multi_json', '~> 1.12', '>= 1.12.1'
  spec.add_runtime_dependency 'simplecov', '~> 0.15.0'

  spec.add_development_dependency 'bluecloth', '~> 2.2.0'
  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'webmock', '~> 2.1'
  spec.add_development_dependency 'yard'
end
