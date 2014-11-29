module PPR
    module Events
        class BaseEvent
            attr_reader :start_date, :due_date

            def initialize(start_date, due_date)
                @start_date= start_date
                @due_date= due_date
            end

            def color
                "#d3d3d3"
            end
        end
    end
end
