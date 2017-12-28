module JiraIssues
  class JiraWorkflow
    OPEN = 'Open'
    IN_PROGRESS = 'InProgress'
    BLOCKED = 'Blocked'
    CLOSED = 'Closed'
    # This is WIP
    # This class should be able to map and unify:
    #  - statuses
    #  - workflows
    #  - transitions
    # ATM - we will work onlu on defailt issue names

    def self.issue_status_for_status_name(project_key, status_name)
      {
        'Backlog' => OPEN,
        'Blocked' =>  BLOCKED,
        'In Progress' => IN_PROGRESS,
        'Done' => CLOSED
      }.fetch(status_name, nil)
    end
  end
end
