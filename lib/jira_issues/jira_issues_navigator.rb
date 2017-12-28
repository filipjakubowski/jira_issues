module JiraIssues
  class JiraIssuesNavigator
    def initialize(issues)
      @issues = issues
    end

    def all
      @issues
    end

    def todo
      @issues.select {|i| i[:status] == JiraWorkflow::OPEN}
    end

    def blocked
      @issues.select {|i| i[:status] == JiraWorkflow::BLOCKED}
    end

    def in_progress
      @issues.select {|i| i[:status] == JiraWorkflow::IN_PROGRESS}
    end

    def done
      @issues.select {|i| i[:status] == JiraWorkflow::CLOSED}
    end

    def with_status(status: selected_status)
      @issues.select {|i| i[:status] == @issue_states[selected_status]}
    end

    def created_by_week
      @issues.map { |i| { key: i[:key], week_created: Date.parse(i[:created_date]).beginning_of_week}}.group_by { |x| x[:week_created]}.map{ |k,v| [k, v.count]  }.to_h.sort
    end

    def closed_by_week
      @issues.map { |i| { key: i[:key], week_created: Date.parse(i[:closed_date]).beginning_of_week}}.group_by { |x| x[:week_created]}.map{ |k,v| [k, v.count]  }.to_h.sort
    end
  end
end