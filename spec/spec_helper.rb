require 'rspec'
require 'jira_issues'

require 'coveralls'
Coveralls.wear!

require 'simplecov'
SimpleCov.start

require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov
