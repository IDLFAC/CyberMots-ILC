# frozen_string_literal: true

require_relative 'biliothèque/cybermots/version'

Gem::Specification.new do |s|
  s.name          = 'cybermots'
  s.version       = CyberMots::VERSION
  s.platform      = Gem::Platform::RUBY
  s.summary       = 'YAKA'
  s.description   = 'YAKA'
  s.authors       = ['Alexandre ZANNI']
  s.email         = 'alexandre.zanni@europe.com'
  s.homepage      = 'https://idlfac.github.io/CyberMots-ILC/'
  s.license       = 'MIT'

  s.files         = Dir['binaires/*', 'biliothèque/**/*.rb', 'données/*.json', 'LICENSE.txt']
  s.bindir        = 'binaires'
  s.executables   = s.files.grep(%r{^binaires/}) { |f| File.basename(f) }
  s.require_paths = ['biliothèque']

  s.metadata = {
    'yard.run' => 'yard',
    'bug_tracker_uri' => 'https://github.com/IDLFAC/CyberMots-ILC/issues',
    'changelog_uri' => 'https://github.com/IDLFAC/CyberMots-ILC/blob/master/docs/CHANGELOG.md',
    'documentation_uri' => 'https://idlfac.github.io/CyberMots-ILC/',
    'homepage_uri' => 'https://idlfac.github.io/CyberMots-ILC/',
    'source_code_uri' => 'https://github.com/IDLFAC/CyberMots-ILC/',
    'rubygems_mfa_required' => 'true'
  }

  s.required_ruby_version = ['>= 3.0.0', '< 4.0']

  s.add_runtime_dependency('docopt', '~> 0.6')
  s.add_runtime_dependency('paint', '~> 2.2')
end
