module JiraIssues
  class JiraQuery
    def initialize(max_results = 1000)
      @query_max_results = max_results
    end

    def jql_query(query)
      result = adapter.jql(query, fields:[:description, :summary, :created, :status, :issuetype, :priority, :resolutiondate], max_results: @query_max_results)
      JiraIssuesNavigator.new(result.map{|i| JiraIssueMapper.new.call(i) })
    end

    private
    def adapter
      @adapter ||= JiraIssues::JiraAdapter.new
    end
  end
end

