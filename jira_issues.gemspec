$:.push File.expand_path("../lib", __FILE__)

require "jira_issues/version"

Gem::Specification.new do |s|
  s.name        = 'jira-issues'
  s.version     = JiraIssues::VERSION

  ## Edit these as appropriate
  s.summary     = "Jira Issues"
  s.description   = %q{Jira Issues gem that supports quering and filtering data for external reporting and integrations.}

  s.authors       = ["Filip Jakubowski-Drzrwiecki"]
  s.email         = ["don.o.phelippe@gmail.com"]
  s.homepage      = 'https://github.com/filipjakubowski'
  s.metadata      = { "source_code_uri" => "https://github.com/filipjakubowski/jira_issues" }

  s.rubyforge_project = "jira_issues"

  s.require_paths = %w[lib]
  s.files         = `git ls-files -- {lib}/*`.split("\n")
  
  s.add_dependency 'jira-ruby', '~>1.4.3'

  ## List your development dependencies here. Development dependencies are
  ## those that are only needed during development
  s.add_development_dependency "rake", '>=12.3.0'
  s.add_development_dependency "rspec", '>=3.7.0'

  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  ## Test files will be grabbed from the file list. Make sure the path glob
  ## matches what you actually use.
  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }
end