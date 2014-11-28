class UserScheduleEntryController < ApplicationController

<<<<<<< HEAD
    def create2
        parsed_json= ActiveSupport::JSON.decode(params[:entries])

        UserScheduleEntry.where(:user_id => params[:id]).delete_all
=======
    def CreateScheduleEntries
        parsed_json= ActiveSupport::JSON.decode(params[:entries])

        UserScheduleEntry.where(:user_id=> params[:id]).delete_all
>>>>>>> user_schedule
    
        parsed_json.each do |d, h|
            user_schedule= UserScheduleEntry.new()

            user_schedule.hours= h
            user_schedule.days_of_week= d
            user_schedule.user_id= params[:id]		  

            user_schedule.save
        end

<<<<<<< HEAD
        render :json=> { :size => 1 }
=======
        render :json=> { :success=> true }
>>>>>>> user_schedule
    end
end

