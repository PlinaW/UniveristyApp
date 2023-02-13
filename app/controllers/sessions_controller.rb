class SessionsController < ApplicationController

    skip_before_action :require_user, only: [:new, :create]

    def new
        
    end

    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "You have successfully logged in"
            redirect_to user    
        else
            flash.now[:alert] = "Somthing was wrong with your loggin information"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "You have successfully logged out"
        redirect_to root_path
    end

    
end