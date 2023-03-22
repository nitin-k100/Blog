module ValidationHelper
    def validate_user
        if(current_user.nil?)
            flash[:error] = "You must be logged in to access this section"
        end
    end
end

     