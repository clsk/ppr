module PPR
    module Events
        class ResourceScheduleEvent < BaseEvent
            attr_reader :id, :hours

            def initialize(start_date, due_date, id, hours)
                super(start_date, due_date)

                @id= id
                @hours= hours
            end
        end
    end
end
