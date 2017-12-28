require 'jira-ruby'

module JiraIssues
  class JiraAdapter
    def create_task(task)
      issue = client.Issue.build
      issue.save(task.print)
    end

    def available?
      response = client.get('/')
      response.code == '200'
    end

    def jql(jql_query, fields)
      client.Issue.jql(jql_query, fields)
    end

    private

    def client
      @client = JIRA::Client.new(
          username: ENV['JIRA_USERNAME'],
          password: ENV['JIRA_PASSWORD'],
          site: ENV['JIRA_URL'],
          context_path: '',
          auth_type: :basic,
          read_timeout: 120
      )
    end
  end
end