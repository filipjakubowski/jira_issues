#@author Filip Jakubowski
module JiraIssues
  class JiraWorkflow
    OPEN        = 'Open'
    IN_PROGRESS = 'InProgress'
    BLOCKED     = 'Blocked'
    CLOSED      = 'Closed'
    # This is WIP
    # This class should be able to map and unify:
    #  - statuses
    #  - workflows
    #  - transitions
    # ATM - we will work onlu on defailt issue names

    def self.issue_status_for_name(project_key, status_name)
      {
        'Backlog'       => OPEN,
        'Open'          => OPEN,
        'To Do'         => OPEN,
        'Blocked'       => BLOCKED,
        'In Progress'   => IN_PROGRESS,
        'Specification' => IN_PROGRESS,
        'Done'          => CLOSED,
        'Closed'        => CLOSED,
        'Resolved'      => CLOSED,
      }.fetch(status_name)
    rescue KeyError => e
      p "You have issue with custom - if you want mapping to be configurable please contact me #{Gem.loaded_specs["jira_issues"].metadata.fetch('source_code_uri')}"
      raise e
    end
  end
end
