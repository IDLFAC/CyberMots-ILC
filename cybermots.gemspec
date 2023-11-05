# frozen_string_literal: true

require_relative 'biliothèque/cybermots/version'

Gem::Specification.new do |s|
  s.name          = 'cybermots'
  s.version       = CyberMots::VERSION
  s.platform      = Gem::Platform::RUBY
  s.summary       = 'ILC pour CyberMots'
  s.description   = 'CyberMots est le dictionnaire francophone de la cybersécurité ; cet outil en ligne de commande '
  s.description += 'permet de chercher et lister des traductions disponibles sur le site'
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
    'changelog_uri' => 'https://github.com/IDLFAC/CyberMots-ILC/blob/master/JOURNAL-DES-MODIFICATIONS.md',
    'documentation_uri' => 'https://www.rubydoc.info/gems/cybermots',
    'homepage_uri' => s.homepage,
    'source_code_uri' => 'https://github.com/IDLFAC/CyberMots-ILC/',
    'rubygems_mfa_required' => 'true'
  }

  s.required_ruby_version = ['>= 3.0.0', '< 4.0']

  s.add_runtime_dependency('tty-option', '~> 0.3.0')
  s.add_runtime_dependency('tty-screen', '~> 0.8.1')
end
