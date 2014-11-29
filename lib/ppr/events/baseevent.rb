module PPR
    module Events
        class BaseEvent
            attr_reader :startdt, :duedt

            def initialize(startdt, duedt)
                @startdt= startdt
                @duedt= duedt
            end

            def css_classes
                raise "Not implemented method"
            end
        end
    end
end
