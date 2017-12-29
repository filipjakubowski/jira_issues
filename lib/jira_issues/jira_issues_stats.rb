module JiraIssues
    module JiraIssueStats 
        def created_by_week
            @issues.map { |i| { key: i[:key], week_created: Date.parse(i[:created_date]).beginning_of_week } }.group_by { |x| x[:week_created]  }.map { |k, v| [k, v.count] }.to_h.sort
        end
    
        def closed_by_week
            @issues.select { |i| !i[:closed_date].nil? }.map { |i| { key: i[:key], week_closed: Date.parse(i[:closed_date]).beginning_of_week } }.group_by { |x| x[:week_closed]}.map { |k, v| [k, v.count] }.to_h.sort
        end
    end
end
