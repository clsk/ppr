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

        @resources= {}
        User.select("id, firstname, lastname").where("type = 'User'").each do |u|
            @resources[u.id]= { :name=> ("#{u.firstname} #{u.lastname}"), :selected=> false }
        end

        events= []
        if params[:selected_columns]
            params[:selected_columns].each do |r|
                @resources[r.to_i][:selected]= true
                @resources[r.to_i][:colour]= randhexlightcolour

                Issue.select("start_date, due_date, sum(estimated_hours) as estimated_hours").where("assigned_to_id = ? and ((start_date between ? and ?) or (due_date between ? and ?))", r.to_i, @calendar.startdt, @calendar.enddt, @calendar.startdt, @calendar.enddt).group("start_date, due_date").each do |i|
                    events << PPR::Events::ResourceScheduleEvent.new(i.start_date, i.due_date, r.to_i, i.estimated_hours)
                end
            end
        end

        @calendar.events= events
    end

    private
        # Amount should be a decimal between 0 and 1. Lower means darker
        def darken_colour(hex_color, amount=0.4)
            hex_color= hex_color.gsub('#','')
            rgb= hex_color.scan(/../).map { |color| color.hex }

            rgb[0]= (rgb[0].to_i * amount).round
            rgb[1]= (rgb[1].to_i * amount).round
            rgb[2]= (rgb[2].to_i * amount).round

            "%02x%02x%02x" % rgb
        end

        # Amount should be a decimal between 0 and 1. Higher means lighter
        def lighten_colour(hex_color, amount=0.6)
            hex_color= hex_color.gsub('#','')
            rgb= hex_color.scan(/../).map { |color| color.hex }

            rgb[0] = [(rgb[0].to_i + 255 * amount).round, 255].min
            rgb[1] = [(rgb[1].to_i + 255 * amount).round, 255].min
            rgb[2] = [(rgb[2].to_i + 255 * amount).round, 255].min

            "%02x%02x%02x" % rgb
        end
        def randhexlightcolour
            "##{ lighten_colour(darken_colour(("%06x" % (rand * 0xffffff)).to_s, 0.4), 0.4) }"
        end
end
