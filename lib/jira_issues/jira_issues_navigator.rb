module JiraIssues
  class JiraIssuesNavigator
    def initialize(issues)
      @issues = issues
    end

    def all
      @issues
    end

    def open
      @issues.select {|i| i[:status] == JiraWorkflow::OPEN}
    end

    def blocked
      @issues.select {|i| i[:status] == JiraWorkflow::BLOCKED}
    end

    def in_progress
      @issues.select {|i| i[:status] == JiraWorkflow::IN_PROGRESS}
    end

    def closed
      @issues.select {|i| i[:status] == JiraWorkflow::CLOSED}
    end

    def with_status(status: selected_status)
      @issues.select {|i| i[:status] == @issue_states[selected_status]}
    end

    def created_by_week
      @issues.map { |i| { key: i[:key], week_created: Date.parse(i[:created_date]).beginning_of_week}}.group_by { |x| x[:week_created]}.map{ |k,v| [k, v.count]  }.to_h.sort
    end

    def closed_by_week
      @issues.select{|i| !i[:closed_date].nil? }.map { |i| { key: i[:key], week_closed: Date.parse(i[:closed_date]).beginning_of_week}}.group_by { |x| x[:week_closed]}.map{ |k,v| [k, v.count]  }.to_h.sort
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