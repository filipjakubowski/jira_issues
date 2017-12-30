# @author Filip Jakubowski
module JiraIssues
  class JiraQuery
    # Creates new Query object 
    # and sets the maximum number of issues returned by Query
    # @param max_results [Integer] maximum number of issues returned by query
    def initialize(max_results = 1000)
      @query_max_results = max_results
    end

    # Handles a JQL Request and returns JiraIssueavigator for that query
    # @param query [String] 
    # @return [JiraIssueNavigator] with those requests
    def jql_query(query)
      result = adapter.jql(query, fields:[:description, :summary, :created, :status, :issuetype, :priority, :resolutiondate], max_results: @query_max_results)
      JiraIssuesNavigator.new(result.map{|i| JiraIssueMapper.new.call(i) })
    end

    private
    # Provides adapter that connects to JIRA
    # @return [JiraAdapter] with those requests
    def adapter
      @adapter ||= JiraIssues::JiraAdapter.new
    end
  end
end

