class SessionsController < ApplicationController

    def new
    end

    def create
        entered_email = params["email"]
        entered_password = params["password"]
        # checking the email
        @user = User.find_by({email: entered_email})
        
        if @user # yes, email matches
            # check the password
            if BCrypt::Password.new(@user.password) == entered_password
                # yay! 
                session["user_id"] = @user.id
                flash[:notice] = "Welcome!"
                redirect_to "/companies"
            else 
                # password doesnt match!

                flash[:notice] = "Password is incorect"
                redirect_to "/sessions/new"
            end 
        else 
            # email doesnt match, send back to the login page
            flash[:notice] = "No user with that email address"
            redirect_to "/sessions/new" 
        end 
    end

    def destory 
        session["user_id"] = nil
        flash[:notice] = "You have been logged out"
        redirect_to "/sessions/new"
    end
end
