class UserScheduleEntry < ActiveRecord::Base
  unloadable

    def to_s
        str= ""
        str_days= self.days_of_week.to_s(2)
        days= ["Sun", "Mon", "Tues", "Wed", "Thu", "Fri", "Sat"]

        for i in 1 .. days.length
            str+= day[i] + "," if str_days[i] == 1
        end

        str+= " - " + self.hours
        str
    end
end
