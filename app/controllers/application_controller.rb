class ApplicationController < ActionController::Base
   before_action :current_user

   def current_user
    if session["user_id"]
       @current_user = User.find(session["user_id"])
    end  
   end

   def destroy 
    session["user_id"] = nil
    flash[:notice] = "You have been logged out"
    redirect_to "/sessions/new" 
   end
end
