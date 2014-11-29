class ResourcesController < ApplicationController
    unloadable

    def show
        if params[:year] and params[:year].to_i >= Date.today.year
            @year = params[:year].to_i

            if params[:month] and params[:month].to_i > 0 and params[:month].to_i < 13
                @month = params[:month].to_i
            end
        end

        @year||= Date.today.year
        @month||= Date.today.month

        @calendar = Redmine::Helpers::Calendar.new(Date.civil(@year, @month, 1), current_language, :month)

        events= []
        @resources= []
        if params[:selected_columns]
            params[:selected_columns].each do |r|
                @resources << r.to_i
                Issue.select("start_date, due_date, sum(estimated_hours) as estimated_hours").where("assigned_to_id = ? and ((start_date between ? and ?) or (due_date between ? and ?))", r.to_i, @calendar.startdt, @calendar.enddt, @calendar.startdt, @calendar.enddt).group("start_date, due_date").each do |i|
                    events << PPR::Events::ResourceScheduleEvent.new(i.start_date, i.due_date, r.to_i, i.estimated_hours)
                end
            end
        end

        @calendar.events= events
        @users= User.select("id, firstname, lastname").order("firstname, lastname")
    end
end
