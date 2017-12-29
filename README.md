jira issues
===========

[![Build Status](https://travis-ci.org/filipjakubowski/jira_issues.svg?branch=master)](https://travis-ci.org/filipjakubowski/jira_issues)

## description

Gem that allows you to navigate throu jour JIRA projects easily, get stats and in future to transit and manage tickets. 

Results of JIRA JQL are stripped to selected fields for more user friendly exposure. 

## Getting Started

First you can istall latest released version of gem from rubygems.org. 
```
gem install jira-issues
```

Than you need to set up your environment variables to access your JIRA repository. 
Please keep in mind that gem will have all and only access to issues and project that reflects access of selected account. 

- **ENV['JIRA_URL']**
- **ENV['JIRA_USERNAME']**
- **ENV['JIRA_PASSWORD']**  

## Running JQL Query

```
require 'jira_issues'
q = JiraIssues::JiraQuery.new
issues = q.jql_query 'project = "Project Name" and ( created > -40d )'
```

## Filtering issues

```
issues_navigator.open.issues -- open issues
issues_navigator.closed.issues -- closed issues
```

## Stats

```
issues_navigator.created_by_week
issues_navigator.closed_by_week
```

## JQL Library

To remove need to write your query over and over again we will provide some queries in separate class. 

```
q = JiraIssues::JiraQuery.new
issues_navigator = jq.jql_query JiraIssues::JqlLib.my_issues
issues_navigator.open.issues -- my open issues
```
