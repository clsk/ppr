class UserScheduleExceptionController < ApplicationController
    def create2
        user_exception = UserScheduleException.new()
        user_exception.time_start = params[:exception][:start_time]
        user_exception.time_end = params[:exception][:end_time]
        user_exception.user_id = params[:user_id]
        user_exception.save
        render :json => 	{
                                :status => 1,
                                :exception_id => user_exception.id
                            }
    end
end
