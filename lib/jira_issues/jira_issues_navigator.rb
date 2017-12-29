module JiraIssues
  class JiraIssuesNavigator
    include JiraIssues::JiraIssueStats

    def initialize(issues)
      @issues = issues
    end

    def issues 
      @issues
    end 

    def all
      JiraIssuesNavigator.new @issues
    end

    def open
      JiraIssuesNavigator.new @issues.select {|i| i[:status] == JiraWorkflow::OPEN}
    end

    def blocked
      JiraIssuesNavigator.new @issues.select {|i| i[:status] == JiraWorkflow::BLOCKED}
    end

    def in_progress
      JiraIssuesNavigator.new @issues.select {|i| i[:status] == JiraWorkflow::IN_PROGRESS}
    end

    def closed
      JiraIssuesNavigator.new @issues.select {|i| i[:status] == JiraWorkflow::CLOSED}
    end

    def with_status(status: selected_status)
      JiraIssuesNavigator.new @issues.select {|i| i[:status] == @issue_states[selected_status]}
    end

    #aliases
    def todo
      open
    end

    def done
      closed
    end 

    def ip 
      in_progress
    end
  end
end