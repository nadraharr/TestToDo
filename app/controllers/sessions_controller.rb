class SessionsController < ApplicationController
    
    def new
        @current_page = "login"
    end

    def create
        user = User.find_by email: params[:email]
        if user&.authenticate(params[:password])
            sign_in(user)
            redirect_to root_path
        else
            redirect_to new_session_path
        end
    end

    def destroy
        sign_out
        redirect_to root_path
    end
end