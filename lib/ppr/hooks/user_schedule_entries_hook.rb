module PPR
    module Hooks
        class UserScheduleEntriesHook < Redmine::Hook::ViewListener
            render_on :view_users_form, :partial => 'ppr/user/user_schedule_entries'
        end
    end
end
