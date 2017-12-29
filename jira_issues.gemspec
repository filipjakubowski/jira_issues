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
  s.homepage =    'https://github.com/filipjakubowski'

  s.rubyforge_project = "jira_issues"

  s.require_paths = %w[lib]
  s.files         = `git ls-files`.split("\n")
  # s.files = %w{lib/jira_issues.rb lib/jira_issues/jira_adapter.rb lib/jira_issues/jira_issue_mapper.rb lib/jira_issues/jira_issues_navigator.rb lib/jira_issues/jira_workflow.rb lib/jira_issues/jira_query.rb lib/jira_issues/jira_issues_stats.rb lib/jira_issues/jql_lib.rb}

  s.add_dependency 'jira-ruby'
  s.add_dependency 'byebug'

  ## List your development dependencies here. Development dependencies are
  ## those that are only needed during development
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rubocop"

  s.add_development_dependency 'fakeweb'
  s.add_development_dependency 'pry'

  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")

  ## Test files will be grabbed from the file list. Make sure the path glob
  ## matches what you actually use.
  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }
end