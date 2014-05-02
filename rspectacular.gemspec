# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspectacular/version'

Gem::Specification.new do |gem|
  gem.rubygems_version  = '1.3.5'

  gem.name              = 'rspectacular'
  gem.rubyforge_project = 'rspectacular'

  gem.version           = RSpectacular::VERSION
  gem.platform          = Gem::Platform::RUBY
  gem.license           = 'MIT'

  gem.authors           = %w{jfelchner}
  gem.email             = 'accounts+git@thekompanee.com'
  gem.date              = Time.now
  gem.homepage          = 'https://github.com/jfelchner/rspectacular'

  gem.summary           = %q{RSpec Support And Matchers}
  gem.description       = %q{We rock some RSpec configurations and matchers like it ain't nobody's bidnezz.}

  gem.rdoc_options      = ['--charset = UTF-8']
  gem.extra_rdoc_files  = %w{README.md}

  gem.executables       = Dir['{bin}/**/*'].map {|dir| dir.gsub!(/\Abin\//, '')}
  gem.files             = Dir['{app,config,db,lib}/**/*'] + %w{Rakefile README.md}
  gem.test_files        = Dir['{test,spec,features}/**/*']
  gem.require_paths     = ['lib']

  gem.add_dependency              'rspec',          '~> 3.0.beta'
  gem.add_dependency              'fuubar',         '~> 2.0.beta'
end
