module JiraIssues
    class JqlLib
        def self.my_issues
            "assignee = currentUser()"
        end

        def self.issues_for_user(user)
            "assignee = #{user}"
        end
    end
end