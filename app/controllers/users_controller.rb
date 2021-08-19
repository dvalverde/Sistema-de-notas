class UsersController < ApplicationController

    def index
        redirect_to new_user_url
    end

    def new
        @user = User.new()
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to login_url
        else
            render 'new'
        end
    end

    private
        def user_params
            params.require(:user).permit(:username, :password, :password_confirmation)
        end

end
