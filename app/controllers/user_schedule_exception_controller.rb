class UserScheduleExceptionEntryController < ApplicationController
    def create2
		parsed_json = ActiveSupport::JSON.decode(params[:exception])
        parsed_json.each do |start_time, end_time|
		  user_exception = UserScheduleExceptionEntry.new()
		  user_exception.start_time = start_time
          user_exception.end_time = end_time
		  user_exception.user_id = params[:user_id]
		  user_exception.save
		end
		render :json => 	{
								:status => 1,
                                :exception_id => user_exception.id
							}
    end
end
