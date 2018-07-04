$: << File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'trustpilot-business-links'
  s.licenses    = ['MIT']
  s.version     = '1.0.2'
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Théophile Helleboid']
  s.email       = ['theophile.helleboid@trainline.com']
  s.homepage    = 'https://github.com/trainline-eu/trustpilot-business-links'
  s.summary     = %q(Generate Trustpilot Business Generated Links)
  s.description = %q(This gem generates Trustpilot Business Generated Links described on https://support.trustpilot.com/hc/en-us/articles/115002337108-Trustpilot-s-Business-Generated-Links-)
  s.metadata    = { "source_code_uri" => "https://github.com/trainline-eu/trustpilot-business-links" }

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 2.3.0'

  s.add_dependency 'openssl', '~> 2.1'

  s.add_development_dependency 'pry', '~> 0.11'
  s.add_development_dependency 'ci_reporter', '~> 2.0'
  s.add_development_dependency 'ci_reporter_rspec', '~> 1.0'
  s.add_development_dependency 'rack-test', '~> 0.7'
  s.add_development_dependency 'rake', '~> 12.2'
  s.add_development_dependency 'rspec', '~> 3.6'
  s.add_development_dependency 'rspec-its', '~> 1.2'
  s.add_development_dependency 'simplecov', '~> 0.15'
  s.add_development_dependency 'simplecov-rcov', '~> 0.2'
end
