module JiraIssues
  class JiraIssueMapper
    # WIP
    # ATM mapper serialises issue to JSON
    # We might consider using objects

    def call(issue)
      status = decode_status(issue)
      {
          key: issue.key,
          type: issue.issuetype.name,
          priority: issue.priority.name,
          status: status,
          #description: i.description,
          summary: issue.summary,
          created_date: issue.created,
          closed_date: issue.resolutiondate
      }
    end

    private

    def decode_status(issue)
      JiraIssues::JiraWorkflow.issue_status_for_name(project_key(issue),issue.status.name)
    end

    def project_key(issue)
      issue.key.split('-').first
    end
  end
end
