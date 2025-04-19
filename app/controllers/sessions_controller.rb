class SessionsController < ApplicationController

    def index 
    end

    def create
        user = User.find_by(email: params[:email])
    
        if user&.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to root_path, notice: "Welcome, #{user.name}"
        else
          flash.now[:alert] = "Email or password invalid"
          render :new, status: :unprocessable_entity
        end
      end
    
      def destroy
        session[:user_id] = nil
        redirect_to login_path, notice: "Session ended"
      end
    end
