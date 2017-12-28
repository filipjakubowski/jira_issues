require 'spec_helper'

describe JiraIssues do 
    it "filter issues" do
        issue_nav = Object.new
        allow(issue_nav).to receive(:jql_query) {
            issues = [
                {:key=>"PR-100", :type=>"Task", :priority=>"Major", :status=>"Open", :summary=>"Clean kitchen", :created_date=>"2017-12-28T13:30:30.000+0000", :closed_date=>"2017-12-28T13:30:30.000+0000"},
                {:key=>"PR-101", :type=>"Task", :priority=>"Major", :status=>"InProgress", :summary=>"Walk a dog", :created_date=>"2017-12-07T15:46:22.000+0000", :closed_date=>nil},
                {:key=>"PR-102", :type=>"Task", :priority=>"Critical", :status=>"Closed", :summary=>"Pack bagpack", :created_date=>"2017-12-21T11:15:38.000+0000", :closed_date=>"2017-12-27T13:45:06.000+0000"},
                {:key=>"PR-102", :type=>"Task", :priority=>"Critical", :status=>"Closed", :summary=>"Pay bills", :created_date=>"2017-12-21T11:15:38.000+0000", :closed_date=>"2017-12-27T13:45:06.000+0000"}
            ]
            JiraIssues::JiraIssuesNavigator.new(issues)
        }

        jn = issue_nav.jql_query 'project = "Project" and ( created > -40d )'
        expect(jn.done.count).to eq(2)
        expect(jn.open.count).to eq(1)
        expect(jn.in_progress.count).to eq(1)
        expect(jn.open.first[:priority]).to eq("Major")

        expect(jn.created_by_week.count).to eq(3)
        expect(jn.closed_by_week.count).to eq(1)
    end
end