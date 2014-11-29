module PPR
    module Events
        class BaseEvent
            attr_reader :start_date, :duedt

            def initialize(start_date, due_date)
                @start_date= start_date
                @duedt= due_date
            end
        end
    end
end
